title=mimir
tags=library, logic, rules
summary=An experimental rule engine written in Clojure.
~~~~~~

[Source](https://github.com/hraberg/mimir)

Example:
```
  ; The first example from chapter 2, "The Basic Rete Algorithm" in Doorenbos:
  (facts B1 on B2
         B1 on B3
         B1 color red
         B2 on table
         B2 left-of B3
         B2 color blue
         B3 left-of B4
         B3 on table
         B3 color red)

  (rule find-stack-of-two-blocks-to-the-left-of-a-red-block
        ?x on ?y
        ?y left-of ?z
        ?z color red
        =>
        ?x is on-top)

  (match? B1 is on-top)
```

SEND + MORE = MONEY example:
```
  ; Dudeney's SEND + MORE = MONEY:
  (integers)

  (rule send-more-money
        (base 10    S E N D
                  + M O R E
                = M O N E Y)

        (all-different S E N D M O R Y)

        =>

        (str S E N D '+ M O R E '= M O N E Y))

   (match? "9567+1085=10652")
```

