---
tags: [Mathematics, Mathematics/Combinatorics]
---

### Problem 1

What is the number of ways to hang $3$ pairs of socks on a line such that socks from the same pair are never adjacent?

> [!note]- Solution
>
> Let $S_i$ be the set of all permutations such that socks from the $i$-th pair are adjacent, then the answer is
> $$
> \left|\bigcap_{i=1}^3\overline{S_i}\right|
> $$
> Applying the **Principle of Inclusion-Exclusion** yields
> $$
> \begin{align}
> \left|\bigcap_{i=1}^3\overline{S_i}\right|&=\sum_{I\subseteq\{1,2,3\}}(-1)^{|I|}\left|\bigcap_{i\in I}S_i\right|\\
> &=\binom{6}{2,2,2}-3\binom{5}{1,2,2}+3\binom{4}{1,1,2}-\binom{3}{1,1,1}\\
> &=30
> \end{align}
> $$

### Problem 2

How many nonempty palindromes can be formed using some of the letters of `MATHTEAM`?

> [!note]- Solution
>
> It is easy to prove that the number of even palindromes is
> $$
> \sum_{k=1}^3\binom{3}{k}k!=15
> $$
> It is easy to prove that the number of odd palindromes with `A`, `M`, or `T` in the middle is
> $$
> 3\sum_{k=0}^2\binom{2}{k}k!=15
> $$
> It is easy to prove that the number of odd palindromes with `E` or `H` in the middle is
> $$
> 2\sum_{k=0}^3\binom{3}{k}k!=32
> $$
> Therefore, the answer is
> $$
> 15+15+32=62
> $$

### Problem 3

Room 210 has $4$ rows and $4$ columns of seats. What is the number of ways for two boys and two girls to sit in Room 210 such that the boys do not sit in the same row or column, and the girls do not sit in the same row or column?

> [!note]- Solution
>
> It is easy to prove that the answer is
> $$
> 4^2\cdot3^2\cdot(9+8+8+9+8+8+8+8+7+7+8+8+7+7)=15840
> $$

### Problem 4

An elementary school teacher wants to set questions for a test. Each question is an addition expression containing two $5$-digit numbers, $a$ and $b$, such that every digit in $a$ is prime and every digit in $b$ is composite ($0$ and $1$ are neither prime nor composite). In how many such questions is the result a $6$-digit number?

> [!note]- Solution
>
> Let $f_d(n)$ be the number of addition expressions containing two $n$-digit numbers such that the result is a $n+d$-digit number. Then since it is easy to prove that
> $$
> \forall n\in\Z_+,\begin{pmatrix}
> f_0(n+1)\\
> f_1(n+1)
> \end{pmatrix}=\begin{pmatrix}
> 5&3\\
> 11&13
> \end{pmatrix}\begin{pmatrix}
> f_0(n)\\
> f_1(n)
> \end{pmatrix}
> $$
> it follows that
> $$
> \begin{align}
> \begin{pmatrix}
> f_0(5)\\
> f_1(5)
> \end{pmatrix}&=\begin{pmatrix}
> 5&3\\
> 11&13
> \end{pmatrix}^5\begin{pmatrix}
> f_0(0)\\
> f_1(0)\\
> \end{pmatrix}\\
> &=\begin{pmatrix}
> 224720\\
> 823856
> \end{pmatrix}
> \end{align}
> $$
> Therefore, the answer is
> $$
> f_1(5)=823856
> $$

### Problem 5

Let $n$ be the answer to the previous problem. Including $n$ itself, how many permutations of the digits of $n$ are divisible by $11$?

> [!note]- Solution
>
> It is easy to prove that the answer is
> $$
> 2(3!)^2=72
> $$

### Problem 6

When $n$ $6$-sided dice are rolled, the product of the numbers rolled can be any of $936$ possible values. What is $n$?

> [!note]- Solution
>
> It is easy to prove that the set of possible values is
> $$
> \{2^a3^b5^c:a,b,c\in\N\land b+c\le n\land a\le2(n-b-c)+b\}
> $$
> Therefore, since
> $$
> \begin{align}
> |\{2^a3^b5^c:a,b,c\in\N\land b+c\le n\land a\le2(n-b-c)+b\}|&=\sum_{c=0}^n\sum_{b=0}^{n-c}(2(n-b-c)+b+1)\\
> &=\sum_{c=0}^n\sum_{b=0}^c(2c-b+1)\\
> &=\sum_{c=0}^n\left((2c+1)(c+1)-\sum_{b=0}^cb\right)\\
> &=\frac{3}{2}\sum_{c=0}^nc^2+\frac{5}{2}\sum_{c=0}^nc+\sum_{c=0}^n1\\
> &=\frac{(n+1)^2(n+2)}{2}
> \end{align}
> $$
> it follows that
> $$
> n=11
> $$
