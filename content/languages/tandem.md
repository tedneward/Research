title=Tandem
tags=language
summary=An experimental rewriting language where the rewrite rules form a Kleene algebra. 
~~~~~~

[Source](https://codeberg.org/catseye/Tandem#tandem)

The object being rewritten by a Tandem program is a collection of labelled stacks -- a finite mapping from strings to strings. The strings are always rewritten at the left edge, so they are effectively stacks. A Tandem program consists of a single rewrite rule along with zero or more pragmas. The rewrite rule is applied to an initial state to possibly obtain a final state. This rule is applied only once. However, in Tandem, a rule is a composite object which may contain subrules that get applied many times.
