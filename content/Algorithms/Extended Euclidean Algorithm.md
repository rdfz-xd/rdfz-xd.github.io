---
tags: [Computer Science]
---

The [[Extended Euclidean Algorithm]] is an algorithm that finds a pair of integers $x$ and $y$ such that $ax+by=\gcd\{a,b\}$ for non-negative integers $a$ and $b$ in $\mathcal{O}(\log a+\log b)$ time and $\mathcal{O}(\log a+\log b)$ space.

### Algorithm

> [!info] Lemma
>
> Let $x=y',y=x'-\lfloor\frac{a}{b}\rfloor y'$, then
> $$
> \forall x',y'\in\Z,bx'+(a\bmod b)y'=\gcd\{b,a\bmod b\}\Rightarrow ax+by=\gcd\{a,b\}
> $$
> 
> > [!note]- Proof
> > $$
> > \begin{align}
>> ax+by&=ay'+b\left(x'-\left\lfloor\frac{a}{b}\right\rfloor y'\right)\\
> > &=bx'+\left(a-\left\lfloor\frac{a}{b}\right\rfloor\right)y'\\
> > &=bx'+(a\bmod b)y'\\
> > &=\gcd\{b,a\bmod b\}\\
> > &=\gcd\{a,b\}
> > \end{align}
> > $$

1. Solve for $bx'+(a\bmod b)y'=\gcd\{b,a\bmod b\}$ recursively.
2. Applying the lemma yields that $x=y',y=x'-\lfloor\frac{a}{b}\rfloor y'$ is a solution for $ax+by=\gcd\{a,b\}$.

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

