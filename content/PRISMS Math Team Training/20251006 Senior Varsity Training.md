---
tags: [Number Theory]
---



### Problem 1

How many positive integers $n$ are there such that $n$ is a multiple of $5$, and the least common multiple of $5!$ and $n$ equals $5$ times the greatest common divisor of $10!$ and $n$?

> [!Solution]-
>
> Since
> $$
> \begin{align}
> \operatorname{lcm}(5!,n)=5\gcd(10!,n)&\iff\forall p\in\mathbb{P},\nu_p(\operatorname{lcm}(5!,n))=\nu_p(5\gcd(10!,n))\\
> &\iff\forall p\in\mathbb{P},\max\{\nu_p(5!),\nu_p(n)\}=\min\{\nu_p(10!),\nu_p(n)\}+\nu_p(5)
> \end{align}
> $$
> it follows that
> $$
> \begin{align}
> |\{n:5\mid n\land\operatorname{lcm}(5!,n)=5\gcd(10!,n)\}|&=|\{n:\forall p\in\mathbb{P},(p=5\rightarrow\nu_p(n)\ge1)\land\max\{\nu_p(5!),\nu_p(n)\}=\min\{\nu_p(10!),\nu_p(n)\}+\nu_p(5)\}|\\
> &=\prod_{p\in\mathbb{P}}|\{\nu_p(n):(p=5\rightarrow\nu_p(n)\ge1)\land\max\{\nu_p(5!),\nu_p(n)\}=\min\{\nu_p(10!),\nu_p(n)\}+\nu_p(5)\}|\\
> &=|\{3,4,5,6,7,8\}||\{1,2,3,4\}||\{3\}||\{0,1\}|\\
> &=48
> \end{align}
> $$

### Problem 2

Call a positive integer $n$ extra-distinct if the remainders when $n$ is divided by $2$, $3$, $4$, $5$, and $6$ are distinct. Find the number of extra-distinct positive integers less than $1000$.

> [!Solution]-
>
> Since it is easy to prove that if there are two positive integers $x$ and $y$ such that $x\equiv y\pmod{60}$, $x$ is extra-distinct iff $y$ is extra-distinct, and since it is easy to prove that all extra-distinct positive integers less than or equal to $60$ are $35$, $58$, and $59$, it follows that $n$ is extra-distinct iff
> $$
> n\equiv35\pmod{60}\lor n\equiv58\pmod{60}\lor n\equiv{59}\pmod{60}
> $$
> Therefore, the number of extra-distinct positive integers less than $1000$ is $49$.

### Problem 3

Let $N$ be the greatest four-digit positive integer with the property that whenever one of its digits is changed to $1$, the resulting number is divisible by $7$. Let $Q$ and $R$ be the quotient and remainder, respectively, when $N$ is divided by $1000$. Find $Q+R$.

> [!Solution]-
>
> Let the digits of $N$ be $a$, $b$, $c$, and $d$, respectively, then $N$ satisfies the property iff
> $$
> 6+2b+3c+d\equiv0\pmod7\land6a+2+3c+d\equiv0\pmod7\land6a+2b+3+d\equiv0\pmod7\land6a+2b+3c+1\equiv0\pmod7
> $$
> Since
> $$
> 6+2b+3c+d\equiv0\pmod7\land6a+2+3c+d\equiv0\pmod7\land6a+2b+3+d\equiv0\pmod7\land6a+2b+3c+1\equiv0\pmod7\iff a\equiv5\pmod7\land b\equiv6\pmod7\land c\equiv2\pmod7\land d\equiv4\pmod7
> $$
> it follows that $N=5694$.
>
> Therefore, $Q+R=699$.

### Problem 4

Let $f$ be the unique function defined on positive integers such that
$$
\sum_{d\mid n}f\left(\frac{n}{d}\right)d=1
$$
for all positive integers $n$. What is $f(2023)$?

### Solution 4

> [!Solution]-
>
> 
> $$
> \forall n\in\Z_+,\sum_{d\mid n}f\left(\frac{n}{d}\right)d=1\iff\forall n\in\Z_+,\sum_{d\mid n}\frac{f(d)}{d}=\frac{1}{n}
> $$
> Applying **Möbius Inversion Formula** yields
> $$
> \begin{align}
> \forall n\in\Z_+,\sum_{d\mid n}\frac{f(d)}{d}=\frac{1}{n}&\iff\forall n\in\Z_+,\frac{f(n)}{n}=\sum_{d\mid n}\mu(d)\frac{d}{n}\\
> &\iff\forall n\in\Z_+,f(n)=\sum_{d\mid n}\mu(d)d
> \end{align}
> $$
> Therefore,
> $$
> \begin{align}
> f(2023)&=\sum_{d\mid 2023}\mu(d)d\\
> &=96
> \end{align}
> $$

### Problem 5

What is the smallest positive integer $n$ such that $20\equiv n^{15}\pmod{29}$?

> [!Solution]-
>
> Applying **Fermat's Little Theorem** yields
> $$
> n^{28}\equiv1\pmod{29}
> $$
>
> $$
> \begin{align}
> n^{28}\equiv1\pmod{29}&\iff n^{14}\equiv1\pmod{29}\lor n^{14}\equiv28\pmod{29}\\
> &\iff n^{15}\equiv n\pmod{29}\lor n^{15}\equiv28n\pmod{29}
> \end{align}
> $$
>
> Therefore,
> $$
> \begin{align}
> n^{15}\equiv20\pmod{29}&\implies n\equiv9\pmod{29}\lor n\equiv 20\pmod{29}
> \end{align}
> $$
>
> $$
> 9^{15}\equiv9\cdot3^{28}\pmod{29}
> $$
>
> Therefore, since applying **Fermat's Little Theorem** yields
> $$
> 3^{28}\equiv{1}\pmod{29}
> $$
> it follows that
> $$
> 9^{15}\equiv9\pmod{29}
> $$
>
> $$
> 20^{15}\equiv20\cdot7^{28}\pmod{29}
> $$
>
> Therefore, since applying **Fermat's Little Theorem** yields
> $$
> 7^{28}\equiv1\pmod{29}
> $$
> it follows that
> $$
> 20^{15}\equiv20\pmod{29}
> $$
> Therefore,
> $$
> n^{15}\equiv20\pmod{29}\iff n\equiv20\pmod{29}
> $$
> Therefore, the smallest positive integer $n$ is $20$.