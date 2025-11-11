### Problem 1

Find the number of integer values of $k$ in the closed interval $[-500,500]$ for which the equation
$$
\log(kx)=2\log(x+2)
$$
has exactly one real solution.

### Solution 1

$$
\begin{align}
\log(kx)=2\log(x+2)&\Longleftrightarrow x>-2\land\log(kx)=\log((x+2)^2)\\
&\Longleftrightarrow x>-2\land kx>0\land kx=(x+2)^2\\
&\Longleftrightarrow x>-2\land kx>0\land x^2+(4-k)x+4=0\\
\end{align}
$$

Let $f(x)=x^2+(4-k)x+4=(x-x_1)(x-x_2)$, where $x_1=\frac{k-4-\sqrt{k(k-8)}}{2},x_2=\frac{k-4+\sqrt{k(k-8)}}{2}$, then
$$
\begin{align}
\log(kx)=2\log(x+2)&\Longleftrightarrow x>-2\land kx>0\land f(x)=0\\
&\Longleftrightarrow x>-2\land kx>0\land(x=x_1\lor x=x_2)\\
&\Longrightarrow k<0\lor k\ge8
\end{align}
$$
Applying Vieta's Formulas yields
$$
x_1+x_2=k-4\land x_1x_2=4
$$
If $k<0$,
$$
\begin{align}
x_1+x_2=k-4\land x_1x_2=4&\Longrightarrow x_1+x_2<0\land x_1x_2>0\\
&\Longleftrightarrow x_1<0\land x_2<0\\
\end{align}
$$
Since $f''(x)=2>0\land f(-2)=2k<0$, it follows that
$$
x_1<-2\land x_2>-2
$$
Therefore,
$$
\log(kx)=2\log(x+2)\Longleftrightarrow x=x_2
$$
Therefore, if $k<0$, $\log(kx)=2\log(x+2)$ always has exactly one real solution.

If $k\ge8$,
$$
\begin{align}
x_1+x_2=k-4\land x_1x_2=4&\Longrightarrow x_1+x_2>0\land x_1x_2>0\\
&\Longleftrightarrow x_1>0\land x_2>0\\
\end{align}
$$
Therefore,
$$
\log(kx)=2\log(x+2)\Longleftrightarrow x=x_1\lor x=x_2
$$
Therefore, if $k\ge8$, $\log(kx)=2\log(x+2)$ has exactly one real solution iff
$$
\begin{align}
x_1=x_2&\Longleftrightarrow k(k-8)=0\\
&\Longleftrightarrow k=8
\end{align}
$$
Therefore, $\log(kx)=2\log(x+2)$ has exactly one real solution iff
$$
k<0\lor k=8
$$
There are $501$ integer values of $k$ in $[-500,500]$ such that $k<0\lor k=8$.

### Problem 2

Real numbers $x$ and $y$ with $x,y>1$ satisfy $\log_x(y^x)=\log_y(x^{4y})=10$. What is the value of $xy$?

### Solution 2

$$
\begin{align}
\log_x(y^x)\log_y(x^{4y})&=x\log_x(y)\cdot4y\log_y(x)\\
&=4xy
\end{align}
$$

Therefore,
$$
4xy=100
$$

$$
4xy=100\Longleftrightarrow xy=25
$$

### Problem 3

Let $x$, $y$ and $z$ be positive real numbers that satisfy the following system of equations:
$$
\log_2\left(\frac{x}{yz}\right)=\frac{1}{2},\log_2\left(\frac{y}{xz}\right)=\frac{1}{3},\log_2\left(\frac{z}{xy}\right)=\frac{1}{4}
$$
Then the value of $\left|\log_2(x^4y^3z^2)\right|$ is $\frac{m}{n}$ where $m$ and $n$ are relatively prime positive integers. Find $m+n$.

### Solution 3

$$
\begin{align}
\log_2\left(\frac{x}{yz}\right)=\frac{1}{2}\land\log_2\left(\frac{y}{xz}\right)=\frac{1}{3}\land\log_2\left(\frac{z}{xy}\right)=\frac{1}{4}&\Longleftrightarrow\log_2(x)-\log_2(y)-\log_2(z)=\frac{1}{2}\land\log_2(y)-\log_2(x)-\log_2(z)=\frac{1}{3}\land\log_2(z)-\log_2(x)-\log_2(y)=\frac{1}{4}\\
&\Longleftrightarrow\log_2(x)=-\frac{7}{24}\land\log_2(y)=-\frac{3}{8}\land\log_2(z)=-\frac{5}{12}
\end{align}
$$

Therefore,
$$
\begin{align}
\left|\log_2(x^4y^3z^2)\right|&=\left|4\log_2(x)+3\log_2(y)+2\log(z)\right|\\
&=\frac{25}{8}
\end{align}
$$
Therefore, $m+n=33$.

### Problem 4

Let $a>1$ and $x>1$ satisfy
$$
\log_a(\log_a(\log_a(2))+\log_a(2)-128)=128\land\log_a(\log_a(x))=256
$$
Find the reminder when $x$ is divided by $1000$.

### Solution 4

$$
\begin{align}
\log_a(\log_a(\log_a(2))+\log_a(24)-128)=128&\Longleftrightarrow\log_a(24\log_a(2))=128+a^{128}\\
&\Longleftrightarrow\log_a(2^{24})=a^{128}a^{a^{128}}\\
&\Longleftrightarrow2^{24}=\left(a^{a^{128}}\right)^{a^{a^{128}}}\\
&\Longleftrightarrow a^{a^{128}}=2^3\\
&\Longleftrightarrow a=2^\frac{3}{64}\\
\end{align}
$$

Therefore,
$$
\begin{align}
\log_a(\log_a(x))=256&\Longleftrightarrow x=a^{a^{256}}\\
&\Longleftrightarrow x=2^{192}\\
&\Longrightarrow x\equiv896\pmod{1000}
\end{align}
$$
### Problem 5

Let $x$, $y$ and $z$ be real numbers satisfying the system
$$
\log_2(xyz-3+\log_5(x))=5\\
\log_3(xyz-3+\log_5(y))=4\\
\log_4(xyz-3+\log_5(z))=4
$$
Find the value of $\left|\log_5(x)\right|+\left|\log_5(y)\right|+\left|\log_5(z)\right|$.

### Solution 5

$$
\begin{align}
\log_2(xyz-3+\log_5(x))=5\land\log_3(xyz-3+\log_5(y))=4\land\log_4(xyz-3+\log_5(z))=4&\Longleftrightarrow xyz+\log_5(x)=35\land xyz+\log_5(y)=84\land xyz+\log_5(z)=259\\
&\Longrightarrow3xyz+\log_5(xyz)=378\\
&\Longleftrightarrow xyz=125
\end{align}
$$

Therefore,
$$
xyz+\log_5(x)=35\Longleftrightarrow\log_5(x)=-90
$$

$$
xyz+\log_5(y)=84\Longleftrightarrow\log_5(y)=-41
$$

$$
xyz+\log_5(z)=259\Longleftrightarrow\log_5(z)=134
$$

Therefore,
$$
\left|\log_5(x)\right|+\left|\log_5(y)\right|+\left|\log_5(z)\right|=265
$$

### Problem 6

Quadratic polynomials $P(x)$ and $Q(x)$ have leading coefficients of $2$ and $-2$, respectively. The graphs of both polynomials pass through the two points $(16,54)$ and $(20,53)$. Find $P(0)+Q(0)$.

### Solution 6

Let $P(x)=2x^2+b_Px+c_P$, then
$$
\begin{align}
P(16)=54\land P(20)=53&\Longleftrightarrow512+16b_P+c_P=54\land800+20b_P+c_P=53\\
&\Longleftrightarrow b_P=-\frac{289}{4}\land c_P=698
\end{align}
$$
Therefore,
$$
P(x)=2x^2-\frac{289}{4}x+698
$$
Let $Q(x)=-2x^2+b_Qx+c_Q$, then
$$
\begin{align}
Q(16)=54\land Q(20)=53&\Longleftrightarrow-512+16b_Q+c_Q=54\land-800+20b_Q+c_Q=53\\
&\Longleftrightarrow b_Q=\frac{287}{4}\land c_Q=-582
\end{align}
$$
Therefore,
$$
Q(x)=-2x^2+\frac{287}{4}x-582
$$
Therefore,
$$
\begin{align}
P(0)+Q(0)&=698-582\\
&=116
\end{align}
$$

### Problem 7

For certain real numbers $a$, $b$, and $c$, the polynomial
$$
g(x)=x^3+ax^2+x+10
$$
has three distinct roots, and each root of $g(x)$ is also a root of the polynomial
$$
f(x)=x^4+x^3+bx^2+100x+c
$$

### Solution 7

Let $x_0$ be the additional root of $f(x)$, then
$$
\begin{align}
f(x)&=(x-x_0)g(x)\\
&=(x-x_0)(x^3+ax^2+x+10)\\
&=x^4+(a-x_0)x^3+(1-ax_0)x^2+(10-x_0)x-10x_0
\end{align}
$$
Therefore,
$$
a-x_0=1\land1-ax_0=b\land10-x_0=100\land-10x_0=c
$$

$$
a-x_0=1\land1-ax_0=b\land10-x_0=100\land-10x_0=c\Longleftrightarrow x_0=-90\land a=-89\land b=-8009\land c=900
$$

Therefore,
$$
f(x)=x^4+x^3-8009x^2+100x+900
$$
Therefore, $f(1)=-7007$.

### Problem 8

There are nonzero integers $a$, $b$, $r$ and $s$ such that the complex number $r+si$ is a zero of the polynomial $P(x)=x^3-ax^2+bx-65$. For each possible combination of $a$ and $b$, let $\rho_{a,b}$ be the sum of the zeros of $P(x)$. Find the sum of the $\rho_{a,b}$'s for all possible combinations of $a$ and $b$.

### Solution 8

It is easy to prove that the problem is equivalent to finding the sum of the sum of zeros of all $P(x)\in\R[x]$ such that
$$
\exist r,s\in\Z\setminus\{0\},P(r+si)=0\land\exist a,b\in\Z\setminus\{0\},P(x)=x^3-ax^2+bx-65
$$
Since $P(x)\in\R[x]$, it follows that
$$
P(r+si)=0\Longleftrightarrow P(r-si)=0
$$
Therefore,
$$
\begin{align}
\exist r,s\in\Z\setminus\{0\},P(r+si)=0&\Longleftrightarrow\exist r,s\in\Z\setminus\{0\},\exist t\in\R,P(x)=(x-r+si)(x-r-si)(x-t)\\
&\Longleftrightarrow\exist r,s\in\Z\setminus\{0\},\exist t\in\R,P(x)=x^3-(2r+t)x^2+(r^2+s^2+2rt)x-(r^2+s^2)t
\end{align}
$$
Therefore,
$$
\begin{align}
\exist r,s\in\Z\setminus\{0\},P(r+si)=0\land\exist a,b\in\Z\setminus\{0\},P(x)=x^3-ax^2+bx-65&\Longleftrightarrow\exist r,s\in\Z\setminus\{0\},\exist t\in\R,P(x)=x^3-(2r+t)x^2+(r^2+s^2+2rt)x-(r^2+s^2)t\land2r+t\in\Z\setminus\{0\}\land r^2+s^2+2rt\in\Z\setminus\{0\}\land(r^2+s^2)t=65\\
&\Longleftrightarrow\exist r,s\in\Z\setminus\{0\},\exist t\in\Z_+,P(x)=x^3-(2r+t)x^2+(r^2+s^2+2rt)x-(r^2+s^2)t\land(r^2+s^2)t=65\\
&\Longleftrightarrow\exist\langle r,s,t\rangle\in\{\langle1,2,13\rangle,\langle2,1,13\rangle,\langle-1,-2,13\rangle,\langle-2,-1,13\rangle,\langle2,3,5\rangle,\langle3,2,5\rangle,\langle-2,-3,5\rangle,\langle-3,-2,5\rangle,\langle1,8,1\rangle,\langle8,1,1\rangle,\langle-1,-8,1\rangle,\langle-8,-1,1\rangle\,\langle4,7,1\rangle,\langle7,4,1\rangle,\langle-4,-7,1\rangle,\langle-7,-4,1\rangle\},P(x)=(x-r+si)(x-r-si)(x-t)
\end{align}
$$
Therefore, the sum of the sum of zeros of $P(x)$ is $80$.

### Problem 9

Find all polynomials $f(x)$ with real coefficients such that $f(x^2)=f(x)^2$.

### Solution 9

$$
\begin{align}
f(x^2)=f(x)^2&\Longrightarrow\forall x\in\mathbb{C},f(x^2)=0\leftrightarrow f(x)^2=0\\
&\Longleftrightarrow\forall x\in\mathbb{C},f(x^2)=0\leftrightarrow f(x)=0
\end{align}
$$

Therefore, if $\exist x\in\C\setminus\{-1,0,1\},f(x)=0$, infinitely many distinct numbers
$$
x,x^2,x^4,x^8,\dots
$$
are all zeros of $f(x)$. If $\exist x\in\{0,1\},f(x)=0$, infinitely many distinct numbers
$$
e^{i\pi},e^\frac{i\pi}{2},e^\frac{i\pi}{4},e^\frac{i\pi}{8},\dots
$$
are all zeros of $f(x)$. Therefore,
$$
\begin{align}
f(x^2)=f(x)^2&\Longrightarrow f(x)=0\lor\forall x\in\mathbb{C}\setminus\{0\},f(x)\ne0\\
&\Longleftrightarrow\exist a\in\R,\exist n\in\N,f(x)=ax^n
\end{align}
$$
Therefore,
$$
\begin{align}
f(x^2)=f(x)^2&\Longleftrightarrow\exist a\in\R,\exist n\in\N,f(x)=ax^n\land ax^{2n}=a^2x^{2n}\\
&\Longleftrightarrow\exist a\in\R,\exist n\in\N,f(x)=ax^n\land(a=0\lor a=1)\\
&\Longleftrightarrow f(x)=0\lor\exist n\in\N,f(x)=x^n
\end{align}
$$

### Problem 10

There exist two triples of real numbers $\langle a,b,c\rangle$ such that $a-\frac{1}{b}$, $b-\frac{1}{c}$, and $c-\frac{1}{a}$ are the roots to the cubic equation $x^3-5x^2-15x+3$ listed in increasing order. Denote those $\langle a_1,b_1,c_1\rangle$ and $\langle a_2,b_2,c_2\rangle$. If $a_1$, $b_1$ and $c_1$ are the roots to monic cubic polynomial $f$ and $a_2$, $b_2$ and $c_2$ are the roots to monic cubic polynomial $g$, find $f(0)^3+g(0)^3$.

### Solution 10

Applying Vieta's Lemma yields
$$
\left(a-\frac{1}{b}\right)\left(b-\frac{1}{c}\right)\left(c-\frac{1}{a}\right)=-3
$$

$$
\left(a-\frac{1}{b}\right)\left(b-\frac{1}{c}\right)\left(c-\frac{1}{a}\right)=-3\Longleftrightarrow abc-a-b-c+\frac{1}{a}+\frac{1}{b}+\frac{1}{c}-\frac{1}{abc}=-3
$$

Applying Vieta's Lemma yields
$$
a-\frac{1}{b}+b-\frac{1}{c}+c-\frac{1}{a}=5
$$
Therefore,
$$
abc-\frac{1}{abc}=2
$$

$$
\begin{align}
abc-\frac{1}{abc}=2&\Longleftrightarrow(abc)^2-2abc-1=0\\
&\Longleftrightarrow abc=1-\sqrt2\lor abc=1+\sqrt2
\end{align}
$$

Applying Vieta's Lemma yields
$$
f(0)=-a_1b_1c_1,g(0)=-a_2b_2c_2
$$
It is *easy* to prove that $f(0)\ne g(0)$, therefore
$$
\begin{align}
f(0)^3+g(0)^3&=\left(-\left(1-\sqrt2\right)\right)^3+\left(-\left(1+\sqrt2\right)\right)^3\\
&=-14
\end{align}
$$

### Problem 11

Find all possible values of $a$ such that the roots of polynomial $x^3-6x^2+ax+a$ (denote by $x_1,x_2,x_3$) satisfy that $(x_1-3)^3+(x_2-3)^3+(x_3-3)^3=0$.

### Solution 11

Applying Newton's Identities yields
$$
x_1+x_2+x_3=6
$$

$$
\begin{align}
x_1^2+x_2^2+x_3^2&=6(x_1+x_2+x_3)-2a\\
&=36-2a
\end{align}
$$

$$
\begin{align}
x_1^3+x_2^3+x_3^3&=6(x_1^2+x_2^2+x_3^2)-a(x_1+x_2+x_3)-3a\\
&=216-21a
\end{align}
$$

Therefore,
$$
\begin{align}
(x_1-3)^3+(x_2-3)^3+(x_3-3)^3&=x_1^3+x_2^3+x_3^3-9(x_1^2+x_2^2+x_3^2)+27(x_1+x_2+x_3)-81\\
&=-3a-27
\end{align}
$$
Therefore,
$$
\begin{align}
(x_1-3)^3+(x_2-3)^3+(x_3-3)^3=0&\Longleftrightarrow-3a-27=0\\
&\Longleftrightarrow a=-9
\end{align}
$$

### Problem 12

If $r$, $s$, $t$ and $u$ denote the roots of the polynomial $f(x)=x^4+3x^3+3x+2$, evaluate $\frac{1}{r^2}+\frac{1}{s^2}+\frac{1}{t^2}+\frac{1}{u^2}$.

### Solution 12

Let
$$
\begin{align}
g(x)&=x^nf(x^{-1})\\
&=2x^4+3x^3+3x+1
\end{align}
$$
then, since
$$
\begin{align}
g(x)&=x^nf(x^{-1})\\
&=(rx-1)(sx-1)(tx-1)(ux-1)
\end{align}
$$
$g(x)$ is a polynomial with roots $\frac{1}{r}$, $\frac{1}{s}$, $\frac{1}{t}$ and $\frac{1}{u}$.

Applying Newton's Identities yields
$$
\frac{1}{r}+\frac{1}{s}+\frac{1}{t}+\frac{1}{u}=-\frac{3}{2}
$$

$$
\begin{align}
\frac{1}{r^2}+\frac{1}{s^2}+\frac{1}{t^2}+\frac{1}{u^2}&=-\frac{3}{2}\left(\frac{1}{r}+\frac{1}{s}+\frac{1}{t}+\frac{1}{u}\right)\\
&=\frac{9}{4}
\end{align}
$$

### Problem 13

Find all polynomials of degree less than $4$ satisfying that $f(0)=1,f(1)=1,f(2)=5,f(3)=11$.

### Solution 13

It is easy to prove the problem is equivalent to finding all polynomials $f(x)$ such that
$$
\exist a,b,c,d\in\Z,f(x)=ax^3+bx^2+cx+d\land f(0)=1\land f(1)=1\land f(2)=5\land f(3)=11
$$

$$
\begin{align}
\exist a,b,c,d\in\Z,f(x)=ax^3+bx^2+cx+d\land f(0)=1\land f(1)=1\land f(2)=5\land f(3)=11&\Longleftrightarrow\exist a,b,c,d\in\Z,f(x)=ax^3+bx^2+cx+d\land d=1\land a+b+c+d=1\land 8a+4b+2c+d=5\land 27a+9b+3c+d=11\\
&\Longleftrightarrow\exist a,b,c,d\in\Z,f(x)=ax^3+bx^2+cx+d\land a=-\frac{1}{3}\land b=3\land c=-\frac{8}{3}\land d=1\\
&\Longleftrightarrow f(x)=-\frac{1}{3}x^3+3x^2-\frac{8}{3}x+1
\end{align}
$$

### Problem 14

What is the sum of the roots of $z^{12}=64$ that have a positive real part?

### Solution 14

The roots of $z^{12}=64$ are
$$
z_k=\sqrt2\left(\cos\left(\frac{k\pi}{6}\right)+i\sin\left(\frac{k\pi}{6}\right)\right),k=0,1,\dots,11
$$
Since
$$
\cos\left(\frac{k\pi}{6}\right)>0\Longleftrightarrow k\in\{0,1,2,10,11\}
$$
It follows that the roots with a positive real part are $z_0,z_1,z_2,z_{10},z_{11}$.
$$
\begin{align}
\sum_{k\in\{0,1,2,10,11\}}z_k&=\sqrt2\sum_{k\in\{0,1,2,10,11\}}\cos\left(\frac{k\pi}{6}\right)+\sqrt2i\sum_{k\in\{0,1,2,10,11\}}\sin\left(\frac{k\pi}{6}\right)\\
&=\sqrt2\left(\cos(0)+2\cos\left(\frac{\pi}{6}\right)+2\cos\left(\frac{\pi}{3}\right)\right)\\
&=2\sqrt2+\sqrt6
\end{align}
$$

### Problem 15

The equation $x^2-2ax+a^2-4a=0,a\in\R$ has at least one root with magitude $3$. Find all possible values of $a$.

### Solution 15

Let $f(x)=x^2-2ax+a^2-4a$, then it is easy to prove that the problem is equivalent to finding all possible values of $a$ such that
$$
\exist x\in\mathbb C,|x|=3\land f(x)=0
$$

$$
\exist x\in\mathbb C,|x|=3\land f(x)=0\Longleftrightarrow(\exist x\in\R,|x|=3\land f(x)=0)\lor(\exist x\in\mathbb C\setminus\R,|x|=3\land f(x)=0)
$$

$$
\begin{align}
\exist x\in\R,|x|=3\land f(x)=0&\Longleftrightarrow\exist x\in\{-3,3\},f(x)=0\\
&\Longleftrightarrow a^2+2a+9=0\lor a^2-10a+9=0\\
&\Longleftrightarrow a=1\lor a=9\\
\end{align}
$$

Since $f(x)\in\R[x]$, it follows that
$$
f(x)=0\Longleftrightarrow f(\overline x)=0
$$
Therefore, applying Vieta's Formulas yields
$$
\begin{align}
\exist x\in\mathbb C\setminus\R,|x|=3\land f(x)=0&\Longleftrightarrow \exist x\in\mathbb C\setminus\R,|x|=3\land x+\overline{x}=2a\land x\overline{x}=a^2-4a\\
&\Longleftrightarrow \exist x\in\mathbb C\setminus\R,|x|=3\land\Re(x)=a\land|x|^2=a^2-4a\\
&\Longleftrightarrow a^2-4a=9\land\exist x\in\mathbb C\setminus\R,|x|=3\land\Re(x)=a\\
&\Longleftrightarrow a^2-4a-9=0\land-3\le a\le3\\
&\Longleftrightarrow a=2-\sqrt{13}
\end{align}
$$
Therefore,
$$
\exist x\in\mathbb C,|x|=3\land f(x)=0\Longleftrightarrow a=1\lor a=9\lor a=2-\sqrt{13}
$$

### Problem 16

Let $z=a+bi$ be the complex number with $|z|=5$ and $b>0$ such that the distance between $(1+2i)z^3$ and $z^5$ is maximized, and let $z^4=c+di$. Find $c+d$.

### Solution 16

$$
\begin{align}
\operatorname*{argmax}_{|z|=5\land\Im(z)>0}\left|(1+2i)z^3-z^5\right|&=\operatorname*{argmax}_{|z|=5\land\Im(z)>0}|z|^3\left|1+2i-z^2\right|\\
&=\operatorname*{argmax}_{|z|=5\land\Im(z)>0}\left|1+2i-z^2\right|\\
&=\left\{\sqrt{-25\frac{1+2i}{|1+2i|}}\right\}\\
&=\left\{\sqrt{-5\sqrt5(1+2i)}\right\}
\end{align}
$$

Therefore,
$$
z=\sqrt{-5\sqrt5(1+2i)}
$$
Therefore,
$$
\begin{align}
z^4&=\left(-5\sqrt5(1+2i)\right)^2\\
&=-375+500i
\end{align}
$$
Therefore, $c+d=125$.

### Problem 17

Evaluate
$$
\sum_{n=0}^\infty\frac{\cos(n\theta)}{2^n}
$$
where $\cos(\theta)=\frac{1}{5}$.

### Solution 17

$$
\begin{align}
\sum_{n=0}^\infty\frac{\cos(n\theta)}{2^n}&=\sum_{n=0}^\infty\frac{\Re(e^{in\theta})}{2^n}\\
&=\Re\left(\sum_{n=0}^\infty\left(\frac{e^{i\theta}}{2}\right)^n\right)\\
&=2\Re\left(\frac{1}{2-e^{i\theta}}\right)\\
&=2\Re\left(\frac{2-\cos(\theta)+i\sin(\theta)}{(2-\cos(\theta))^2+\sin(\theta)^2}\right)\\
&=\frac{4-2\cos(\theta)}{(2-\cos(\theta))^2+1-\cos(\theta)^2}\\
&=\frac{4-2\cos(\theta)}{(2-\cos(\theta))^2+1-\cos(\theta)^2}\\
&=\frac{6}{7}
\end{align}
$$

### Problem 18

Let $\omega\ne1$ be a $13$th root of unity. Find the remainder when $\prod_{k=0}^{12}(2-2\omega^k+\omega^{2k})$ is divided by $1000$.

### Solution 18

$$
\begin{align}
\prod_{k=0}^{12}(2-2\omega^k+\omega^{2k})&=\prod_{x^{13}-1=0}(x^2-2x+2)\\
&=\prod_{x^{13}-1=0}\prod_{y^2-2y+2=0}(x-y)\\
&=\prod_{y^2-2y+2=0}\prod_{x^{13}-1=0}(y-x)\\
&=\prod_{y^2-2y+2=0}(y^{13}-1)\\
&=((1-i)^{13}-1)((1+i)^{13}-1)\\
&=8321
\end{align}
$$

The remainder when $8321$ is divided by $1000$ is $321$.

### Problem 19

The polynomial $f(z)=az^{2018}+bz^{2017}+cz^{2016}$ has real coefficients not exceeding $2019$, and $f\left(\frac{1+\sqrt3i}{2}\right)=2015+2019\sqrt3i$. Find the remainder when $f(1)$ is divided by $1000$.

### Solution 19

Since $\left(\frac{1+\sqrt3i}{2}\right)^6=1$, it follows that
$$
\begin{align}
f\left(\frac{1+\sqrt3i}{2}\right)&=a\left(\frac{1+\sqrt3i}{2}\right)^{2018}+b\left(\frac{1+\sqrt3i}{2}\right)^{2017}+c\left(\frac{1+\sqrt3i}{2}\right)^{2016}\\
&=a\left(\frac{-1+\sqrt3i}{2}\right)+b\left(\frac{1+\sqrt3i}{2}\right)+c\\
&=-\frac{a}{2}+\frac{b}{2}+c+\left(\frac{a}{2}+\frac{b}{2}\right)\sqrt3i
\end{align}
$$
Therefore,
$$
\begin{align}
f\left(\frac{1+\sqrt3i}{2}\right)=2015+2019\sqrt3i&\Longleftrightarrow-\frac{a}{2}+\frac{b}{2}+c+\left(\frac{a}{2}+\frac{b}{2}\right)\sqrt3i=2015+2019\sqrt3i\\
&\Longleftrightarrow-\frac{a}{2}+\frac{b}{2}+c=2015\land\frac{a}{2}+\frac{b}{2}=2019\\
&\Longleftrightarrow a=2019\land b=2019\land c=2015\\
\end{align}
$$
Therefore,
$$
\begin{align}
f(1)&=a+b+c\\
&=6053
\end{align}
$$
The remainder when $6053$ is divided by $1000$ is $53$.

### Problem 20

Find the largest possible real part of $(75+117i)z+\frac{96+144i}{z}$ where $z$ is a complex number with $|z|=4$.

### Solution 20

$$
\begin{align}
\max_{|z|=4}\Re\left((75+117i)z+\frac{96+144i}{z}\right)&=\max_\theta\Re((300+468i)e^{i\theta}+(24+36i)e^{-i\theta})\\
&=\max_\theta(324\cos(\theta)-432\sin(\theta))
\end{align}
$$

Applying Cauchy-Schwarz Inequality yields
$$
\begin{align}
324\cos(\theta)-432\sin(\theta)&\le\sqrt{(324^2+432^2)(\cos(\theta)^2+\sin(\theta)^2)}\\
&=540
\end{align}
$$
and when $\theta=-\arctan\left(\frac{4}{3}\right)$, $324\cos(\theta)-432\sin(\theta)=540$. Therefore,
$$
\max_\theta(324\cos(\theta)-432\sin(\theta))=540
$$

### Problem 21

Let $a,b,c,d$ be real numbers such that $b-d\ge5$ and all zeros $x_1,x_2,x_3,x_4$ of the polynomial
$$
P(x)=x^4+ax^3+bx^2+cx+d
$$
are real. Find the smallest possible value of the product
$$
(x_1^2+1)(x_2^2+1)(x_3^2+1)(x_4^2+1)
$$

### Solution 21

$$
\begin{align}
(x_1^2+1)(x_2^2+1)(x_3^2+1)(x_4^2+1)&=(i-x_1)(-i-x_1)(i-x_2)(-i-x_2)(i-x_3)(-i-x_3)(i-x_4)(-i-x_4)\\
&=P(i)P(-i)\\
&=(b-d-1+(a-c)i)(b-d+1-(a-c)i)\\
&=(b-d-1)^2+(a-c)^2
\end{align}
$$

Therefore, the smallest possible value of the product is $16$.

### Problem 22

Let $N$ be the number of complex numbers $z$ with the properties that $|z|=1$ and $z^{6!}-z^{5!}$ is a real number. Find the remainder when $N$ is divided by $1000$.

### Solution 22

$$
\begin{align}
N&=|\{z:z\in\mathbb{C}\land|z|=1\land z^{6!}-z^{5!}\in\R\}|\\
&=|\{\theta:\theta\in[0,2\pi)\land e^{6!i\theta}-e^{5!i\theta}\in\R\}|
\end{align}
$$

$$
\begin{align}
e^{6!i\theta}-e^{5!i\theta}\in\R&\Longleftrightarrow\sin(6!\theta)-\sin(5!\theta)=0\\
&\Longleftrightarrow2\cos(420\theta)\sin(300\theta)=0\\
&\Longleftrightarrow\cos(420\theta)=0\lor\sin(300\theta)=0\\
&\Longleftrightarrow\left(\exist n\in\Z,\theta=\frac{(2n+1)\pi}{840}\right)\lor\left(\exist n\in\Z,\theta=\frac{n\pi}{300}\right)
\end{align}
$$

Therefore,
$$
\begin{align}
N&=\left|\left\{\frac{1\pi}{840},\frac{3\pi}{840},\dots,\frac{1679\pi}{840}\right\}\cup\left\{\frac{0\pi}{300},\frac{1\pi}{300},\dots,\frac{599\pi}{300}\right\}\right|\\
&=|\{1,3,\dots,1679\}|+|\{0,1,\dots,599\}|\\
&=1440
\end{align}
$$
Therefore, the remainder when $N$ is divided by $1000$ is $440$.

### Problem 23

Evaluate the following sums:

(a)
$$
\binom{48}{0}+\binom{48}{3}+\dots+\binom{48}{48}
$$
(b)
$$
\binom{48}{0}+\binom{48}{4}+\dots+\binom{48}{48}
$$

### Solution 23

(a)
$$
\begin{align}
\binom{48}{0}+\binom{48}{3}+\dots+\binom{48}{48}&=\sum_{n=0}^{48}\binom{48}{n}[3\mid n]\\
&=\frac{1}{3}\sum_{n=0}^{48}\binom{48}{n}\sum_{k=0}^2\omega_3^{kn}\\
&=\frac{1}{3}\sum_{k=0}^2\sum_{n=0}^{48}\binom{48}{n}(\omega_3^k)^n\\
&=\frac{1}{3}\sum_{k=0}^2(1+\omega_3^k)^{48}\\
&=\frac{2^{48}+\left(\frac{1+\sqrt3i}{2}\right)^{48}+\left(\frac{1-\sqrt3i}{2}\right)^{48}}{3}\\
&=\frac{2^{48}+2}{3}\\
\end{align}
$$
(b)
$$
\begin{align}
\binom{48}{0}+\binom{48}{4}+\dots+\binom{48}{48}&=\sum_{n=0}^{48}\binom{48}{n}[4\mid n]\\
&=\frac{1}{4}\sum_{n=0}^{48}\binom{48}{n}\sum_{k=0}^3\omega_4^{kn}\\
&=\frac{1}{4}\sum_{k=0}^3\sum_{n=0}^{48}\binom{48}{n}(\omega_4^k)^n\\
&=\frac{1}{4}\sum_{k=0}^3(1+\omega_4^k)^{48}\\
&=\frac{2^{48}+(1+i)^{48}+0^{48}+(1-i)^{48}}{4}\\
&=\frac{2^{48}+2^{25}}{4}\\
\end{align}
$$
