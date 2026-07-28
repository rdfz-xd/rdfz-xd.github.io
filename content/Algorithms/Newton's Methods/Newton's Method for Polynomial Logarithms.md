---
tags: [Computer Science]
---

[[Newton's Method for Polynomial Logarithms]] is an algorithm that computes $\log_ef(x)\bmod x^n$ for a formal power series $f(x)$ such that $f(0)=1$ in $\mathcal{O}(n\log n)$ time and $\mathcal{O}(n)$ space.

### Algorithm

> [!info] Lemma
> $$
> \log_ef(x)=\int\frac{f'(x)}{f(x)}\mathrm{d}x
> $$
>
> > [!note]- Proof
> > $$
> > \begin{align}
> > \log_ef(x)&=\int\mathrm{d}(\log_ef(x))\\
> > &=\int\frac{f'(x)}{f(x)}\mathrm{d}x
> > \end{align}
> > $$

0. Let $P(x)=f'(x)\bmod x^{n-1},Q(x)=f(x)^{-1}\bmod x^{n-1}$. Apply [[Newton's Method for Polynomial Inversion]] to find $Q(x)$.
1. Let $N=2^{\lceil\log_2(2n-3)\rceil}$. Apply the [[Fast Fourier Transform]] to find $P(\omega_N^0),P(\omega_N^1),\dots,P(\omega_N^{N-1})$ and $Q(\omega_N^0),Q(\omega_N^1),\dots,Q(\omega_N^{N-1})$.
2. Use the results from 1 to find $P(\omega_N^0)Q(\omega_N^0),P(\omega_N^1)Q(\omega_N^1),\dots,P(\omega_N^{N-1})Q(\omega_N^{N-1})$.
3. Apply the [[Inverse Fast Fourier Transform]] to find $P(x)Q(x)$.
4. Apply the lemma to find $\log_ef(x)\bmod x^n$.

This algorithm solves the problem in $\mathcal{O}(n\log n)$ time and $\mathcal{O}(n)$ space.

```c++
std::vector<std::complex<double>> newton_log(const std::vector<std::complex<double>> &a, int n) {
	if (n == 1) {
		return {0};
	}

	std::vector x(n - 1, std::complex(0.));
	for (int i = 1; i < std::min(n, int(a.size())); i++) {
		x[i - 1] = 1. * i * a[i];
	}

	auto y = newton_inv(a, n - 1);

	int m = std::bit_ceil<u32>(2 * n - 3);
	x.resize(m, 0), y.resize(m, 0);
	fft(m, x), fft(m, y);
	for (int i = 0; i < m; i++) {
		x[i] *= y[i];
	}
	ifft(m, x);
	x.resize(n - 1);

	x.insert(x.begin(), 0);
	for (int i = 1; i < n; i++) {
		x[i] /= i;
	}
	return x;
}
```
