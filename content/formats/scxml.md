title=SCXML (State Chart XML)
tags=format, language
summary=State Machine notation for control abstraction specification.
~~~~~~

[Specification](https://www.w3.org/TR/scxml/)

Examples:
```
<state id=s">
    <transition event="e" cond="x==1" target="s1"/>
    <transition event="e" target="s2"/>
    <transition event="*" target="s3"/>
</state>

<state id="S" initial="s1">
  <state id="s1" initial="s11">
  <onexit>
    <log expr="'leaving s1'"/>
  </onexit>

  <state id="s11">
    <onexit>
      <log expr="'leaving s11'"/>
    </onexit>
  </state>

  <transition event="e" target="s21">
    <log expr="'executing transition'"/>
  </transition>

  </state>

  <state id="s2" initial="s21">
    <state id="s21">
      <onentry>
        <log expr="'entering s21'"/>
      </onentry>
    </state>
    <onentry>
      <log expr="'entering s2'"/>
    </onentry>
  </state>

  <onentry>
    <log expr="'entering S'"/>
  </onentry>   
  <onexit>
    <log expr="'leaving S'"/>
  </onexit>
</state>

==== log output will be ======>

leaving s11
leaving s1
executing transition
entering s2
entering s21
```

