# Theory of Algorithms Problems

A series of problems relating to theory of algorithms and computation.

## Problems

1. Write, from scratch, a function in Racket that uses brute-force algorithm that takes a single positive integer and return true if the number is a prime and false otherwise.
 Call the function decide-prime

2. Write, from scratch, a function in Racket that takes a positive integer n_{0} as input
and returns a list by recursively applying the following operation, starting with the
input number.

ni+1 =
(
3ni + 1 if ni
is odd
ni ÷ 2 otherwise
End the recursion when (or if) the number becomes 1. Call the function collatz-list.
So, collatz-list should return a list whose first element is n0, the second element
is n1, and so on.
