title=Inweb
tags=language, literate
summary=Literate programming language used for Inform7 development.
~~~~~~

[Source](https://github.com/ganelson/inform)

## Examples

HelloWorld (`hellow.inweb`):
```
Title: hellow
Author: Graham Nelson
Purpose: A minimal example of a C program written for inweb.
Language: C

@ =
#include <stdio.h>

int main(int argc, char *argv[]) {
	printf("Hello world!\n");
}
```

Build: `inweb/Tangled/inweb hellow.inweb` ...? (More research needed)

TwinPrimes (`twinprimes.inweb`):
```
Title: The Twin Primes Conjecture
Author: Graham Nelson
Purpose: This example of using inweb is a whole web in a single short file, to look for twin primes, a classic problem in number theory.
Language: C

@h The conjecture.
It is widely believed that there are an infinite number of twin primes, that
is, prime numbers occurring in pairs different by 2. Twins are known to exist
at least as far out as $10^{388,342}$ (as of 2016), and there are infinitely
many pairs of primes closer together than about 250 (Zhang, 2013; Tao, Maynard,
and many others, 2014).

This program finds a few small pairs of twins, by the simplest method possible,
and should print output like so:
= (text)
	3 and 5
	5 and 7
	11 and 13
	...
=

@d RANGE 100 /* the upper limit to the numbers we will consider */

=
#include <stdio.h>

int main(int argc, char *argv[]) {
	for (int i=1; i<RANGE; i++)
		@<Test for twin prime at i@>;
}

@<Test for twin prime at i@> =
	if ((isprime(i)) && (isprime(i+2)))
		printf("%d and %d\n", i, i+2);

@h Primality.
This simple and slow test tries to divide by every whole number at least
2 and up to the square root: if none divide exactly, the number is prime.
A common error with this algorithm is to check where $m^2 < n$, rather
than $m^2 \leq n$, thus wrongly considering 4, 9, 25, 49, ... as prime:
Cambridge folklore has it that this bug occurred on the first computation
of the EDSAC computer on 6 May 1949.

@d TRUE 1
@d FALSE 0

=
int isprime(int n) {
	if (n <= 1) return FALSE;
	for (int m = 2; m*m <= n; m++)
		if (n % m == 0)
			return FALSE;
	return TRUE;
}
```