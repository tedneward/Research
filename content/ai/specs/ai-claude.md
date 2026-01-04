title=Claude Code CLAUDE.md file examples
tags=ai, agent, coding
summary=Example CLAUDE.md scripts and links
~~~~~~

## Links

- [Random Claude skills for common, simple programming tasks](https://github.com/NTCoding/claude-skillz)

## Examples

### [Sam Hatoum](https://gist.github.com/SamHatoum/8235db605e547754be4a7d5f7053abe7)

        # Development Guide

        ## Pomodoro + TDD + TCR + 100% Coverage

        ```
        ╔═════════════════════════════════════════════════════════════════════╗
        ║   Red ───► Green ───►[TCR]───► Refactor ───►[TCR]───► Done          ║
        ║                                                                     ║
        ║   [TCR] = test ──┬── pass ──► commit ──► continue                   ║
        ║                  └── fail ──► REVERT ──► RETHINK                    ║
        ║                                                                     ║
        ║   REVERT means STOP. Don't fix in place.                            ║
        ║   RETHINK means try again with SMALLER STEPS OR try a NEW DESIGN    ║
        ╚═════════════════════════════════════════════════════════════════════╝
        ```

        ---

        ## 🍅 Pomodoro Workflow

        One atomic test + implementation per cycle (5-15 min).

        **Planning a Pomodoro:**

        - Independent, valuable, small, testable
        - Define: value added, code surface size (S/M/L), complexity (S/M/L)
        - 1-2 line approach description
        - Create `pomodoro-plan.md` with sections: TODO / DONE
        - Commit the plan with initial pomodoros

        **Execution:**

        1. Write ONE failing test (Red)
        2. Write MINIMAL code to pass (Green)
        3. TCR: `test && commit || revert` (include plan update)
        4. Refactor if needed
        5. TCR: `test && commit || revert`
        6. Move pomodoro to DONE in the `pomodoro-plan.md`, commit with TCR

        **TCR Command:**

        ```bash
        pnpm test --run && \
        git add -A && git commit -m "<COMMITIZEN FORMAT>" || \
        git checkout -- packages/<package>/
        ```

        ---

        ## 🎯 TDD + 100% Coverage

        All thresholds enforced at 100%. Tests drive the code.

        | Do                              | Don't                                    |
        | ------------------------------- | ---------------------------------------- |
        | Let tests drive all code        | Write code without a failing test first  |
        | Add branches only when tested   | Defensive `??`, `?:`, `if/else` untested |
        | Test all error paths            | Leave error handling unverified          |
        | Remove dead code after each run | Keep unused code "just in case"          |

        **NEVER Exclude Files to Dodge Coverage**

        ```
        ╔══════════════════════════════════════════════════════════════════════╗
        ║  Excluding a file from coverage to avoid testing it is FORBIDDEN.    ║
        ║  "Hard to test" code (file system, dynamic imports, network, etc.)   ║
        ║  → Inject dependencies and mock them. That's what mocks are for.     ║
        ╚══════════════════════════════════════════════════════════════════════╝
        ```

        Coverage exclusions are ONLY for:
        - Type-only files (interfaces, type definitions)
        - Barrel exports (index.ts re-exports)
        - Files that are genuinely 0% logic (pure declarations)

        If you're tempted to exclude a file because it's "infrastructure" or "integration-focused" — STOP. The coverage requirement exists precisely to force testable design.

        ---

        ## 🧠 Design Philosophy

        ### Behavior First, Everything Else Emerges
        ```
        ╔═══════════════════════════════════════════════════════════════════════╗
        ║  Start with BEHAVIOR. Always.                                         ║
        ║  Types, interfaces, data structures — these emerge to serve behavior. ║
        ║  If it doesn't affect runtime outcomes, it's not the design.          ║
        ╚═══════════════════════════════════════════════════════════════════════╝
        ```

        **The Core Insight:**

        Software exists to *do things*. A program that compiles perfectly but produces wrong outputs is worthless. A program with ugly types that produces correct outputs is valuable. This tells us where to focus.

        Behavior is the only thing that matters at runtime. Everything else — types, interfaces, abstractions, patterns — exists solely to help us write correct behavior more reliably.

        **The Wrong Way (Structure-First):**
        ```
        1. Design the data shapes / types / interfaces
        2. Define the abstractions and relationships  
        3. Finally, implement the actual behavior
        ```

        This is backwards. You're making decisions about shape before you understand what transformations you need. You're building a warehouse before you know what you're storing.

        **The Right Way (Behavior-First):**
        ```
        1. What OUTCOME do I need? (input → output)
        2. Write a test that asserts on that outcome
        3. Implement the simplest code that produces the outcome
        4. Let structure emerge to support the behavior
        ```

        **Why This Works:**

        - You only create structure that's *actually needed*
        - Tests verify behavior, which implicitly validates any supporting structure
        - You discover the real shape of data by *using* it, not by speculating
        - Refactoring is safe because behavior is locked in by tests

        **Practical Rule:**

        Your first test for any feature should call a **function** and assert on its **output**. Whatever types, interfaces, or data shapes that function needs will get created *because* the function needs them — not before, not separately, not speculatively.
        ```ts
        // ❌ WRONG: Starting with structure
        // "Create User type"
        // "Create UserService interface"  
        // "Design the repository pattern"

        // ✅ RIGHT: Starting with behavior
        it('creates user with generated id', () => {
        const result = createUser({ name: 'Alice' });
        expect(result).toEqual({ id: expect.any(String), name: 'Alice' });
        });
        // Types, interfaces, whatever — they emerge because this function needs them
        ```

        **The Mantra:**

        > "What should this function return when given this input?"

        If you can't answer that question, you're not ready to write code. If you *can* answer it, write the test first, then make it pass. The rest takes care of itself.


        ---

        ## 📝 Testing Guidelines

        ### Test Title = Spec

        The `it('should...')` title defines what you're testing. Body proves exactly that.

        ```ts
        // ✅ Title matches body
        it('should reject empty usernames', () => {
        const result = validate({ username: '' });
        expect(result.valid).toBe(false);
        });

        // ❌ Body does more than title claims
        it('should reject empty usernames', () => {
        const result = validate({ username: '' });
        expect(result.valid).toBe(false);
        expect(result.errors).toContain('Username required'); // second spec
        expect(logger.warn).toHaveBeenCalled(); // third spec
        });
        ```

        ### Stubs Over Mocks

        Use deterministic stubs. Mock at boundaries only when stubs aren't possible.

        ```ts
        // ✅ Deterministic stub
        function createTestIdGenerator() {
        let counter = 0;
        return () => `test-id-${counter++}`;
        }

        it('creates user with generated id', () => {
        const generateId = createTestIdGenerator();
        const user = createUser({ name: 'Alice' }, generateId);
        expect(user).toEqual({ id: 'test-id-0', name: 'Alice' });
        });

        // ❌ Mocking couples tests to implementation
        it('creates user with generated id', () => {
        const mockGenerateId = vi.fn().mockReturnValue('user-123');
        const user = createUser({ name: 'Alice' }, mockGenerateId);
        expect(mockGenerateId).toHaveBeenCalled();
        });
        ```

        ### Assert Whole Objects

        Catch structural changes. Don't cherry-pick properties.

        ```ts
        // ✅ Catches any unexpected changes
        expect(result).toEqual({ type: 'USER', name: 'Alice', processed: true });

        // ❌ Misses if extra properties added/removed
        expect(result.type).toBe('USER');
        expect(result.processed).toBe(true);
        ```

        ### Squint Test

        All tests should look identical when you squint: **SETUP → EXECUTE → VERIFY**

        ```ts
        // ✅ Single clear structure
        it('transforms user to uppercase', () => {
        const input = { type: 'user' }; // SETUP
        const result = transform(input); // EXECUTE
        expect(result).toEqual({ type: 'USER' }); // VERIFY
        });

        // ❌ Multiple execute/verify = split into separate tests
        it('does too many things', () => {
        const result = transform({ type: 'user' });
        expect(result.type).toBe('USER');
        const updated = updateResult(result); // second execute
        expect(updated.modified).toBe(true); // second verify
        });
        ```
