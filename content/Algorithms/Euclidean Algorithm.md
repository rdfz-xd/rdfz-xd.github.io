---
tags: [Computer Science]
---

The [[Euclidean Algorithm]] is an algorithm that computes $\gcd\{a, b\}$ for non-negative integers $a$ and $b$ in $\mathcal{O}(\log a+\log b)$ time and $\mathcal{O}(\log a+\log b)$ space.

> [!tip]
>
> This problem can also be solved by the [[Extended Euclidean Algorithm]] in $\mathcal{O}(\log a+\log b)$ time and $\mathcal{O}(\log a+\log b)$ space.

### Algorithm

> [!info] Lemma
> $$
> \forall a\in\N,\forall b\in\Z_+,\gcd\{a,b\}=\gcd\{b,a\bmod b\}
> $$

0. Solve for $\gcd\{b,a\bmod b\}$ recursively.

1. Apply the lemma to find $\gcd\{a,b\}$.

This algorithm solves the problem in $\mathcal{O}(\log a+\log b)$ time and $\mathcal{O}(\log a+\log b)$ space.

~~~c++
int euclidean(int a, int b) {
	return y_combinator([&](auto &&self, int a, int b) -> int {
		return b ? self(b, a % b) : a;
	})(a, b);
}
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

