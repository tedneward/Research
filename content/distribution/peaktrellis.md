title=PEAK Trellis
tags=distribution, events, python
summary=Python event management without callbacks.
~~~~~~

The Trellis solves all of these problems by introducing automatic callback management, in much the same way that Python does automatic memory management. Instead of worrying about subscribing or "listening" to events and managing the order of callbacks, you just write rules to compute values. The Trellis "sees" what values your rules access, and thus knows what rules may need to be rerun when something changes -- not unlike the operation of a spreadsheet.

[Source](https://github.com/PEAK-Legacy/Trellis)
