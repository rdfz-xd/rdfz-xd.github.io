---
tags: [Computer Science]
---

[[Bluestein's Algorithm]] is an algorithm that computes $f(z^0),f(z^1),\dots,f(z^{m-1})$ for a polynomial $f(x)=\sum_{i=0}^{n-1}a_ix^i$ in $\mathcal{O}((n+m)\log(n+m))$ time and $\mathcal{O}(n+m)$ space.

### Algorithm

> [!info] Lemma
>
> Let
> $$
> P(x)=\sum_{i=0}^{n-1}z^{-\frac{i^2}{2}}a_ix^{n-i-1},Q(x)=\sum_{i=0}^{n+m-1}z^\frac{i^2}{2}x^i
> $$
> then
> $$
> \forall i\in\{0,1,\dots,m-1\},f(z^i)=z^{-\frac{i^2}{2}}[x^{n-1+i}](P(x)Q(x))
> $$
>
> > [!note]- Proof
> > $$
> > \begin{align}
> > z^{-\frac{i^2}{2}}[x^{n-1+i}](P(x)Q(x))&=z^{-\frac{i^2}{2}}\sum_{j=0}^{n-1}[x^{n-j-1}]P(x)[x^{i+j}]Q(x)\\
> > &=\sum_{j=0}^{n-1}a_jz^{\frac{(i+j)^2}{2}-\frac{i^2}{2}-\frac{j^2}{2}}\\
> > &=\sum_{j=0}^{n-1}a_jz^{ij}\\
> > &=f(z^i)
> > \end{align}
> > $$

0. Let $N=2^{\lceil\log_2(2n+m-1)\rceil}$. Apply the [[Fast Fourier Transform]] to find $P(\omega_N^0),P(\omega_N^1),\dots,P(\omega_N^{N-1})$ and $Q(\omega_N^0),Q(\omega_N^1),\dots,Q(\omega_N^{N-1})$.
1. Use the results from 0 to find $P(\omega_N^0)Q(\omega_N^0),P(\omega_N^1)Q(\omega_N^1),\dots,P(\omega_N^{N-1})Q(\omega_N^{N-1})$.
2. Apply the [[Inverse Fast Fourier Transform]] to find $P(x)Q(x)$.
3. For each $i$ in $\{0,1,\dots,m-1\}$, apply the lemma to find $f(z^i)$.

This algorithm solves the problem in $\mathcal{O}((n+m)\log(n+m))$ time and $\mathcal{O}(n+m)$ space.

```c++
std::vector<std::complex<double>> bluestein(int n, const std::vector<std::complex<double>> &a, std::complex<double> z, int m) {
	int k = std::bit_ceil<u32>(2 * n + m - 1);

	std::vector f(k, std::complex(0.));
	for (int i = 0; i < n; i++) {
		f[n - i - 1] = a[i] / std::pow(z, 1. * i * i / 2);
	}
	std::vector g(k, std::complex(0.));
	for (int i = 0; i < n + m; i++) {
		g[i] = std::pow(z, 1. * i * i / 2);
	}

	fft(k, f), fft(k, g);
	for (int i = 0; i < k; i++) {
		f[i] *= g[i];
	}
	ifft(k, f);

	std::vector<std::complex<double>> res(m);
	for (int i = 0; i < m; i++) {
		res[i] = f[n - 1 + i] / std::pow(z, 1. * i * i / 2);
	}
	return res;
}
```
