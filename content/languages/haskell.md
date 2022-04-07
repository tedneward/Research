title=Haskell
tags=language, functional
summary=Pure-functional language.
~~~~~~

### Notes
(Much quoted from [Learn You a Haskell](http://learnyouahaskell.com).)

Strongly-typed; will not permit `"llama" + 4` for example.

Function application (calling a function by putting a space after it and then typing out the parameters) has the highest precedence of them all. What that means for us is that these two statements are equivalent.

```haskell
ghci> succ 9 + max 5 4 + 1  
16  
ghci> (succ 9) + (max 5 4) + 1  
16 
```

If a function takes two parameters, we can also call it as an infix function by surrounding it with backticks. For instance, the div function takes two integers and does integral division between them. Doing `div 92 10` results in a 9. But when we call it like that, there may be some confusion as to which number is doing the division and which one is being divided. So we can call it as an infix function by doing `92 ``div`` 10` and suddenly it's much clearer.

#### Defining functions
Cannot begin with capital letters. `doubleMe x = x + x` polymorphic doubling function.

```
ghci> doubleMe 9  
18  
ghci> doubleMe 8.3  
16.6   
```

#### Constructs
If-then-else is an expression, yielding a value:
```
doubleSmallNumber x = if x > 100  
                        then x  
                        else x*2  
```

Parentheses may be necessary around the expression to get proper ordering:
```
doubleSmallNumber' x = (if x > 100 then x else x*2) + 1  
```

In Haskell, lists are a homogenous data structure.
```
ghci> let lostNumbers = [4,8,15,16,23,42]  
ghci> lostNumbers  
[4,8,15,16,23,42]
```

Concatenate lists with `++`:

```
ghci> [1,2,3,4] ++ [9,10,11,12]  
[1,2,3,4,9,10,11,12]  
ghci> "hello" ++ " " ++ "world"  
"hello world"  
ghci> ['w','o'] ++ ['o','t']  
"woot"
```

Watch out when repeatedly using the ++ operator on long strings. When you put together two lists (even if you append a singleton list to a list, for instance: [1,2,3] ++ [4]), internally, Haskell has to walk through the whole list on the left side of ++. That's not a problem when dealing with lists that aren't too big. But putting something at the end of a list that's fifty million entries long is going to take a while. However, putting something at the beginning of a list using the : operator (also called the cons operator) is instantaneous.

```
ghci> 'A':" SMALL CAT"  
"A SMALL CAT"  
ghci> 5:[1,2,3,4,5]  
[5,1,2,3,4,5]  
```

Notice how `:` takes a number and a list of numbers or a character and a list of characters, whereas `++` takes two lists. Even if you're adding an element to the end of a list with `++`, you have to surround it with square brackets so it becomes a list.

`[1,2,3]` is actually just syntactic sugar for `1:2:3:[]`. `[]` is an empty list. If we prepend 3 to it, it becomes `[3]`. If we prepend 2 to that, it becomes `[2,3]`, and so on.

```
ghci> "Steve Buscemi" !! 6  
'B'  
ghci> [9.4,33.2,96.2,11.2,23.25] !! 1  
33.2  
```

Functions operating on lists: `head` takes a list and returns the head. `tail` takes a list and returns everything except the first element (the head). `last` takes a list and returns the last element in the list. `init` takes a list and returns everything except the last element (the last). `length` takes a list and returns its length. `null` checks if a list is empty. `reverse` reverses a list. `take` takes a number "n" and a list and returns the first "n" elements of that list. `drop`, `maximum`, `minimum`, `sum`, `product`. `elem` takes a thing and a list of things and returns True/False if that thing is present in the list. `cycle' takes a list and iterates across it infinitely. `repeat` takes an element and produces an infinite stream of that value.

Use `..` to specify a range: `[1..20]` is 1 through 20 (including 1 and 20).

**List comprehensions** `[x*2 | x <- [1..10]]`. `x` is drawn from `[1..10]` and for every element in `[1..10]` (which we have bound to `x`), we get that element, only doubled. Here's that comprehension in action.

```
ghci> [x*2 | x <- [1..10]]  
[2,4,6,8,10,12,14,16,18,20]  
```

As in `[` "Do this" `|` "To each element in this" `]`

Let's say we want only the elements which, doubled, are greater than or equal to 12.

```
ghci> [x*2 | x <- [1..10], x*2 >= 12]  
[12,14,16,18,20] 
```

We took a list of numbers and we filtered them by the predicate.

Let's say we want a comprehension that replaces each odd number greater than 10 with "BANG!" and each odd number that's less than 10 with "BOOM!". If a number isn't odd, we throw it out of our list. For convenience, we'll put that comprehension inside a function so we can easily reuse it.

```
boomBangs xs = [ if x < 10 then "BOOM!" else "BANG!" | x <- xs, odd x]   
```

Not only can we have multiple predicates in list comprehensions (an element must satisfy all the predicates to be included in the resulting list), we can also draw from several lists. When drawing from several lists, comprehensions produce all combinations of the given lists and then join them by the output function we supply. A list produced by a comprehension that draws from two lists of length 4 will have a length of 16, provided we don't filter them. If we have two lists, [2,5,10] and [8,10,11] and we want to get the products of all the possible combinations between numbers in those lists, here's what we'd do.

```
ghci> [ x*y | x <- [2,5,10], y <- [8,10,11]]  
[16,20,22,40,50,55,80,100,110]   

ghci> let nouns = ["hobo","frog","pope"]  
ghci> let adjectives = ["lazy","grouchy","scheming"]  
ghci> [adjective ++ " " ++ noun | adjective <- adjectives, noun <- nouns]  
["lazy hobo","lazy frog","lazy pope","grouchy hobo","grouchy frog",  
"grouchy pope","scheming hobo","scheming frog","scheming pope"] 
```

Tuples are gathered by parentheses/round brackets.

`fst` takes a pair and returns its first component.

```
ghci> fst (8,11)  
8  
ghci> fst ("Wow", False)  
"Wow"  
```

`snd` takes a pair and returns its second component.

```
ghci> snd (8,11)  
11  
ghci> snd ("Wow", False)  
False  
```

`zip` takes two lists and then zips them together into one list by joining the matching elements into pairs, stopping when either source ends.

```
ghci> zip [1,2,3,4,5] [5,5,5,5,5]  
[(1,5),(2,5),(3,5),(4,5),(5,5)]  
ghci> zip [1 .. 5] ["one", "two", "three", "four", "five"]  
[(1,"one"),(2,"two"),(3,"three"),(4,"four"),(5,"five")]  

ghci> zip [1..] ["apple", "orange", "cherry", "mango"]  
[(1,"apple"),(2,"orange"),(3,"cherry"),(4,"mango")]  
```

Here's a problem that combines tuples and list comprehensions: which right triangle that has integers for all sides and all sides equal to or smaller than 10 has a perimeter of 24? First, let's try generating all triangles with sides equal to or smaller than 10:

```
ghci> let triangles = [ (a,b,c) | c <- [1..10], b <- [1..10], a <- [1..10] ]   
```

We're just drawing from three lists and our output function is combining them into a triple. If you evaluate that by typing out triangles in GHCI, you'll get a list of all possible triangles with sides under or equal to 10. Next, we'll add a condition that they all have to be right triangles. We'll also modify this function by taking into consideration that side b isn't larger than the hypothenuse and that side a isn't larger than side b.

```
ghci> let rightTriangles = [ (a,b,c) | c <- [1..10], b <- [1..c], a <- [1..b], a^2 + b^2 == c^2]   
```

We're almost done. Now, we just modify the function by saying that we want the ones where the perimeter is 24.

```
ghci> let rightTriangles' = [ (a,b,c) | c <- [1..10], b <- [1..c], a <- [1..b], a^2 + b^2 == c^2, a+b+c == 24]  
ghci> rightTriangles'  
[(6,8,10)]  
```

#### Types and Typeclasses
ghci uses `:t` to return the type of an expression.

```
ghci> :t 'a'  
'a' :: Char  
ghci> :t True  
True :: Bool  
ghci> :t "HELLO!"  
"HELLO!" :: [Char]  
ghci> :t (True, 'a')  
(True, 'a') :: (Bool, Char)  
ghci> :t 4 == 5  
4 == 5 :: Bool  
```

Functions also have types:

```
removeNonUppercase :: [Char] -> [Char]  
removeNonUppercase st = [ c | c <- st, c `elem` ['A'..'Z']]   
```

`removeNonUppercase` has a type of `[Char] -> [Char]`, meaning that it maps from a string to a string. That's because it takes one string as a parameter and returns another as a result. The `[Char]` type is synonymous with `String` so it's clearer if we write `removeNonUppercase :: String -> String`. We didn't have to give this function a type declaration because the compiler can infer by itself that it's a function from a string to a string but we did anyway. But how do we write out the type of a function that takes several parameters? Here's a simple function that takes three integers and adds them together:

```
addThree :: Int -> Int -> Int -> Int  
addThree x y z = x + y + z  
```

The parameters are separated with `->` and there's no special distinction between the parameters and the return type. The return type is the last item in the declaration and the parameters are the first three.

Int (efficient), Integer (unbounded), Float, Double, Bool, Char

`a` and `b` are often used as generics/parameterized-type descriptors in type descriptions.

A typeclass is a sort of interface that defines some behavior. If a type is a part of a typeclass, that means that it supports and implements the behavior the typeclass describes. (A la interface, as opposed to class.)



### Implementations

* [Native: GHC](https://wiki.haskell.org/GHC) and [GHC](https://www.haskell.org/ghc/)
* [JVM: Eta](../jvm/eta)
* [JVM" Frege](../jvm/frege) is, I think a flavor of Haskell for the JVM
* [GHC: Haskell Tool Stack](https://docs.haskellstack.org/en/stable/README/)

### Libraries
[Phooey](https://wiki.haskell.org/Phooey): a functional UI library for Haskell. Or it's two of them, as it provides a Monad interface and an Applicative interface. The simplicity of Phooey's implementation is due to its use of Reactive for applicative, data-driven computation.

[Yesod](http://yesodweb.com/): Web (with [Book](https://www.yesodweb.com/book))

### Books
* [A Gentle Introduction to Haskell Version 98](https://www.haskell.org/tutorial/) - Paul Hudak, John Peterson, Joseph Fasel
* [Anatomy of Programming Languages](http://www.cs.utexas.edu/~wcook/anatomy/) - William R. Cook
* [Beautiful Code, Compelling Evidence](https://web.archive.org/web/20160411023943/http://www.renci.org/wp-content/pub/tutorials/BeautifulCode.pdf) - J.R. Heard (PDF)
* [Developing Web Applications with Haskell and Yesod](https://www.yesodweb.com/book) - Michael Snoyman 
* [Exploring Generic Haskell](http://www.andres-loeh.de/ExploringGH.pdf) - Andres Löh (PDF)
* [Happy Learn Haskell Tutorial](http://www.happylearnhaskelltutorial.com)
* [Haskell](https://en.wikibooks.org/wiki/Haskell) - Wikibooks
* [Haskell no panic](http://lisperati.com/haskell/) - Conrad Barski
* [Haskell Notes for Professionals](https://goalkicker.com/HaskellBook/) - Compiled from StackOverflow documentation (PDF)
* [Haskell web Programming](http://yannesposito.com/Scratch/fr/blog/Yesod-tutorial-for-newbies/) (Yesod tutorial)
* [Learn Haskell Fast and Hard](http://yannesposito.com/Scratch/en/blog/Haskell-the-Hard-Way/) - Yann Esposito
* [Learn You a Haskell for Great Good](http://learnyouahaskell.com) - Miran Lipovaca
* [Parallel and Concurrent Programming in Haskell](https://www.oreilly.com/library/view/parallel-and-concurrent/9781449335939/) - Simon Marlow
* [Real World Haskell](http://book.realworldhaskell.org) - Bryan O'Sullivan, Don Stewart, and John Goerzen
* [Speeding Through Haskell](http://www.sthaskell.com) - Arya Popescu
* [The Haskell Road to Logic, Math and Programming](https://fldit-www.cs.uni-dortmund.de/~peter/PS07/HR.pdf) - Kees Doets and Jan van Eijck (PDF)
* [The Haskell School of Music - From Signals to Symphonies](https://www.cs.yale.edu/homes/hudak/Papers/HSoM.pdf) - Paul Hudak (PDF)
* [What I Wish I Knew When Learning Haskell](http://dev.stephendiehl.com/hask/) - Stephen Diehl (PDF)
* [Wise Man's Haskell](https://github.com/anchpop/wise_mans_haskell/blob/master/book.md#preface) - Andre Popovitch
* [Yet Another Haskell Tutorial](http://hal3.name/docs/daume02yaht.pdf) - Hal Daum ́e III (PDF)

### Papers
["Template Meta-programming for Haskell"](https://www.microsoft.com/en-us/research/wp-content/uploads/2016/02/meta-haskell.pdf?from=http%3A%2F%2Fresearch.microsoft.com%2F%7Esimonpj%2Fpapers%2Fmeta-haskell%2Fmeta-haskell.pdf)

["How to read Haskell like Python"](http://blog.ezyang.com/2011/11/how-to-read-haskell/)

["Haskell web programming"](http://yannesposito.com/Scratch/en/blog/Yesod-tutorial-for-newbies/)

["Basic Type Level Programming in Haskell"](https://www.parsonsmatt.org/2017/04/26/basic_type_level_programming_in_haskell.html)

### FFI

- Calling C++ from Haskell - "The Hard Way"
	- https://wiki.haskell.org/CPlusPlus_from_Haskell
- Cxx foreign function interface
	- https://wiki.haskell.org/Cxx_foreign_function_interface
- fficxx - FFI to C++ in Haskell
	- Haskell-C++ Foreign Function Interface Generator
	- http://ianwookim.org/fficxx/
	- https://github.com/wavewave/fficxx
- inline-c-cpp: Lets you embed C++ code into Haskell
	- http://hackage.haskell.org/package/inline-c-cpp
	- https://github.com/fpco/inline-c
- Stranger in a Strange Land: An introductory tour of the Haskell FFI
	- Haskell DC 2020; P.C. Shyamshankar
	- https://www.youtube.com/watch?v=zlOrYQH_-Xs

