title=Flutter Profiling
tags=platform, flutter, android, ios, windows, macos, linux, browser
summary=Tips and notes on profiling Flutter applications.
~~~~~~

Always profile in Profile mode:
        
        # Profile mode matches production performance with DevTools still connected
        flutter run --profile

The performance overlay can also be enabled directly in the app during development, giving an immediate visual signal of frame budget violations without opening DevTools:

```dart
MaterialApp(
  // Two bars appear at the top of the screen.
  // Top bar: UI thread. Bottom bar: raster thread.
  // Green means within budget. Red means over budget.
  showPerformanceOverlay: true,
  home: const MyScreen(),
)
```

## The Performance View: Reading the Frame Timeline

The Performance view is the starting point for any jank investigation. Interact with the app while watching the frame chart fill in — scroll a list, trigger an animation, and navigate between screens.

### The Frame Chart

Each vertical bar represents one frame. Height represents duration. The red horizontal line marks the 16ms budget.

```plaintext
Frame chart:
     ▲ ms
  28 │           ██
  20 │           ██
  16 │─────────────────── red line (16ms budget)
  12 │ ██  ██    ██  ██
   8 │ ██  ██    ██  ██
   0 └─────────────────────────────→ frames
       ok  ok  JANK  ok
```

Any bar above the red line is a janky frame. Clicking on it reveals the detailed breakdown of what happened during that specific frame.

### The Two Threads

Clicking a janky frame shows a flame chart split into two sections:

```plaintext
UI Thread     ████████████████░░░░  — Dart code execution
Raster Thread ████░░░░░░░░░░░░      — GPU work
```

A tall UI thread bar indicates that Dart code is the problem. A tall raster thread bar indicates that the GPU is struggling with paint operations.

### Reading the Flame Chart

The flame chart is a horizontal bar chart. Each row is a function call. Width represents duration. Rows are stacked to show the call hierarchy.

```plaintext
Frame (28ms total)
├── dart:ui (16ms)
│   └── build (14ms)
│       ├── ExpensiveList.build (8ms)
│       │   └── _buildItem (8ms)     ← wide bar = expensive
│       └── AppBar.build (2ms)
└── layout (4ms)
```

The widest bars near the top of the stack are the functions consuming the most time. Everything beneath them shows only what called them.

## The CPU Profiler: Finding the Root Cause

The Performance view identifies that a frame was slow. The CPU Profiler identifies exactly which function caused it.

### Recording a Profile

1.  Open the CPU Profiler tab in DevTools
2.  Click Record
3.  Reproduce the janky interaction
4.  Click Stop
5.  DevTools builds a flame graph from the recording

### Reading the Flame Graph

```plaintext
CPU Profiler flame graph:
                                         ← time →
_CounterScreenState.build [████████████████] 45ms
  Column.build            [████████████   ] 35ms
    ExpensiveWidget.build [████████████   ] 35ms
      _buildRows          [████████       ] 25ms
        jsonDecode        [████████       ] 25ms  ← root cause
```

The widest bars indicate where time is being spent. In this example, `jsonDecode` is being called inside a build method — running on every rebuild rather than once outside the widget tree.

### The Bottom-up Table

The bottom-up table shows which individual functions are doing the most direct work:

-   **Self time**: time spent inside the function itself, excluding functions it called. High self time means this function is intrinsically expensive.
-   **Total time**: time including all downstream function calls. High total time means this function triggers expensive work somewhere below it.

Sorting by self time identifies the root cause. Sorting by total time identifies the trigger.

### Fixing a CPU-bound Bottleneck

Parsing large responses synchronously on the main isolate is one of the most common causes of UI thread jank. The fix is moving that work to a separate isolate:

```dart
// Before — blocking the main isolate on every search result
Future<List<User>> processResults(dynamic data) async {
  return (data as List)
      .map((json) => User.fromJson(json))
      .toList();
}

// After — parsing in a background isolate
// The main isolate stays free to render frames
// while parsing happens concurrently
Future<List<User>> processResults(dynamic data) async {
  return Isolate.run(() {
    return (data as List)
        .map((json) => User.fromJson(json as Map<String, dynamic>))
        .toList();
  });
}
```

One caveat worth understanding: passing a large object graph into `Isolate.run` copies that data across the isolate boundary. For massive payloads, that copying overhead can rival the cost of the work being offloaded.

The safer pattern for large JSON responses is to pass the raw response string into the isolate and parse it there, rather than passing an already-decoded object:

```dart
// Safer for large payloads — the raw string is copied
// into the isolate, parsed there, and only the final
// typed list is copied back. No intermediate object graph crossing.
Future<List<User>> processResults(String rawJson) async {
  return Isolate.run(() {
    final data = jsonDecode(rawJson) as List;
    return data
        .map((json) => User.fromJson(json as Map<String, dynamic>))
        .toList();
  });
}
```

## The Flutter Inspector: Hunting Unnecessary Rebuilds

Not all jank comes from expensive individual operations. Some comes from too many rebuilds — widgets that don't need to update rebuilding anyway because a parent called `setState`.

### Enabling Rebuild Counting

In the DevTools Inspector tab, open settings and enable "Track widget build counts." Interact with the app and DevTools displays rebuild counts next to each widget:

```plaintext
Widget Tree with rebuild counts:
MyApp                         0 rebuilds
└── MaterialApp               0 rebuilds
    └── CounterScreen         0 rebuilds
        └── Scaffold          0 rebuilds
            └── Column       24 rebuilds
                ├── Text     24 rebuilds  — necessary
                ├── Text     24 rebuilds  — necessary
                └── ExpensiveList  24 rebuilds  — PROBLEM
```

`ExpensiveList` rebuilds 24 times despite having no dependency on the counter state. It rebuilds because it lives in the same subtree as the widgets that do need to update.

### Fixing Unnecessary Rebuilds by Extracting State

The solution is extracting the stateful portion into its own widget. Only that widget rebuilds when state changes. Everything else is untouched.

```dart
// Before — the entire Scaffold rebuilds on every setState
class _CounterScreenState extends State<CounterScreen> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('Count: $_count'),
          ElevatedButton(
            onPressed: () => setState(() => _count++),
            child: const Text('Increment'),
          ),
          // This never changes but rebuilds on every tap
          const ExpensiveList(),
        ],
      ),
    );
  }
}
```

```dart
// After — CounterDisplay owns its own state
// ExpensiveList never rebuilds
class CounterDisplay extends StatefulWidget {
  const CounterDisplay({super.key});

  @override
  State<CounterDisplay> createState() => _CounterDisplayState();
}

class _CounterDisplayState extends State<CounterDisplay> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Count: $_count'),
        ElevatedButton(
          onPressed: () => setState(() => _count++),
          child: const Text('Increment'),
        ),
      ],
    );
  }
}

// The screen is now stateless — it never rebuilds
class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          CounterDisplay(),   // rebuilds when count changes
          ExpensiveList(),    // never rebuilds
        ],
      ),
    );
  }
}
```

### Using RepaintBoundary to Isolate Expensive Painting

When one section of the UI repaints frequently while adjacent sections remain static, `RepaintBoundary` places those sections on separate layers. The frequently-updated section repaints independently without touching the static content.

```dart
// Without RepaintBoundary — the animation causes
// the entire Column to repaint on every frame
Column(
  children: [
    AnimatedWidget(controller: _controller),
    const ExpensiveStaticContent(),
  ],
)

// With RepaintBoundary — ExpensiveStaticContent
// lives on its own layer and is never repainted
// during the animation
Column(
  children: [
    AnimatedWidget(controller: _controller),
    const RepaintBoundary(
      child: ExpensiveStaticContent(),
    ),
  ],
)
```

`RepaintBoundary` should be used deliberately, not broadly. Every boundary creates an additional compositing layer the GPU must handle. Overuse introduces raster thread overhead that offsets any UI thread savings.

## The Memory View: Catching Leaks Before Users Do

Jank from memory leaks behaves differently from other types. It doesn't appear immediately.

The app performs well for the first several minutes, then degrades progressively as memory climbs and the garbage collector works harder to reclaim space. By the time a user reports erratic behavior or slowdowns, the leak has been accumulating for a while.

### What a Memory Leak Looks Like in DevTools

The Memory view charts heap usage over time. A healthy app shows a sawtooth pattern — memory rises as objects are allocated, then drops sharply when the garbage collector runs.

```plaintext
Healthy memory:
     ▲ MB
  60 │     ▲       ← GC runs, heap returns to baseline
  40 │   ██│██
  20 │ ██  │  ██▼  ← rises then drops back down
   0 └──────────────→ time
       stable baseline

Memory leak:
     ▲ MB
  80 │               ██
  60 │         ████
  40 │    ████         ← never returns to baseline
  20 │████
   0 └──────────────→ time
       baseline rising
```

### Finding a Leak

The process for isolating a leak:

1.  Open the Memory view and note the current heap size
2.  Navigate to the suspected screen
3.  Navigate away from it
4.  Click the GC button in DevTools to force garbage collection
5.  Observe the heap: if it doesn't drop to near its previous level, something from that screen is still reachable

Taking a snapshot before and after the navigation and comparing the two reveals which objects remained in memory when they should have been collected.

### The Most Common Sources of Leaks

**Undisposed AnimationController:**

```dart
class _AnimatedScreenState extends State<AnimatedScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  void dispose() {
    // Without this, the Ticker fires on every frame
    // indefinitely, holding the State in memory
    _controller.dispose();
    super.dispose();
  }
}
```

**Uncanceled StreamSubscription:**

```dart
class _ChatScreenState extends State<ChatScreen> {
  StreamSubscription<Message>? _subscription;

  @override
  void initState() {
    super.initState();
    _subscription = messageStream.listen((message) {
      if (mounted) setState(() => messages.add(message));
    });
  }

  @override
  void dispose() {
    // Without cancel(), the stream holds a reference
    // to this callback, which holds a reference to
    // the State, preventing garbage collection
    _subscription?.cancel();
    super.dispose();
  }
}
```

Anything created in `initState` that exposes a `dispose()`, `cancel()`, or `close()` method requires that method to be called in `dispose()`. There are no exceptions to this rule.

## Fixing the Most Common Jank Patterns

DevTools consistently surfaces the same categories of jank in production Flutter apps. The fixes are direct once the root cause is known.

### Expensive Synchronous Work on the Main Isolate

DevTools signal: tall UI thread bar, CPU Profiler shows parsing or sorting functions with high self time.

```dart
// Before — sorting 10,000 items synchronously
// blocks the main isolate for 80-200ms on slower devices
final sorted = List.from(items)
  ..sort((a, b) => a.name.compareTo(b.name));

// After — sorting in a background isolate
final sorted = await Isolate.run(() {
  final copy = List.from(items);
  copy.sort((a, b) => a.name.compareTo(b.name));
  return copy;
});
```

### Future Created Inside Build

DevTools signal: Network view shows duplicate API calls for the same endpoint. CPU Profiler shows network functions called multiple times per user interaction.

```dart
// Before — a new Future is created on every rebuild.
// FutureBuilder treats each new Future as a fresh
// operation and resets to loading state.
@override
Widget build(BuildContext context) {
  return FutureBuilder(
    future: repository.fetchUser(userId),
    builder: (context, snapshot) { ... },
  );
}

// After — the Future is created once in initState
// and reused across all subsequent rebuilds
late final Future<User> _userFuture;

@override
void initState() {
  super.initState();
  _userFuture = repository.fetchUser(widget.userId);
}

@override
Widget build(BuildContext context) {
  return FutureBuilder(
    future: _userFuture,
    builder: (context, snapshot) { ... },
  );
}
```

### Large List Rendered as a Column

DevTools signal: the first frame after navigating to a list screen is significantly slower than subsequent frames. Inspector shows a Column with hundreds of children.

```dart
// Before — builds all items at once regardless
// of how many are currently visible
Column(
  children: items
      .map((item) => ItemCard(item: item))
      .toList(),
)

// After — builds only the items currently
// visible on screen plus a small buffer
ListView.builder(
  itemCount: items.length,
  itemBuilder: (context, index) {
    return ItemCard(item: items[index]);
  },
)
```

### Animated Opacity Causing Raster Thread Jank

DevTools signal: tall raster thread bar. Flame chart shows SaveLayer operations during animation.

`Opacity` with a changing value forces Flutter to render the child widget to an offscreen buffer on every frame before compositing it at the target opacity. This SaveLayer operation is one of the most expensive things the raster thread can do.

A note on Impeller: Flutter's newer rendering backend, Impeller — now the default on iOS and rolling out on Android — significantly reduces the penalty of SaveLayer operations and eliminates the shader compilation jank that affected the older Skia engine.

If the app targets only recent Flutter versions with Impeller enabled, raster thread jank from Opacity animations may be less severe than on Skia. The guidance to prefer `FadeTransition` over animated `Opacity` still holds, but the urgency is lower on Impeller than it was historically.

```dart
// Bad — Opacity with a changing value creates a SaveLayer
// on every animation frame, causing raster thread jank
Opacity(
  opacity: _animationValue,
  child: myWidget,
)

// Good — FadeTransition uses the compositor directly
// without a SaveLayer offscreen buffer
FadeTransition(
  opacity: _animation,
  child: myWidget,
)
```

## Verifying Your Fix Actually Worked

Performance optimisation has a tendency to move the bottleneck rather than eliminate it. Fixing one slow function sometimes reveals that the next-slowest operation now dominates the frame time.

Measuring before and after every fix prevents this from becoming invisible.

The verification process:

1.  Profile in profile mode before making any changes
2.  Record the worst-case frame time during the problematic interaction
3.  Note which thread is the bottleneck
4.  Apply the fix
5.  Profile again under identical conditions
6.  Compare frame times and thread breakdowns

Frame timings can also be captured programmatically, which is useful for tracking improvements over time or validating fixes in CI:

```dart
WidgetsBinding.instance.addTimingsCallback((timings) {
  for (final timing in timings) {
    if (timing.totalSpan.inMilliseconds > 16) {
      debugPrint(
        'Slow frame: ${timing.totalSpan.inMilliseconds}ms '
        'build: ${timing.buildDuration.inMilliseconds}ms '
        'raster: ${timing.rasterDuration.inMilliseconds}ms',
      );
    }
  }
});
```

If measurements improve consistently after a fix, the root cause was correctly identified. If measurements don't improve, the real bottleneck is elsewhere and another round of profiling is needed before changing more code.
