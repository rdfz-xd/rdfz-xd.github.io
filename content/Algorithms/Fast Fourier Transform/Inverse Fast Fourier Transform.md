---
tags: [Computer Science]
---

The [[Inverse Fast Fourier Transform]] is an algorithm that finds a polynomial $f(x)=\sum_{i=0}^{n-1}a_ix^i$ such that $\forall k\in\{0,1,\dots,n-1\},f(\omega_n^k)=b_k$, if $\exist k\in\N,n=2^k$, in $\mathcal{O}(n\log n)$ time and $\mathcal{O}(1)$ space.

### Algorithm

> [!info] Lemma
> $$
> \forall n\in\Z_+,\forall k\in\Z,[n\mid k]=\frac{1}{n}\sum_{i=0}^{n-1}\omega_n^{ki}
> $$
>
> > [!note]- Proof
> >
> > - If $n\mid k$,
> >   $$
> >   \begin{align}
> >   \frac{1}{n}\sum_{i=0}^{n-1}\omega_n^{ki}&=\frac{1}{n}\sum_{i=0}^{n-1}1\\
> >   &=1
> >   \end{align}
> >   $$
> >
> > - If $n\nmid k$,
> >   $$
> >   \begin{align}
> >   \frac{1}{n}\sum_{i=0}^{n-1}\omega_n^{ki}&=\frac{\omega_n^{kn}-1}{n(\omega_n^k-1)}\\
> >   &=0
> >   \end{align}
> >   $$

> [!info] Lemma
>
> Let
> $$
> g(x)=\sum_{i=0}^{n-1}b_ix^i
> $$
> then
> $$
> f(x)=\frac{1}{n}\sum_{i=0}^{n-1}g(\omega_n^{-i})x^i
> $$
> is a polynomial such that $\forall k\in\{0,1,\dots,n-1\},f(\omega_n^k)=b_k$.
>
> > [!note]- Proof
> > $$
> > \begin{align}
> > f(\omega_n^k)&=\frac{1}{n}\sum_{i=0}^{n-1}g(\omega_n^{-i})\omega_n^{ki}\\
> > &=\frac{1}{n}\sum_{i=0}^{n-1}\omega_n^{ki}\sum_{j=0}^{n-1}b_j\omega_n^{-ij}\\
> > &=\frac{1}{n}\sum_{j=0}^{n-1}b_j\sum_{i=0}^{n-1}\omega_n^{i(k-j)}\\
> > &=\sum_{j=0}^{n-1}[n\mid k-j]b_j\\
> > &=b_k
> > \end{align}
> > $$

0. Apply the [[Fast Fourier Transform]] to find $g(\omega_n^0),g(\omega_n^1),\dots,g(\omega_n^{n-1})$.
1. Apply the lemma to find $f$.

This algorithm solves the problem in $\mathcal{O}(n\log n)$ time and $\mathcal{O}(1)$ space.

```c++
void ifft(int n, std::vector<std::complex<double>> &a) {
	fft(n, a);
	std::ranges::reverse(a | std::views::drop(1));
	for (int i = 0; i < n; i++) {
		a[i] /= n;
	}
}
```

