# λ Functional Programming in Racket

## Overview
A series of problems relating to theory of algorithms and computation implemented in
[Racket](https://racket-lang.org). The purpose of this problem set is to develop an understanding of 
Functional Programming and in turn learn to implement effective solutions to problems using primitive functions.
This means  using only `cons`, `car`, `cdr`, `define`, `lambda`, `if`, `null`, `null?`, `cond`, `map`,`=` and
the basic numerical operators (`+`, `-`, `*`, `/`, `modulo`).

Descriptions, decisions and short explanations of choices taken on solutions for problems are provided as comments in
the code.

## Functional Programming
[Functional Programming](https://en.wikipedia.org/wiki/Functional_programming) is a programming paradigm based on lambda calculus. Functional programming deals with 
building software by composing pure functions, avoiding shared state, mutable data, and side-effects.
Functional programming is declarative rather than imperative, and application state flows through pure functions.
Contrast with object oriented programming, where application state is usually shared and colocated with methods in
objects.

In the 1950's John McCarthy created *Lisp* - the first functional programming language. McCarthy is also responsible for
the coining of the term *artificial intelligence*. *Lisp* contains a large number of different dialects and
implementations. Some of the more popular dialects include:

- [Clojure](https://clojure.org/)
- [Common Lisp](https://common-lisp.net/)
- [Racket](https://racket-lang.org)
- [Scheme](https://www.scheme.com/tspl4/)

Programs in *Lisp* are like λ-Calculus expressions. Every expression is either: 

- *x* a variable
- *(M N)* an application
- *λx.M* an abstraction

A number of concepts are fundamental to functional programming including:

- Pure Functions
- First Class and Higher Order Functions
- Recursion
- Immutable State
- Side Effects

Many Functinal Programming concepts and ideas are now present in many imperative programming languages. For example Java
8 has reverse engineered and introduced many functional features. Functional Programming is now a fundamental part of
Modern JavaScript and functional concepts are used throughout libraries such as [React](https://reactjs.org/), [Redux](https://redux.js.org/)
 and [Cycle.js](https://cycle.js.org/).

A fantastic article about Functional Programming in JavaScript can be found on medium
[HERE!](https://medium.com/javascript-scene/master-the-javascript-interview-what-is-functional-programming-7f218c68b3a0)

## Getting Started with Racket

If you are OSX you can simple install Racket using [Homebrew](https://brew.sh).

```
brew install racket
```

Alternatively you can download a [Racket distribution](http://racket-lang.org/download/) from the site which comes
equipped with a graphical IDE called DrRacket.

## Usage

Running the problem scripts in this repository can be done via your Terminal or CLI. 

For example:

```
racket lstq.rkt
```

## Problems

1. Write, from scratch, a function in Racket that uses brute-force algorithm that takes a single positive integer 
and return true if the number is a prime and false otherwise.
 Call the function `decide-prime`.

2. Write, from scratch, a function in Racket that takes a positive integer *n*<sub>0</sub> as input
and returns a list by recursively applying the following operation, starting with the
input number.

*n*<sub>i+1</sub> = 3*n*<sub>i</sub> + 1 if *n*<sub>i</sub> is odd
*n*<sub>i+1</sub> = *n*<sub>i</sub> ÷ 2

End the recursion when (or if) the number becomes 1. Call the function `collatz-list`.
So, collatz-list should return a list whose first element is *n*<sub>0</sub>, the second element
is *n*<sub>1</sub>, and so on. 

For example:

```racket
> (collatz-list 5)
'(5 16 8 4 2 1)

> (collatz-list 9)
'(9 28 14 7 22 11 34 17 52 26 13 40 20 10 5 16 8 4 2 1)

> (collatz-list 2)
'(2 1)
```
3. Write, from scratch, two functions in Racket. The first is called `lcycle`. It takes a list as input and returns the
   list cyclically shifted one place to the left. The second is called `rcycle`, and it shifts the list cyclically shifted
one plae to the right. 

For Example:

```racket
> (lcycle (list 1 2 3 4 5))
'(2 3 4 5 1)

> (rcycle (list 1 2 3 4 5))
'(5 1 2 3 4)
```

4. Write a function `sublsum` in Racket that takes a list (of integers) as input and returns a list of sublists of it
   that sum to zero. For this problem, you can use the `combinations` built-in function. Note the order of the sublists
and their elements doesn’t matter. 

For example:

```racket
> (sublsum (list 1 2 3 4 -5))
'((2 3 -5) (-5 1 4))

> (sublsum (list 1 2 3 4 5))
'()
```
5. Write a function `hamming-weight` in Racket that takes a list *l* as input and returns the number of non-zero
   elements in it. 

For example:

```racket
> (hamming-weight (list 1 0 1 0 1 1 1 0))
5
```

6. Write a function `hamming-distance` in Racket that takes two lists and returns the number of positions in which they
   differ.

 For example:

```racket
> (hamming-distance (list 1 0 1 0 1 1 1 0) (list 1 1 1 1 0 0 0 0))
5
```

7. Write a function `maj` in Racket that takes three lists *x*, *y* and *z* of equal length 
and containing only 0's and 1's. It should return a list containing a 1 where two or more 
of *x*, *y* and *z* contains 1's and 0 otherwise. 

For example:

```racket
> (maj (list 0 0 0 0 1 1 1 1) (list 0 0 1 1 0 0 1 1) (list 0 1 0 1 0 1 0 1))
'(0 0 0 1 0 1 1 1)
```

8. Write a function `chse` in Racket that takes three lists *x*, *y* and *z* of equal length and containing 
only 0's and 1's. It should return a list containing the elements of *y* in the positions where *x* is 1 
and the elements of *z* otherwise. 

For example:

```racket
> (chse (list 0 0 0 0 1 1 1 1) (list 0 0 1 1 0 0 1 1) (list 0 1 0 1 0 1 0 1))
'(0 1 0 1 0 0 1 1)
```

9. Write a function `sod2` in Racket that takes three lists *x*, *y* and *z* of equal length and containing 
only 0's and 1's. It should return a list containing a 1 where the number of 1's in a given position 
in *x*, *y* and *z* contains an odd number of 1's and 0 otherwise. 

For example:

```racket
> (sod2 (list 0 0 0 0 1 1 1 1) (list 0 0 1 1 0 0 1 1) (list 0 1 0 1 0 1 0 1))
'(0 1 1 0 1 0 0 1)
```

10. Write a function lstq in Racket that takes as arguments two lists *l* and *m* of equal
length and containing numbers. It should return *d*, the distance given by the sum of
the square residuals between the numbers in the lists:

This means take the *i<sup>th</sup>* element of *m* from the *i<sup>th</sup>* element of *l* and square the
result for all *i*. Then add all of those to get *d*. For example:

```racket
> (lstq (list 4.5 5.1 6.2 7.8) (list 1.1 -0.1 6.1 3.8))
54.61
```

## References

1. [The Little Schemer - By Daniel P. Friedman and Matthias Felleisen](https://mitpress.mit.edu/books/little-schemer)
2. [Racket Docs](https://docs.racket-lang.org/)
3. [Functional Programming](https://en.wikipedia.org/wiki/Functional_programming)
4. [Mastering the JavaScript Interview. What is functional
programming?](https://medium.com/javascript-scene/master-the-javascript-interview-what-is-functional-programming-7f218c68b3a0)

