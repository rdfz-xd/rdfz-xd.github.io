---
tags: [Number Theory]
---

### Problem 1

Find the smallest $n$ such that $2013^n$ ends in $001$.

> [!Solution]-
>
> It is easy to prove that the problem is equivalent to finding the smallest $n>0$ such that $2013^n\equiv1\pmod{1000}$.
> $$
> \begin{align}
> 2013^n\equiv1\pmod{1000}&\Longleftrightarrow2013^n\equiv1\pmod{2^3}\land2013^n\equiv1\pmod{5^3}\\
> &\Longleftrightarrow5^n\equiv1\pmod{2^3}\land13^n\equiv1\pmod{5^3}\\
> &\Longleftrightarrow2^3\mid5^n-1^n\land5^3\mid13^n-1^n\\
> &\Longleftrightarrow\nu_2(5^n-1^n)\ge3\land\nu_5(13^n-1^n)\ge3\\
> \end{align}
> $$
> If $n\equiv0\pmod2$, applying the **Lifting-the-Exponent Lemma** yields
> $$
> \begin{align}
> \nu_2(5^n-1^n)&=\nu_2(4)+\nu_2(6)+\nu_2(n)-1\\
> &=2+1+\nu_2(n)-1\\
> &\ge3
> \end{align}
> $$
> If $n\equiv1\pmod2$, applying the **Lifting-the-Exponent Lemma** yields
> $$
> \begin{align}
> \nu_2(5^n-1^n)&=\nu_2(4)\\
> &=2\\
> &<3
> \end{align}
> $$
> Therefore,
> $$
> \nu_2(5^n-1^n)\ge3\Longleftrightarrow2\mid n
> $$
>
> $$
> \begin{align}
> \nu_5(13^n-1^n)\ge3&\Longrightarrow3^n\equiv1\pmod5\\
> &\Longleftrightarrow\delta_5(3)\mid n\\
> &\Longleftrightarrow4\mid n
> \end{align}
> $$
>
> Therefore,
> $$
> \begin{align}
> \nu_5(13^n-1^n)\ge3&\Longleftrightarrow4\mid n\land\nu_5(13^n-1^n)\ge3\\
> &\Longleftrightarrow\exist k\in\Z,n=4k\land\nu_5(13^n-1^n)\ge3\\
> &\Longleftrightarrow\exist k\in\Z,n=4k\land\nu_5((13^4)^k-(1^4)^k)\ge3\\
> \end{align}
> $$
> Applying the **Lifting-the-Exponent Lemma** yields
> $$
> \begin{align}
> \nu_5((13^4)^k-(1^4)^k)&=\nu_5(13^4-1^4)+\nu_5(k)\\
> &=\nu_5(13-1)+\nu_5(13+1)+\nu_5(13^2+1^2)+\nu_5(k)\\
> &=1+\nu_5(k)
> \end{align}
> $$
> Therefore,
> $$
> \begin{align}
> \nu_5(13^n-1^n)\ge3&\Longleftrightarrow\exist k\in\Z,n=4k\land1+\nu_5(k)\ge3\\
> &\Longleftrightarrow\exist k\in\Z,n=4k\land25\mid k\\
> &\Longleftrightarrow100\mid n
> \end{align}
> $$
> Therefore,
> $$
> \begin{align}
> 2013^n\equiv1\pmod{1000}&\Longleftrightarrow2\mid n\land100\mid n\\
> &\Longleftrightarrow100\mid n
> \end{align}
> $$
> The smallest $n>0$ such that $100\mid n$ is $100$.

### Problem 2

Let $n$ be the least positive integer such that $149^n-2^n$ is divisible by $3^35^57^7$. Find the number of positive divisors of $n$.

> [!Solution]-
>
> 
> $$
> \begin{align}
> 3^35^57^7\mid(149^n-2^n)&\Longleftrightarrow3^3\mid149^n-2^n\land5^5\mid149^n-2^n\land7^7\mid149^n-2^n\\
> &\Longleftrightarrow\nu_3(149^n-2^n)\ge3\land\nu_5(149^n-2^n)\ge5\land\nu_7(149^n-2^n)\ge7
> \end{align}
> $$
> Applying the **Lifting-the-Exponent Lemma** yields
> $$
> \begin{align}
> \nu_3(149^n-2^n)&=\nu_3(147)+\nu_3(n)\\
> &=1+\nu_3(n)
> \end{align}
> $$
> Therefore,
> $$
> \begin{align}
> \nu_3(149^n-2^n)\ge3&\Longleftrightarrow1+\nu_3(n)\ge3\\
> &\Longleftrightarrow3^2\mid n
> \end{align}
> $$
>
> $$
> \nu_5(149^n-2^n)\ge5\Longrightarrow149^n\equiv2^n\pmod5
> $$
>
> Since
> $$
> 149^n\equiv\begin{cases}
> 1\pmod5, &n\equiv0\pmod2\\
> 4\pmod5, &n\equiv1\pmod2
> \end{cases}
> $$
>
> $$
> 2^n\equiv\begin{cases}
> 1\pmod5, &n\equiv0\pmod4\\
> 2\pmod5, &n\equiv1\pmod4\\
> 4\pmod5, &n\equiv2\pmod4\\
> 3\pmod5, &n\equiv3\pmod4
> \end{cases}
> $$
>
> it follows that
> $$
> 149^n\equiv2^n\pmod5\Longleftrightarrow4\mid n
> $$
> Therefore,
> $$
> \begin{align}
> \nu_5(149^n-2^n)\ge5&\Longleftrightarrow4\mid n\land\nu_5(149^n-2^n)\ge5\\
> &\Longleftrightarrow\exist k\in\Z,n=4k\land\nu_5(149^n-2^n)\ge5\\
> &\Longleftrightarrow\exist k\in\Z,n=4k\land\nu_5((149^4)^n-(2^4)^n)\ge5\\
> \end{align}
> $$
> Applying the **Lifting-the-Exponent Lemma** yields
> $$
> \begin{align}
> \nu_5((149^4)^k-(2^4)^k)&=\nu_5(149^4-2^4)+\nu_5(k)\\
> &=\nu_5(149-2)+\nu_5(149+2)+\nu_5(149^2+2^2)+\nu_5(k)\\
> &=1+\nu_5(k)
> \end{align}
> $$
> Therefore,
> $$
> \begin{align}
> \nu_5(149^n-2^n)\ge5&\Longleftrightarrow\exist k\in\Z,n=4k\land1+\nu_5(k)\ge5\\
> &\Longleftrightarrow\exist k\in\Z,n=4k\land5^4\mid k\\
> &\Longleftrightarrow4\cdot5^4\mid n\\
> \end{align}
> $$
> Applying the **Lifting-the-Exponent Lemma** yields
> $$
> \begin{align}
> \nu_7(149^n-2^n)&=\nu_7(147)+\nu_7(n)\\
> &=2+\nu_7(n)
> \end{align}
> $$
> Therefore,
> $$
> \begin{align}
> \nu_7(149^n-2^n)\ge7&\Longleftrightarrow2+\nu_7(n)\ge7\\
> &\Longleftrightarrow7^5\mid n
> \end{align}
> $$
> Therefore,
> $$
> \begin{align}
> 3^35^57^7\mid149^n-2^n&\Longleftrightarrow3^2\mid n\land4\cdot5^4\mid n\land 7^5\mid n\\
> &\Longleftrightarrow2^23^25^47^5\mid n
> \end{align}
> $$
> The smallest $n>0$ such that $2^23^25^47^5\mid n$ is $2^23^25^47^5$, it has $(2+1)(2+1)(4+1)(5+1)=270$ divisors.

### Problem 3

Find the largest $k$ such that
$$
1991^k\mid1990^{1991^{1992}}+1992^{1991^{1990}}
$$

> [!Solution]-
>
> 
> $$
> \begin{align}
> 1991^k\mid1990^{1991^{1992}}+1992^{1991^{1990}}&\Longleftrightarrow11^k\mid1990^{1991^{1992}}+1992^{1991^{1990}}\land181^k\mid1990^{1991^{1992}}+1992^{1991^{1990}}\\
> &\Longleftrightarrow\nu_{11}(1990^{1991^{1992}}+1992^{1991^{1990}})\ge k\land\nu_{181}(1990^{1991^{1992}}+1992^{1991^{1990}})\ge k\\
> \end{align}
> $$
>
> $$
> \begin{align}
> 1990^{1991^{1992}}+1992^{1991^{1990}}&=1990^{1991^{1990}1991^2}+1992^{1991^{1990}}\\
> &=(1990^{1991^2})^{1991^{1990}}+1992^{1991^{1990}}
> \end{align}
> $$
>
> Therefore,
> $$
> \nu_{11}(1990^{1991^{1992}}+1992^{1991^{1990}})=\nu_{11}((1990^{1991^2})^{1991^{1990}}+1992^{1991^{1990}})
> $$
> Applying the **Lifting-the-Exponent Lemma** yields
> $$
> \begin{align}
> \nu_{11}((1990^{1991^2})^{1991^{1990}}+1992^{1991^{1990}})&=\nu_{11}(1990^{1991^2}+1992)+1990\nu_{11}(1991)\\
> &=\nu_{11}(\sum_{n=0}^{1991^2}\binom{1991^2}{n}1991^n(-1)^{1991^2-n}+1992)+1990\\
> &=\nu_{11}(\sum_{n=1}^{1991^2}\binom{1991^2}{n}1991^n(-1)^{1991^2-n}+1991)+1990\\
> &=\nu_{11}(1991)+\nu_{11}(\sum_{n=1}^{1991^2}\binom{1991^2}{n}1991^{n-1}(-1)^{1991^2-n}+1)+1990\\
> &=1+0+1990\\
> &=1991\\
> \end{align}
> $$
> Similarly, it follows that
> $$
> \nu_{181}(1990^{1991^{1992}}+1992^{1991^{1990}})=1991
> $$
> Therefore,
> $$
> \begin{align}
> 1991^k\mid1990^{1991^{1992}}+1992^{1991^{1990}}&\Longleftrightarrow1991\ge k\land1991\ge k\\
> &\Longleftrightarrow1991\ge k
> \end{align}
> $$
> The largest $k$ such that $1991\ge k$ is $1991$.

### Problem 4

If $m$ is an integer such that
$$
3^m\mid7^{3^{527}}-1
$$
 find the maximum possible value of $m$.

> [!Solution]-
>
> $$
> 3^m\mid7^{3^{527}}-1\Longleftrightarrow\nu_3(7^{3^{527}}-1^{3^{527}})\ge m
> $$
> Applying the **Lifting-the-Exponent Lemma** yields
> $$
> \begin{align}
> \nu_3(7^{3^{527}}-1^{3^{527}})&=\nu_3(6)+\nu_3(3^{527})\\
> &=1+527\\
> &=528\\
> \end{align}
> $$
> Therefore,
> $$
> 3^m\mid7^{3^{527}}-1\Longleftrightarrow528\ge m
> $$
> The largest integer $m$ such that $528\ge m$ is $528$.

### Problem 5

Find the sum of all the divisors $d$ of $N=19^{88}-1$ which are of the form $d=2^a3^b$ with $a,b\in\N$.

> [!Solution]-
> $$
> \begin{align}
> 2^a3^b\mid19^{88}-1&\Longleftrightarrow2^a\mid19^{88}-1\land3^b\mid19^{88}-1\\
> &\Longleftrightarrow\nu_2(19^{88}-1^{88})\ge a\land\nu_3(19^{88}-1^{88})\ge b
> \end{align}
> $$
>
> Applying the **Lifting-the-Exponent Lemma** yields
> $$
> \begin{align}
> \nu_2(19^{88}-1^{88})&=\nu_2(19-1)+\nu_2(19+1)+\nu_2(88)-1\\
> &=1+2+3-1\\
> &=5
> \end{align}
> $$
> Applying the **Lifting-the-Exponent Lemma** yields
> $$
> \begin{align}
> \nu_3(19^{88}-1^{88})&=\nu_3(19-1)+\nu_3(88)\\
> &=2\\
> \end{align}
> $$
> Therefore,
> $$
> 2^a3^b\mid19^{88}-1\Longleftrightarrow5\ge a\land2\ge b
> $$
> The sum of all the divisors $d$ of the form $d=2^a3^b$ is
> $$
> \begin{align}
> \sum_{a=0}^5\sum_{b=0}^22^a3^b&=(\sum_{a=0}^52^a)(\sum_{b=0}^23^b)\\
> &=63\cdot13\\
> &=819
> \end{align}
> $$
>

### Problem 6

Let $k$ be a positive integer. Find all positive integers $n$ such that $3^k\mid2^n-1$.

> [!Solution]-
> $$
> \begin{align}
> 3^k\mid2^n-1&\Longrightarrow3\mid2^n-1\\
> &\Longleftrightarrow2^n\equiv1\pmod3\\
> &\Longleftrightarrow\delta_3(2)\mid n\\
> &\Longleftrightarrow2\mid n\\
> \end{align}
> $$
>
> Therefore,
> $$
> \begin{align}
> 3^k\mid2^n-1&\Longleftrightarrow2\mid n\land3^k\mid2^n-1\\
> &\Longleftrightarrow\exist m\in\Z,n=2m\land3^k\mid2^n-1\\
> &\Longleftrightarrow\exist m\in\Z,n=2m\land3^k\mid4^m-1\\
> &\Longleftrightarrow\exist m\in\Z,n=2m\land\nu_3(4^m-1^m)\ge k\\
> \end{align}
> $$
> Applying the **Lifting-the-Exponent Lemma** yields
> $$
> \begin{align}
> \nu_3(4^m-1^m)&=\nu_3(4-1)+\nu_3(m)\\
> &=1+\nu_3(m)\\
> \end{align}
> $$
> Therefore,
> $$
> \begin{align}
> 3^k\mid(2^n-1)&\Longleftrightarrow\exist m\in\Z,n=2m\land1+\nu_3(m)\ge k\\
> &\Longleftrightarrow\exist m\in\Z,n=2m\land3^{k-1}\mid m\\
> &\Longleftrightarrow2\cdot3^{k-1}\mid m
> \end{align}
> $$
>

### Problem 7

Find all primes $p,q$ such that
$$
\frac{(5^p-2^p)(5^q-2^q)}{pq}
$$
is an integer.

> [!Solution]-
>
> Wlog, assume $p\le q$.
> $$
> \frac{(5^p-2^p)(5^q-2^q)}{pq}\in\Z\Longleftrightarrow pq\mid(5^p-2^p)(5^q-2^q)
> $$
> Since
> $$
> (5^p-2^p)(5^q-2^q)\equiv1\pmod2
> $$
> it follows that
> $$
> pq\mid(5^p-2^p)(5^q-2^q)\Longrightarrow p\ne2\land q\ne2
> $$
>
> $$
> \begin{align}
> pq\mid(5^p-2^p)(5^q-2^q)&\Longrightarrow p\mid(5^p-2^p)(5^q-2^q)\\
> &\Longleftrightarrow(5^p-2^p)(5^q-2^q)\equiv0\pmod p
> \end{align}
> $$
>
> Applying **Fermat's Little Theorem** yields
> $$
> 5^p-2^p\equiv3\pmod p
> $$
> Therefore, if $p\ne 3$,
> $$
> \begin{align}
> (5^p-2^p)(5^q-2^q)\equiv0\pmod p&\Longleftrightarrow5^q-2^q\equiv0\pmod p\\
> &\Longleftrightarrow\left(\frac{5}{2}\right)^q\equiv1\pmod p\\
> &\Longleftrightarrow\delta_p\left(\frac{5}{2}\right)\mid q\\
> &\Longleftrightarrow\delta_p\left(\frac{5}{2}\right)=q\\
> \end{align}
> $$
> Applying **Fermat's Little Theorem** yields
> $$
> \left(\frac{5}{2}\right)^{p-1}\equiv1\pmod p
> $$
>
> $$
> \left(\frac{5}{2}\right)^{p-1}\equiv1\pmod p\Longleftrightarrow\delta_p\left(\frac{5}{2}\right)\mid p-1
> $$
>
> Therefore,
> $$
> \begin{align}
> (5^p-2^p)(5^q-2^q)\equiv0\pmod p&\Longrightarrow q\mid p-1\\
> &\Longrightarrow q<p
> \end{align}
> $$
> By contradiction, if follows that $p=3$.
>
> Therefore,
> $$
> \begin{align}
> pq\mid(5^p-2^p)(5^q-2^q)&\Longleftrightarrow39(5^q-2^q)\equiv0\pmod q\\
> &\Longleftrightarrow q\mid117\\
> &\Longleftrightarrow q=3\lor q=13\\
> \end{align}
> $$
> Therefore, all primes $p,q$ such that
> $$
> \frac{(5^p-2^p)(5^q-2^q)}{pq}
> $$
> is an integer are $\langle p,q\rangle=\langle3,3\rangle$, $\langle p,q\rangle=\langle3,13\rangle$ and $\langle p,q\rangle=\langle13,3\rangle$.

### Problem 8

Find all positive integers $n$ such that $3^n-1$ is divisible by $2^n$.

> [!Solution]-
> $$
> 2^n\mid3^n-1\Longleftrightarrow\nu_2(3^n-1^n)\ge n
> $$
>
> Applying the **Lifting-the-Exponent Lemma** yields
> $$
> \begin{align}
> \nu_2(3^n-1^n)&=\begin{cases}
> \nu_2(3-1)+\nu_2(3+1)+\nu_2(n)-1,&n\equiv0\pmod2\\
> \nu_2(3-1),&n\equiv1\pmod2\\
> \end{cases}\\
> &=\begin{cases}
> \nu_2(n)+2,&n\equiv0\pmod2\\
> 1,&n\equiv1\pmod2\\
> \end{cases}
> \end{align}
> $$
> Therefore,
> $$
> \begin{align}
> \nu_2(3^n-1^n)\ge n&\Longleftrightarrow(n\equiv0\pmod2\land\nu_2(n)+2\ge n)\lor(n\equiv1\pmod2\land1\ge n)\\
> &\Longleftrightarrow(n\equiv0\pmod2\land 2^{n-2}\mid n)\lor n=1\\
> &\Longleftrightarrow n=1\lor n=2\lor n=4
> \end{align}
> $$
> Therefore,
> $$
> 2^n\mid3^n-1\Longleftrightarrow n=1\lor n=2\lor n=4
> $$
>

### Problem 9

Find all positive integers $a$ such that $\frac{5^a+1}{3^a}$ is a positive integer.

> [!Solution]-
> $$
> \begin{align}
> \frac{5^a+1}{3^a}\in\Z_+&\Longleftrightarrow3^a\mid5^a+1\\
> &\Longrightarrow5^a+1\equiv0\pmod3\\
> &\Longleftrightarrow2^a\equiv2\pmod3\\
> &\Longleftrightarrow a\equiv1\pmod2
> \end{align}
> $$
>
> Therefore,
> $$
> \begin{align}
> 3^a\mid5^a+1&\Longleftrightarrow a\equiv1\pmod2\land 3^a\mid5^a+1\\
> &\Longleftrightarrow a\equiv1\pmod2\land\nu_3(5^a+1^a)\ge a\\
> \end{align}
> $$
> Applying the **Lifting-the-Exponent Lemma** yields that, if $a\equiv1\pmod 2$,
> $$
> \begin{align}
> \nu_3(5^a+1^a)&=\nu_3(6)+\nu_3(a)\\
> &=1+\nu_3(a)
> \end{align}
> $$
> Therefore,
> $$
> \begin{align}
> 3^a\mid5^a+1&\Longleftrightarrow1+\nu_3(a)\ge a\\
> &\Longleftrightarrow3^{a-1}\mid a\\
> &\Longleftrightarrow a=1
> \end{align}
> $$
> Therefore, the only positive integer $a$ such that $\frac{5^a+1}{3^a}$ is a positive integer is $a=1$.

### Problem 10

Let $p>3$ be a prime and $k\ge0$ an integer. Find the multiplicity of $X-1$ in the factorization of
$$
f(X)=X^{3p^k-1}+X^{3p^k-2}+\dots+X+1
$$
modulo $p$.

> [!Solution]-
> $$
> \begin{align}
> f(X)&\equiv X^{3p^k-1}+X^{3p^k-2}+\dots+X+1\pmod p\\
> &\equiv\frac{X^{3p^k}-1}{X-1}\pmod p\\
> &\equiv\frac{(X^3)^{p^k}-1^{p^k}}{X-1}\pmod p\\
> &\equiv\frac{(X^3-1)^{p^k}}{X-1}\pmod p\\
> &\equiv(X-1)^{p^k-1}(X^2+X+1)^{p^k}\pmod p\\
> \end{align}
> $$
>
> Since when $X=1$, $X-1\equiv0\pmod p$, $X^2+X+1\not\equiv0\pmod p$, it follows that the multiplicity of $X-1$ in the factorization of $f(X)$ is $p^k-1$, modulo $p$.

### Problem 11

Find all positive integers $n$ such that for every positive odd integer $a$, we have
$$
2^{2017}\mid a^n-1
$$

> [!Solution]-
> $$
> \forall a,2^{2017}\mid a^n-1\Longleftrightarrow\forall a,\nu_2(a^n-1^n)\ge2017
> $$
>
> Applying the **Lifting-the-Exponent Lemma** yields
> $$
> \nu_2(a^n-1^n)=\begin{cases}
> \nu_2(a-1)+\nu_2(a+1)+\nu_2(n)-1,&n\equiv0\pmod2\\
> \nu_2(a-1),&n\equiv1\pmod2
> \end{cases}
> $$
> Therefore,
> $$
> \begin{align}
> \forall a,2^{2017}\mid a^n-1&\Longleftrightarrow(n\equiv0\pmod2\land\forall a,\nu_2(a-1)+\nu_2(a+1)+\nu_2(n)-1\ge2017)\lor(n\equiv1\pmod2\land\forall a,\nu_2(a-1)\ge2017)\\
> &\Longleftrightarrow n\equiv0\pmod2\land\forall a,\nu_2(n)\ge2018-\nu_2(a-1)-\nu_2(a+1)\\
> &\Longleftrightarrow n\equiv0\pmod2\land\nu_2(n)\ge2018-\min_a\{\nu_2(a-1)+\nu_2(a+1)\}\\
> &\Longleftrightarrow n\equiv0\pmod2\land\nu_2(n)\ge2015\\
> &\Longleftrightarrow2^{2015}\mid n
> \end{align}
> $$
>

### Problem 12

Let $m,k\ge0,p=2^{2^m}+1$ a prime. Prove:

1. $2^{2^{m+1}p^k}\equiv1\pmod{p^{k+1}}$;

   > [!Solution]-
   > $$
   > \begin{align}
   > 2^{2^{m+1}p^k}\equiv1\pmod{p^{k+1}}&\Longleftrightarrow p^{k+1}\mid2^{2^{m+1}p^k}-1\\
   > &\Longleftrightarrow\nu_p((2^{2^{m+1}})^{p^k}-1^{p^k})\ge k+1
   > \end{align}
   > $$
   >
   > Applying the **Lifting-the-Exponent Lemma** yields
   > $$
   > \begin{align}
   > \nu_p((2^{2^{m+1}})^{p^k}-1^{p^k})&=\nu_p(2^{2^{m+1}}-1)+k\nu_p(p)\\
   > &=\nu_p(2^{2^m}-1)+\nu_p(2^{2^m}+1)+k\\
   > &=k+1\\
   > \end{align}
   > $$
   > Therefore,
   > $$
   > 2^{2^{m+1}p^k}\equiv1\pmod{p^{k+1}}
   > $$

2. The smallest $n$ such that $2^n\equiv1\pmod{p^{k+1}}$ is $2^{m+1}p^k$.

   > [!Solution]-
   >
   > If $\delta_{p^{k+1}}(2)<2^{m+1}p^k$,
   > $$
   > \begin{align}
   > 2^{2^{m+1}p^k}\equiv1\pmod{p^{k+1}}&\Longleftrightarrow\delta_{p^{k+1}}(2)\mid2^{m+1}p^k\\
   > &\Longleftrightarrow\delta_{p^{k+1}}(2)\mid2^mp^k\lor(k>0\land\delta_{p^{k+1}}(2)\mid2^{m+1}p^{k-1})\\
   > &\Longleftrightarrow2^{2^mp^k}\equiv1\pmod{p^{k+1}}\lor(k>0\land2^{2^{m+1}p^{k-1}}\equiv1\pmod{p^{k+1}})\\
   > \end{align}
   > $$
   >
   > $$
   > \begin{align}
   > p=2^{2^m}+1&\Longleftrightarrow2^{2^m}\equiv-1\pmod p\\
   > &\Longrightarrow2^{2^mp^k}\equiv-1\pmod p\\
   > &\Longleftrightarrow p\mid2^{2^mp^k}+1\\
   > &\Longrightarrow p\nmid2^{2^mp^k}-1\\
   > &\Longrightarrow p^{k+1}\nmid2^{2^mp^k}-1\\
   > &\Longleftrightarrow2^{2^mp^k}\not\equiv1\pmod{p^{k+1}}
   > \end{align}
   > $$
   >
   > If $k>0$,
   > $$
   > \begin{align}
   > 2^{2^{m+1}p^{k-1}}\equiv1\pmod{p^{k+1}}&\Longleftrightarrow p^{k+1}\mid2^{2^{m+1}p^{k-1}}-1\\
   > &\Longleftrightarrow\nu_p((2^{2^{m+1}})^{p^{k-1}}-1^{p^{k-1}})\ge k+1\\
   > &\Longleftrightarrow k\ge k+1\\
   > \end{align}
   > $$
   > Therefore,
   > $$
   > 2^{2^{m+1}p^{k-1}}\not\equiv1\pmod{p^{k+1}}
   > $$
   > Therefore,
   > $$
   > 2^{2^{m+1}p^k}\not\equiv1\pmod{p^{k+1}}
   > $$
   > By contradiction, it follows that
   > $$
   > \delta_{p^{k+1}}(2)=2^{m+1}p^k
   > $$
   > Therefore, the smallest $n$ such that $2^n\equiv1\pmod{p^{k+1}}$ is $2^{m+1}p^k$.
