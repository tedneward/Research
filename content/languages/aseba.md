title=Aseba
tags=language, events
summary=Event-driven programming language for driving robots in an educational environment.
~~~~~~

[Website](https://www.thymio.org/products/programming-with-thymio-suite/program-thymio-aseba/) | [Old wiki website](http://wiki.thymio.org/en:asebalanguage) | [Thymio website](https://www.thymio.org/)

> "... syntax resembles that of a popular class of programming languages, including Pascal and Matlab (a common scientific programming language) for instance; we expect this similarity to allow developers with previous knowledge of any of these languages to feel quickly at ease with Aseba and thus lower the learning curve. Semantically, it is a simple imperative programming language with a single basic data type (16 bit signed integers) and arrays. This simplicity allows developers to program behaviours with no prior knowledge of a type system, integers being the most natural type of variables and well suited to programming microcontroller-based mobile robots."

Example code:
```
# reset outputs
call sound.system(-1)
call leds.top(0,0,0) call leds.bottom.left(0,0,0)
call leds.bottom.right(0,0,0)
call leds.circle(0,0,0,0,0,0,0,0)

# Thymio moves forward when you press the forward button
onevent buttons
when button.forward == 1 do
motor.left.target = 200
motor.right.target = 200
end

# if the ground sensors detects nothing Thymio becomes red otherwise he becomes green
onevent prox
if prox.ground.delta[0] <= 400 or prox.ground.delta[1] <= 400 then
motor.left.target = 0
motor.right.target = 0
call leds.top(32,0,0)
else
call leds.top(0,32,0)
end

# reset outputs
call sound.system(-1)
call leds.top(0,0,0)
call leds.bottom.left(0,0,0)
call leds.bottom.right(0,0,0)
call leds.circle(0,0,0,0,0,0,0,0)

onevent prox
when prox.horizontal[2] >= 2000 do
motor.left.target = 350
motor.right.target = 350
end

when prox.horizontal[0] >= 2000 do
motor.left.target = 0
motor.right.target = 500
end

when prox.horizontal[4] >= 2000 do
motor.left.target = 500
motor.right.target = 0
end

when prox.horizontal[0] <= 1000 and prox.horizontal[1] <= 1000 and
prox.horizontal[2] <= 1000 and prox.horizontal[3] <= 1000 and
prox.horizontal[4] <= 1000 do
motor.left.target = 0
motor.right.target = 0
end
```

Thymio also supports a visual programming language (VPL and VPL3) as well as [Scratch](/languages/scratchjr), [Python](/languages/python), and [Blockly](/languages/blockly).
