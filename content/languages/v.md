title=V
tags=language
summary=Simple, fast, safe, compiled language for developing maintainable software.
~~~~~~

[Website](https://vlang.io) | [Source](https://github.com/vlang/v)

Example: lander.v:
```
// Example of sum types
// Models a landing craft leaving orbit and landing on a world
import rand
import time

struct Moon {
}

struct Mars {
}
fn (m Mars) dust_storm() bool {
	return rand.int() >= 0
}

struct Venus {
}

type World = Moon | Mars | Venus

struct Lander {
}
fn (l Lander) deorbit() {
	println('leaving orbit')
}
fn (l Lander) open_parachutes(n int) {
	println('opening $n parachutes')
}

fn wait() {
	println('waiting...')
	time.sleep(1)
}

fn (l Lander) land(w World) {
	if w is Mars {
		for w.dust_storm() {
			wait()
		}
	}
	l.deorbit()
	match w {
		Moon {} // no atmosphere
		Mars {
			// light atmosphere
			l.open_parachutes(3)
		}
		Venus {
			// heavy atmosphere
			l.open_parachutes(1)
		}
	}
	println('landed')
}

fn main() {
	l := Lander {}
	l.land(Venus{})
	l.land(Mars{})
}
```
