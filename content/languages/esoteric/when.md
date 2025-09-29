title=WHEN
tags=language, esoteric
summary=A domain-specific language for reactive programming with implicit iteration, lifecycle management, and Python interoperability. loop-based programming language where everything runs in implicit loops with conditional execution.
~~~~~~

[Website](https://whenlang.com/) | [Source](https://github.com/PhialsBasement/WHEN-Language) 

A unique loop-based programming language where everything runs in implicit loops with conditional execution.

## Features

- **Implicit Main Loop**: Everything in `main:` runs continuously
- **Block Types**:
  - `os name():` - One Shot (run once when called)
  - `de name(n):` - Declarative (run exactly n times)
  - `fo name():` - Forever (run until stopped)
- **Conditional Execution**: `when condition:` for reactive programming
- **Block Lifecycle**: `.start()` and `.stop()` for managing execution
- **Python Integration**: Import and use Python modules
- **Function Support**: Define reusable functions with `def`

## Installation

### Option 1: Direct Usage
```bash
# Clone or download the WHEN interpreter
git clone https://github.com/PhialsBasement/WHEN-Language.git
cd WHEN-Language

# Run WHEN programs
python when.py program.when
```

### Option 2: Install as Command
```bash
# Install globally with pip
pip install -e . 
pip install when-lang

# Now use the 'when' command
when program.when
```

### Option 3: Add to PATH (Windows)
```cmd
# Copy when.bat to a directory in your PATH, or add the whenloop directory to PATH
when program.when
```

### Option 4: Add to PATH (Unix/Linux/macOS)
```bash
# Make the script executable and copy to PATH
chmod +x when
cp when /usr/local/bin/

# Or add the whenloop directory to your PATH
when program.when
```

## Usage

```bash
when program.when           # Run a WHEN program
when -i                     # Interactive mode (limited)
when --version              # Show version
when --help                 # Show help
```

## Quick Example

```when
# hello.when
count = 0

os setup():
    print("Starting up...")

fo counter():
    count = count + 1
    print("Count:", count)
    when count >= 5:
        break

main:
    when count == 0:
        setup()
        counter.start()

    when count >= 5:
        print("Done!")
        exit()
```

Run with: `when hello.when`

## Language Syntax

### Variables
```when
x = 10
name = "Alice"
active = 1
```

### Functions
```when
def add(a, b):
    return a + b

result = add(5, 3)
```

### Imports
```when
import math
from time import sleep
from random import randint as rand_int

angle = math.sin(math.pi / 4)
sleep(1)
num = rand_int(1, 10)
```

### Blocks
```when
# One-shot execution
os initialize():
    print("Setting up...")

# Run exactly 5 times
de heartbeat(5):
    print("Beat")

# Run forever until stopped
fo monitor():
    check_status()
    when error_detected():
        break
```

### Main Loop
```when
main:
    # Setup (runs once)
    when not_started:
        initialize()
        heartbeat.start()
        monitor.start()
        not_started = 0

    # Conditional logic
    when heartbeat_complete():
        monitor.stop()
        exit()
```

## Advanced Features

### Cooperative Scheduling
All blocks run cooperatively in the main loop - no threading complexity.

### State Management
Variables persist between loop iterations, enabling stateful reactive programming.

### Lifecycle Control
Start and stop execution blocks dynamically based on conditions.

### Python Integration
Access the full Python ecosystem within WHEN programs.

## Examples

See the included example programs:
- `clock.when` - Simple clock implementation
- `traffic_light.when` - Traffic light simulation
- `restaurant_sim.when` - Complex restaurant management system
- `tic_tac_toe.when` - Interactive game with AI
- `python_modules_demo.when` - Python integration showcase

## Contributing

WHEN is a experimental language. Contributions welcome for:
- Language features
- Standard library
- Documentation
- Examples
- Performance improvements
