---
tags: [Computer Science]
---

The [[Fast Fourier Transform]] is an algorithm that computes $f(\omega_n^0),f(\omega_n^1),\dots,f(\omega_n^{n-1})$ for a polynomial $f(x)=\sum_{i=0}^{n-1}a_ix^i$, if $\exist k\in\N,n=2^k$, in $\mathcal{O}(n\log n)$ time and $\mathcal{O}(1)$ space.

### Algorithm 0

> [!info] Lemma
>
> Let
> $$
> f_0(x)=\sum_{i=0}^{\frac{n}{2}-1}a_{2i}x^i,f_1(x)=\sum_{i=0}^{\frac{n}{2}-1}a_{2i+1}x^i
> $$
> then
> $$
> \forall k\in\left\{0,1,\dots,\frac{n}{2}-1\right\},f(\omega_n^k)=f_0(\omega_\frac{n}{2}^k)+\omega_n^kf_1(\omega_\frac{n}{2}^k)
> $$
>
> $$
> \forall k\in\left\{0,1,\dots,\frac{n}{2}-1\right\},f(\omega_n^{\frac{n}{2}+k})=f_0(\omega_\frac{n}{2}^k)-\omega_n^kf_1(\omega_\frac{n}{2}^k)
> $$
>
> > [!note]- Proof
> >
> > Since
> > $$
> > f(x)=f_0(x^2)+xf_1(x^2)
> > $$
> > it follows that
> > $$
> > \begin{align}
> > f(\omega_n^k)&=f_0(\omega_n^{2k})+\omega_n^kf_1(\omega_n^{2k})\\
> > &=f_0(\omega_\frac{n}{2}^k)+\omega_n^kf_1(\omega_\frac{n}{2}^k)
> > \end{align}
> > $$
> >
> > $$
> > \begin{align}
> > f(\omega_n^{\frac{n}{2}+k})&=f_0(\omega_n^{n+2k})+\omega_n^{\frac{n}{2}+k}f_1(\omega_n^{n+2k})\\
> > &=f_0(\omega_\frac{n}{2}^k)-\omega_n^kf_1(\omega_\frac{n}{2}^k)
> > \end{align}
> > $$

0. Find $f_0(\omega_\frac{n}{2}^0),f_0(\omega_\frac{n}{2}^1),\dots,f_0(\omega_\frac{n}{2}^{\frac{n}{2}-1})$ and $f_1(\omega_\frac{n}{2}^0),f_1(\omega_\frac{n}{2}^1),\dots,f_1(\omega_\frac{n}{2}^{\frac{n}{2}-1})$ recursively.
1. Apply the lemma to find $f(\omega_n^0),f(\omega_n^1),\dots,f(\omega_n^{n-1})$.

This algorithm solves the problem in $\mathcal{O}(n\log n)$ time and $\mathcal{O}(n)$ space.

```c++
void fft(int n, std::vector<std::complex<double>> &a) {
	std::vector<std::complex<double>> tmp(n);
	y_combinator([&](auto &&self, std::vector<std::complex<double>>::iterator l, std::vector<std::complex<double>>::iterator r) -> void {
		if (l + 1 == r) {
			return;
		}

		std::copy(l, r, tmp.begin());

		auto mid = l + (r - l) / 2;
		for (int i = 0; i < (r - l) / 2; i++) {
			l[i] = tmp[2 * i];
			mid[i] = tmp[2 * i + 1];
		}
		self(l, mid), self(mid, r);
		for (int i = 0; i < (r - l) / 2; i++) {
			auto u = l[i], v = std::complex{std::cos(2 * std::numbers::pi / (r - l) * i), std::sin(2 * std::numbers::pi / (r - l) * i)} * mid[i];
			l[i] = u + v;
			mid[i] = u - v;
		}
	})(a.begin(), a.end());
}
```

### Algorithm 1

Based on [[Fast Fourier Transform#Algorithm 0]], converting the recursion into a bottom-up iterative approach yields an algorithm that solves the problem in $\mathcal{O}(n\log n)$ time and $\mathcal{O}(1)$ space.

```c++
void fft(int n, std::vector<std::complex<double>> &a) {
	for (int i = 0, j = 0; i < n; i++, j ^= n - 1, j ^= std::bit_floor<u32>(j) - 1) {
		if (i < j) {
			std::swap(a[i], a[j]);
		}
	}
	for (int k = 1; k < n; k *= 2) {
		for (int i = 0; i < n; i += 2 * k) {
			for (int j = 0; j < k; j++) {
				auto u = a[i + j], v = std::complex{std::cos(std::numbers::pi / k * j), std::sin(std::numbers::pi / k * j)} * a[i + j + k];
				a[i + j] = u + v;
				a[i + j + k] = u - v;
			}
		}
	}
}
```
