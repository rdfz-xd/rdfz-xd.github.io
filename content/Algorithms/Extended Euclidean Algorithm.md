---
tags: [Computer Science]
---

The [[Extended Euclidean Algorithm]] is an algorithm that finds a pair of integers $x$ and $y$ such that $ax+by=\gcd(a,b)$ for integers $a$ and $b$ in $\mathcal{O}(\log(a)+\log(b))$ time and $\mathcal{O}(\log(a)+\log(b))$ space.

### Algorithm

> [!info] Lemma
> $$
> \forall a\in\Z,\forall b\in\Z\setminus\{0\},\gcd(a,b)=\gcd(b,a\bmod b)
> $$

Let $x'$ and $y'$ be integers such that
$$
bx'+(a\bmod b)y'=\gcd(b,a\bmod b)
$$
then applying the lemma yields
$$
\begin{align}
bx'+(a\bmod b)y'&=\gcd(a,b)
\end{align}
$$
Since
$$
\begin{align}
bx'+(a\bmod b)y'&=bx'+\left(a-\left\lfloor\frac{a}{b}\right\rfloor\right)y'\\
&=ay'+b\left(x'-\left\lfloor\frac{a}{b}\right\rfloor y'\right)
\end{align}
$$
it follows that if $x=y'\land y=x'-\lfloor\frac{a}{b}\rfloor y'$, $ax+by=\gcd(a,b)$.

This algorithm solves the problem in $\mathcal{O}(\log(a)+\log(b))$ time and $\mathcal{O}(\log(a)+\log(b))$ space.

~~~c++
int x = 1, y = 0;
y_combinator([&](auto &&self, int a, int b) -> void {
	if (!b) {
		return;
	}

	self(b, a % b);
	x = std::exchange(y, x - a / b * y);
})(a, b);

return {x, y};
~~~

> [!note]- Proof
>
> It is easy to prove that, since the third recursion, $a,b\in\N$ and $a\ge b$.
>
> If $a\in\N$ and $b\in\Z^+$,
> $$
> \begin{align}
> a\ge b&\iff\left\lfloor\frac{a}{b}\right\rfloor b>a\bmod b\\
> &\iff a-a\bmod b>a\bmod b\\
> &\iff a\bmod b<\frac{a}{2}
> \end{align}
> $$

