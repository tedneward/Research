title=xState
tags=library, nodejs, browser, state machine
summary=A state management library for Javascript.
~~~~~~

"Statecharts are a formalism for modeling stateful, reactive systems. This is useful for declaratively describing the behavior of your application, from the individual components to the overall application logic."

[Website](https://xstate.js.org/) | [Source](https://github.com/davidkpiano/xstate)

```
npm install xstate
```

```
import { createMachine, interpret } from 'xstate';

// Stateless machine definition
// machine.transition(...) is a pure function used by the interpreter.
const toggleMachine = createMachine({
  id: 'toggle',
  initial: 'inactive',
  states: {
    inactive: { on: { TOGGLE: 'active' } },
    active: { on: { TOGGLE: 'inactive' } }
  }
});

// Machine instance with internal state
const toggleService = interpret(toggleMachine)
  .onTransition((state) => console.log(state.value))
  .start();
// => 'inactive'

toggleService.send('TOGGLE');
// => 'active'

toggleService.send('TOGGLE');
// => 'inactive'
```