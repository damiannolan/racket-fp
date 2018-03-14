# Theory of Algorithms Problems

A series of problems relating to theory of algorithms and computation implemented using the
[Racket](https://racket-lang.org). 

## Problems

1. Write, from scratch, a function in Racket that uses brute-force algorithm that takes a single positive integer and return true if the number is a prime and false otherwise.
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


