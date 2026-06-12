---
tags: [Computer Science]
---

The [[Extended Euclidean Algorithm]] is an algorithm that finds a pair of integers $x$ and $y$ such that $ax+by=\gcd(a,b)$ for non-negative integers $a$ and $b$ in $\mathcal{O}(\log a+\log b)$ time and $\mathcal{O}(\log a+\log b)$ space.

### Algorithm

> [!info] Lemma
> $$
> \forall a\in\N,\forall b\in\Z_+,\gcd(a,b)=\gcd(b,a\bmod b)
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

This algorithm solves the problem in $\mathcal{O}(\log a+\log b)$ time and $\mathcal{O}(\log a+\log b)$ space.

~~~c++
return y_combinator([&](auto &&self, int a, int b) -> std::pair<int, int> {
	if (!b) {
		return {1, 0};
	}
 
	auto [x, y] = self(b, a % b);
	return {y, x - a / b * y};
})(a, b);
~~~

> [!note]- Proof
>
> If $b>0$,
>$$
> \begin{align}
> a\ge b&\iff\left\lfloor\frac{a}{b}\right\rfloor b>a\bmod b\\
> &\iff a-a\bmod b>a\bmod b\\
> &\iff a\bmod b<\frac{a}{2}
> \end{align}
> $$

