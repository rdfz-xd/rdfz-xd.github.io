---
tags: [Computer Science]
---

[[Newton's Method for Polynomial Inversion]] is an algorithm that computes $f(x)^{-1}\bmod x^n$ for a formal power series $f(x)$ such that $f(0)\ne0$ in $\mathcal{O}(n\log n)$ time and $\mathcal{O}(n)$ space.

> [!tip]
>
> This problem can also be solved by [[Newton's Method for Polynomial Powers]] in $\mathcal{O}(n\log n)$ time and $\mathcal{O}(n)$ space.

### Algorithm

> [!info] Lemma
>
> Let $g_m(x)=f(x)^{-1}\bmod x^m$, then
> $$
> \forall m\in\Z_+,g_{2m}(x)=g_m(x)(2-g_m(x)f(x))\bmod x^{2m}
> $$
>
> > [!note]- Proof
> >
> > Let
> > $$
> > h(y)=y^{-1}-f(x)
> > $$
> > then
> > $$
> > \begin{align}
> > h(f(x)^{-1})=0&\iff\sum_{k=0}^\infty\frac{h^{(k)}(g_m(x))}{k!}(f(x)^{-1}-g_m(x))^k=0\\
> > &\implies h(g_m(x))+h'(g_m(x))(f(x)^{-1}-g_m(x))\equiv0\pmod{x^{2m}}\\
> > &\iff f(x)^{-1}\equiv g_m(x)-\frac{h(g_m(x))}{h'(g_m(x))}\pmod{x^{2m}}\\
> > &\iff f(x)^{-1}\equiv g_m(x)(2-g_m(x)f(x))\pmod{x^{2m}}
> > \end{align}
> > $$

For $m=2^0,2^1,\dots,2^{\lceil\log_2n\rceil-1}$, find $g_{2m}(x)$ in the following way:

0. Let $P(x)=f(x)\bmod x^{2m},N=4m$. Apply the [[Fast Fourier Transform]] to find $g_m(\omega_N^0),g_m(\omega_N^1),\dots,g_m(\omega_N^{N-1})$ and $P(\omega_N^0),P(\omega_N^1),\dots,P(\omega_N^{N-1})$.
1. Use the results from 0 to find $g_m(\omega_N^0)(2-g_m(\omega_N^0)P(\omega_N^0)),g_m(\omega_N^1)(2-g_m(\omega_N^1)P(\omega_N^1)),\dots,g_m(\omega_N^{N-1})(2-g_m(\omega_N^{N-1})P(\omega_N^{N-1}))$.
2. Apply the [[Inverse Fast Fourier Transform]] to find $g_m(x)(2-g_m(x)P(x))$.
3. Apply the lemma to find $g_{2m}(x)$.

This algorithm solves the problem in $\mathcal{O}(n\log n)$ time and $\mathcal{O}(n)$ space.

```c++
std::vector<std::complex<double>> newton_inv(const std::vector<std::complex<double>> &a, int n) {
	std::vector x = {1. / a[0]};
	for (int m = 1; m < n; m *= 2) {
		std::vector y(a.begin(), a.begin() + std::min(2 * m, int(a.size())));
		x.resize(4 * m, 0), y.resize(4 * m, 0);
		fft(4 * m, x), fft(4 * m, y);
		for (int i = 0; i < 4 * m; i++) {
			x[i] *= 1. * 2 - x[i] * y[i];
		}
		ifft(4 * m, x);
		x.resize(2 * m);
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
