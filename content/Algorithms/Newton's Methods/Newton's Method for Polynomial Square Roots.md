---
tags: [Computer Science]
---

[[Newton's Method for Polynomial Square Roots]] is an algorithm that computes $\sqrt{f(x)}\bmod x^n$ for a formal power series $f(x)$ such that $f(0)\ne0$ in $\mathcal{O}(n\log n)$ time and $\mathcal{O}(n)$ space.

> [!tip]
>
> This problem can also be solved by [[Newton's Method for Polynomial Powers]] in $\mathcal{O}(n\log n)$ time and $\mathcal{O}(n)$ space.

### Algorithm

> [!info] Lemma
>
> Let $g_m(x)=\sqrt{f(x)}\bmod x^m$, then
> $$
> \forall m\in\Z_+,g_{2m}(x)=\frac{1}{2}\left(g_m(x)+\frac{f(x)}{g_m(x)}\right)\bmod x^{2m}
> $$
>
> > [!note]- Proof
> >
> > Let
> > $$
> > h(y)=y^2-f(x)
> > $$
> > then
> > $$
> > \begin{align}
> > h\left(\sqrt{f(x)}\right)=0&\iff\sum_{k=0}^\infty\frac{h^{(k)}(g_m(x))}{k!}\left(\sqrt{f(x)}-g_m(x)\right)^k=0\\
> > &\implies h(g_m(x))+h'(g_m(x))\left(\sqrt{f(x)}-g_m(x)\right)\equiv0\pmod{x^{2m}}\\
> > &\iff\sqrt{f(x)}\equiv g_m(x)-\frac{h(g_m(x))}{h'(g_m(x))}\pmod{x^{2m}}\\
> > &\iff\sqrt{f(x)}\equiv\frac{1}{2}\left(g_m(x)+\frac{f(x)}{g_m(x)}\right)\pmod{x^{2m}}
> > \end{align}
> > $$

For $m=2^0,2^1,\dots,2^{\lceil\log_2n\rceil-1}$, find $g_{2m}(x)$ in the following way:

0. Let $P(x)=f(x)\bmod x^{2m},Q(x)=g_m(x)^{-1}\bmod x^{2m}$. Apply [[Newton's Method for Polynomial Inversion]] to find $Q(x)$.
1. Let $N=4m$. Apply the [[Fast Fourier Transform]] to find $P(\omega_N^0),P(\omega_N^1),\dots,P(\omega_N^{N-1})$ and $Q(\omega_N^0),Q(\omega_N^1),\dots,Q(\omega_N^{N-1})$.
2. Use the results from 1 to find $P(\omega_N^0)Q(\omega_N^0),P(\omega_N^1)Q(\omega_N^1),\dots,P(\omega_N^{N-1})Q(\omega_N^{N-1})$.
3. Apply the [[Inverse Fast Fourier Transform]] to find $P(x)Q(x)$.
4. Apply the lemma to find $g_{2m}(x)$.

This algorithm solves the problem in $\mathcal{O}(n\log n)$ time and $\mathcal{O}(n)$ space.

```c++
std::vector<std::complex<double>> newton_sqrt(const std::vector<std::complex<double>> &a, int n) {
	std::vector x = {std::sqrt(a[0])};
	for (int m = 1; m < n; m *= 2) {
		std::vector y(a.begin(), a.begin() + std::min(2 * m, int(a.size())));
		auto z = newton_inv(x, 2 * m);

		y.resize(4 * m, 0), z.resize(4 * m, 0);
		fft(4 * m, y), fft(4 * m, z);
		for (int i = 0; i < 4 * m; i++) {
			y[i] *= z[i];
		}
		ifft(4 * m, y);

		x.resize(2 * m, 0);
		for (int i = 0; i < 2 * m; i++) {
			x[i] = (x[i] + y[i]) / (1. * 2);
		}
	}
	x.resize(n);

	return x;
}
```

> [!note]- Proof
> $$
> \begin{align}
> \mathcal{O}\left(\sum_{k=1}^{\lceil\log_2n\rceil}k2^k\right)&\subseteq\mathcal{O}\left((\log n)\sum_{k=1}^{\lceil\log_2n\rceil}2^k\right)\\
> &=\mathcal{O}(n\log n)
> \end{align}
> $$
