title=Egison
tags=language, logic
summary=A programming language that features extensible efficient non-linear pattern matching with backtracking for non-free data types.
~~~~~~

[Website](https://www.egison.org/) | [Source](https://github.com/egison/egison) | [Paper](https://arxiv.org/abs/1808.10603.pdf)

#### Examples
```
-- Extract all twin primes from the infinite list of prime numbers with pattern matching!
def twinPrimes :=
  matchAll primes as list integer with
    | _ ++ $p :: #(p + 2) :: _ -> (p, p + 2)

-- Enumerate first 10 twin primes.
take 10 twinPrimes
-- => [(3, 5), (5, 7), (11, 13), (17, 19), (29, 31), (41, 43), (59, 61), (71, 73), (101, 103), (107, 109)]
```

Egison proposes a new paradigm pattern-match-oriented. The combination of all of the following features enables intuitive powerful pattern matching.

* Efficiency of the backtracking algoirthm for non-linear patterns
* Extensibility of pattern matching
* Polymorphisim in patterns

Egison is a programming language with the strong expressive power of pattern-matching.
With Egison, we can express pattern-matching against a wide range of data types including multisets and sets.
For example, we can use pattern-matching to express poker hands, mahjong, and enumeration of twin primes.

Pattern-matching of Egison is realized with backtracking as Prolog.
The difference is that Egison realizes these strong expression in pattern-matching.
The pattern-matching itself of Prolog is similar with ordinal pattern-matching of the other functional languages.

#### Examples
Poker Hands
```
def suit := algebraicDataMatcher
  | spade
  | heart
  | club
  | diamond

def card := algebraicDataMatcher
  | card suit (mod 13)

def poker cs :=
  match cs as multiset card with
  | [card $s $n, card #s #(n-1), card #s #(n-2), card #s #(n-3), card #s #(n-4)]
    -> "Straight flush"
  | [card _ $n, card _ #n, card _ #n, card _ #n, _]
    -> "Four of a kind"
  | [card _ $m, card _ #m, card _ #m, card _ $n, card _ #n]
    -> "Full house"
  | [card $s _, card #s _, card #s _, card #s _, card #s _]
    -> "Flush"
  | [card _ $n, card _ #(n-1), card _ #(n-2), card _ #(n-3), card _ #(n-4)]
    -> "Straight"
  | [card _ $n, card _ #n, card _ #n, _, _]
    -> "Three of a kind"
  | [card _ $m, card _ #m, card _ $n, card _ #n, _]
    -> "Two pair"
  | [card _ $n, card _ #n, _, _, _]
    -> "One pair"
  | [_, _, _, _, _] -> "Nothing"

assertEqual "poker hand 1"
  (poker [Card Spade 5, Card Spade 6, Card Spade 7, Card Spade 8, Card Spade 9])
  "Straight flush"

assertEqual "poker hand 2"
  (poker [Card Spade 5, Card Diamond 5, Card Spade 7, Card Club 5, Card Heart 5])
  "Four of a kind"

assertEqual "poker hand 3"
  (poker [Card Spade 5, Card Diamond 5, Card Spade 7, Card Club 5, Card Heart 7])
  "Full house"

assertEqual "poker hand 4"
  (poker [Card Spade 5, Card Spade 6, Card Spade 7, Card Spade 13, Card Spade 9])
  "Flush"

assertEqual "poker hand 5"
  (poker [Card Spade 5, Card Club 6, Card Spade 7, Card Spade 8, Card Spade 9])
  "Straight"

assertEqual "poker hand 6"
  (poker [Card Spade 5, Card Diamond 5, Card Spade 7, Card Club 5, Card Heart 8])
  "Three of a kind"

assertEqual "poker hand 7"
  (poker [Card Spade 5, Card Diamond 10, Card Spade 7, Card Club 5, Card Heart 10])
  "Two pair"

assertEqual "poker hand 8"
  (poker [Card Spade 5, Card Diamond 10, Card Spade 7, Card Club 5, Card Heart 8])
  "One pair"

assertEqual "poker hand 9"
  (poker [Card Spade 5, Card Spade 6, Card Spade 7, Card Spade 8, Card Diamond 11])
  "Nothing"
```
