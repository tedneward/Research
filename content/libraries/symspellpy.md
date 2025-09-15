title=SymSpell
tags=library, spellcheck
summary=1 million times faster spelling correction & fuzzy search through Symmetric Delete spelling correction algorithm.
~~~~~~

[Website](https://seekstorm.com/blog/1000x-spelling-correction/)

The Symmetric Delete spelling correction algorithm reduces the complexity of edit candidate generation and dictionary lookup for a given Damerau-Levenshtein distance. It is six orders of magnitude faster (than the standard approach with deletes + transposes + replaces + inserts) and language independent.

Opposite to other algorithms only deletes are required, no transposes + replaces + inserts. Transposes + replaces + inserts of the input term are transformed into deletes of the dictionary term. Replaces and inserts are expensive and language dependent: e.g. Chinese has 70,000 Unicode Han characters!

The speed comes from the inexpensive delete-only edit candidate generation and the pre-calculation. An average 5 letter word has about 3 million possible spelling errors within a maximum edit distance of 3, but SymSpell needs to generate only 25 deletes to cover them all, both at pre-calculation and at lookup time. Magic!

## Implementations

- C#: [SymSpell](https://github.com/wolfgarbe/SymSpell)
- Python: [SymSpellPy](https://github.com/mammothb/symspellpy)

### Ports (from the README)

Most ports target SymSpell **version 3.0**. But **version 6.1.** provides **much higher speed & lower memory consumption!**

**WebAssembly**<br>
https://github.com/justinwilaby/spellchecker-wasm<br>

**WEB API (Docker)**<br>
https://github.com/LeonErath/SymSpellAPI (Version 6.3)<br>

**C++**<br>
https://github.com/AtheS21/SymspellCPP (Version 6.5)<br>
https://github.com/erhanbaris/SymSpellPlusPlus (Version 6.1)

**Crystal**<br>
https://github.com/chenkovsky/aha/blob/master/src/aha/sym_spell.cr

**Go**<br>
https://github.com/snapp-incubator/go-symspell<br>
https://github.com/sajari/fuzzy<br>
https://github.com/eskriett/spell

**Haskell**<br>
https://github.com/cbeav/symspell

**Java**<br>
https://github.com/MighTguY/customized-symspell (Version 6.6)<br>
https://github.com/rxp90/jsymspell (Version 6.6)<br>
https://github.com/Lundez/JavaSymSpell (Version 6.4)<br>
https://github.com/rxp90/jsymspell<br>
https://github.com/gpranav88/symspell<br>
https://github.com/searchhub/preDict<br>
https://github.com/jpsingarayar/SpellBlaze

**Javascript**<br>
https://github.com/MathieuLoutre/node-symspell (Version 6.6, needs Node.js)<br>
https://github.com/itslenny/SymSpell.js<br>
https://github.com/dongyuwei/SymSpell<br>
https://github.com/IceCreamYou/SymSpell<br>
https://github.com/Yomguithereal/mnemonist/blob/master/symspell.js

**Julia**<br>
https://github.com/Arkoniak/SymSpell.jl

**Kotlin**<br>
https://github.com/Wavesonics/SymSpellKt

**Objective-C**<br>
https://github.com/AmitBhavsarIphone/SymSpell (Version 6.3)

**Python**<br>
https://github.com/mammothb/symspellpy  (Version 6.7)<br>
https://github.com/viig99/SymSpellCppPy  (Version 6.5)<br>
https://github.com/zoho-labs/symspell (Python bindings of Rust version)<br>
https://github.com/ne3x7/pysymspell/ (Version 6.1)<br>
https://github.com/Ayyuriss/SymSpell<br>
https://github.com/ppgmg/github_public/blob/master/spell/symspell_python.py<br>
https://github.com/rcourivaud/symspellcompound<br>
https://github.com/Esukhia/sympound-python<br>
https://www.kaggle.com/yk1598/symspell-spell-corrector

**Ruby**<br>
https://github.com/PhilT/symspell

**Rust**<br>
https://github.com/reneklacan/symspell (Version 6.6, compiles to WebAssembly)<br>
https://github.com/luketpeterson/fuzzy_rocks (persistent datastore backed by RocksDB)

**Scala**<br>
https://github.com/semkath/symspell

**Swift**<br>
https://github.com/gdetari/SymSpellSwift

