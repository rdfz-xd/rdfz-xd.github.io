---
tags: [Mathematics, Mathematics/Number Theory]
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

### Problem 6

Find the last two digits of
$$
17^{17^{17^{17}}}+18^{18^{18^{18}}}+19^{19^{19^{19}}}+20^{20^{20^{20}}}
$$

> [!Solution]-
>
> It is easy to prove that the answer is equal to
> $$
> \left(17^{17^{17^{17}}}+18^{18^{18^{18}}}+19^{19^{19^{19}}}+20^{20^{20^{20}}}\right)\bmod 100
> $$
>
> $$
> \begin{align}
> 17^{17^{17^{17}}}\bmod4&=1^{17^{17^{17}}}\bmod4\\
> &=1
> \end{align}
> $$
>
> Applying **Euler's Theorem** yields
> $$
> 17^{17^{17^{17}}}\bmod25=17^{17^{17^{17}}\bmod20}\bmod25
> $$
> Applying **Euler's Theorem** yields
> $$
> \begin{align}
> 17^{17^{17}}\bmod20&=17^{17^{17}\bmod8}\bmod20\\
> &=17^{1^{17}\bmod8}\bmod20\\
> &=17
> \end{align}
> $$
> Therefore,
> $$
> \begin{align}
> 17^{17^{17^{17}}}\bmod25&=17^{17}\bmod25\\
> &=2
> \end{align}
> $$
> Applying **Chinese Remainder Theorem** yields
> $$
> 17^{17^{17^{17}}}\bmod4=1\land17^{17^{17^{17}}}\bmod25=2\iff17^{17^{17^{17}}}\bmod100=77
> $$
>
> $$
> \begin{align}
> 18^{18^{18^{18}}}\bmod4&=2^{18^{18^{18}}-2}\cdot2^2\bmod4\\
> &=0
> \end{align}
> $$
>
> Applying **Euler's Theorem** yields
> $$
> \begin{align}
> 18^{18^{18^{18}}}\bmod25&=18^{18^{18^{18}}\bmod20}\bmod25\\
> &=18^{16}\bmod25\\
> &=1
> \end{align}
> $$
> Applying **Chinese Remainder Theorem** yields
> $$
> 18^{18^{18^{18}}}\bmod4=0\land18^{18^{18^{18}}}\bmod25=1\iff18^{18^{18^{18}}}\bmod100=76
> $$
>
> $$
> \begin{align}
> 19^{19^{19^{19}}}\bmod4&=(-1)^{19^{19^{19}}}\bmod4\\
> &=3
> \end{align}
> $$
>
> Applying **Euler's Theorem** yields
> $$
> \begin{align}
> 19^{19^{19^{19}}}\bmod25&=19^{19^{19^{19}}\bmod20}\bmod25\\
> &=19^{(-1)^{19^{19}}\bmod20}\bmod25\\
> &=19^{19}\bmod25\\
> &=4
> \end{align}
> $$
> Applying **Chinese Remainder Theorem** yields
> $$
> 19^{19^{19^{19}}}\bmod4=3\land19^{19^{19^{19}}}\bmod25=4\iff19^{19^{19^{19}}}\bmod100=79
> $$
>
> $$
> \begin{align}
> 20^{20^{20^{20}}}\bmod100&=20^{20^{20^{20}}-2}\cdot20^{2}\mod100\\
> &=0
> \end{align}
> $$
>
> Therefore,
> $$
> \begin{align}
> \left(17^{17^{17^{17}}}+18^{18^{18^{18}}}+19^{19^{19^{19}}}+20^{20^{20^{20}}}\right)\bmod 100&=\left(17^{17^{17^{17}}}\bmod100+18^{18^{18^{18}}}\bmod100+19^{19^{19^{19}}}\bmod100+20^{20^{20^{20}}}\bmod100\right)\bmod100\\
> &=(77+76+79+0)\bmod100\\
> &=32
> \end{align}
> $$

### Problem 7

Let $p$ be the least prime number that for which there exists a positive integer $n$ such that $n^4+1$ is divisible by $p^2$. Find the least possible $m$ such that $m^4+1$ is divisible by $p^2$.

> [!Solution]-
>
> Since
> $$
> p^2\mid n^4+1\implies\gcd(n, p^2)=1
> $$
> assume $n$ satisfies $\gcd(n,p^2)=1$.
>
> Since
> $$
> \begin{align}
> p^2\mid n^4+1&\implies p^2\mid n^8-1\\
> &\iff n^8\equiv1\pmod{p^2}
> \end{align}
> $$
> and since
> $$
> \begin{align}
> p^2\mid n^4+1&\implies p^2\nmid n^4-1\\
> &\iff n^4\not\equiv1\pmod{p^2}
> \end{align}
> $$
> it follows that
> $$
> \delta_{p^2}(n)=8
> $$
> Therefore,
> $$
> \begin{align}
> \delta_{p^2}(n)\mid\varphi(p^2)&\iff8\mid p(p-1)\\
> &\iff8\mid p-1
> \end{align}
> $$
> Therefore, since it is easy to prove that there exists a positive integer $n$ when $p=17$, it follows that $p=17$.
> $$
> \begin{align}
> 17^2\mid m^4+1&\implies17\mid m^4+1\\
> &\iff m\equiv-2\pmod{17}\lor m\equiv2\pmod{17}\lor m\equiv-8\pmod{17}\lor m\equiv8\pmod{17}
> \end{align}
> $$
> If $m=17k-2$,
> $$
> \begin{align}
> 17^2\mid m^4+1&\iff(17k-2)^4+1\equiv0\pmod{17^2}\\
> &\iff-544k+17\equiv0\pmod{17^2}\\
> &\iff2k+1\equiv0\pmod{17}\\
> &\iff k\equiv8\pmod{17}
> \end{align}
> $$
> If $m=17k+2$,
> $$
> \begin{align}
> 17^2\mid m^4+1&\iff(17k+2)^4+1\equiv0\pmod{17^2}\\
> &\iff544k+17\equiv0\pmod{17^2}\\
> &\iff15k+1\equiv0\pmod{17}\\
> &\iff k\equiv9\pmod{17}
> \end{align}
> $$
> If $m=17k-8$,
> $$
> \begin{align}
> 17^2\mid m^4+1&\iff(17k-8)^4+1\equiv0\pmod{17^2}\\
> &\iff-34816k+4097\equiv0\pmod{17^2}\\
> &\iff9k+3\equiv0\pmod{17}\\
> &\iff k=11\pmod{17}
> \end{align}
> $$
> If $m=17k+8$,
> $$
> \begin{align}
> 17^2\mid m^4+1&\iff(17k+8)^4+1\equiv0\pmod{17^2}\\
> &\iff34816k+4097\equiv0\pmod{17^2}\\
> &\iff8k+3\equiv0\pmod{17}\\
> &\iff k=6\pmod{17}
> \end{align}
> $$
> Therefore,
> $$
> \begin{align}
> m&=\min\{134,155,179,110\}\\
> &=110
> \end{align}
> $$

### Problem 8

Let $a,b$ be positive integers. If for any positive integer $n$, we have $a^n+n\mid b^n+n$, prove $a=b$.

> [!Solution]-
>
> 
> $$
> \forall n\in\Z_+,a^n+n\mid b^n+n\implies\forall p\in\mathbb{P},a^{a(p-1)+p}+a(p-1)+p\mid b^{a(p-1)+p}+a(p-1)+p
> $$
> Since applying **Fermat's Little Theorem** yields
> $$
> a^{a(p-1)+p}\equiv a\pmod p
> $$
> it follows that
> $$
> a^{a(p-1)+p}+a(p-1)+p\equiv0\pmod p
> $$
> Therefore,
> $$
> \begin{align}
> a^{a(p-1)+p}+a(p-1)+p\mid b^{a(p-1)+p}+a(p-1)+p&\implies a^{a(p-1)+p}+a(p-1)+p\equiv b^{a(p-1)+p}+a(p-1)+p\pmod p\\
> &\iff a^{a(p-1)+p}\equiv b^{a(p-1)+p}\pmod p
> \end{align}
> $$
> Since applying **Fermat's Little Theorem** yields
> $$
> b^{a(p-1)+p}\equiv b\pmod p
> $$
> it follows that
> $$
> a^{a(p-1)+p}\equiv b^{a(p-1)+p}\pmod p\iff a\equiv b\pmod p
> $$
> Therefore,
> $$
> \begin{align}
> \forall n\in\Z_+,a^n+n\mid b^n+n&\implies\forall p\in\mathbb{P},a\equiv b\pmod p\\
> &\iff a=b
> \end{align}
> $$
