title=Bloom Filters
tags=ai, reading
summary=Notes and links.
~~~~~~

"A Bloom filter gives you something that feels like magic: it can tell you whether an item is in a set of billions, using only a few kilobytes of memory. And it answers in the same tiny amount of time no matter how much you have stored. ... A Bloom filter is a probabilistic data structure. Its whole job is to answer one question, "is this item in the set?", and it gives one of only two answers:

* Definitely not in the set. This answer is always correct.
* Possibly in the set. This answer is usually correct, but it's occasionally wrong.

"So a Bloom filter isn't really a container. It's closer to a fingerprint of a set. You can't ask it to list what's inside, or to hand an item back. You can only ask "have you probably seen this?", and you can trust its "no" completely.

"A Bloom filter is built on two pieces: (1) A bit array: a long row of bits, all starting at 0. (2) A handful of hash functions that each turn an item into a position in that array. To add an item, you run it through each hash function, get several positions, and set the bit at each of those positions to 1. To check an item, you run it through the same hash functions and look at those same positions. If every one of them is 1, the item is "probably present". If even one is 0, the item is "definitely absent". That second answer is the important one. If a bit is still 0, you know for certain you never added anything that would have set it. The filter never misses something it has actually seen."

## Reading

### Articles

- Original paper: [Space/Time Trade-offs in Hash Coding with Allowable Errors](https://dl.acm.org/doi/10.1145/362686.362692)
- [How a Bloom Filter Works: Build One From Scratch in Python](https://www.freecodecamp.org/news/how-bloom-filters-work-build-one-from-scratch-python/)
