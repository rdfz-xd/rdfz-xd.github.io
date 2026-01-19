---
tags: [Computer Science]
---

The [[Euclidean Algorithm]] is an algorithm that computes $\gcd(a, b)$ for integers $a$ and $b$ in $\mathcal{O}(\log(a)+\log(b))$ time and $\mathcal{O}(\log(a)+\log(b))$ space.

### Algorithm

> [!info] Lemma
> $$
> \forall a\in\Z,\forall b\in\Z\setminus\{0\},\gcd(a,b)=\gcd(b,a\bmod b)
> $$

Applying the lemma yields an algorithm that solves the problem in $\mathcal{O}(\log(a)+\log(b))$ time and $\mathcal{O}(\log(a)+\log(b))$ space.

~~~c++
return y_combinator([&](auto &&self, int a, int b) -> int {
	return b ? self(b, a % b) : a;
})(a, b);
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

