---
tags: [Computer Science]
---

> [!info] Lemma
> $$
> \forall n\in\Z_+,\left|\left\{\left\lfloor\frac{n}{1}\right\rfloor,\left\lfloor\frac{n}{2}\right\rfloor,\dots,\left\lfloor\frac{n}{n}\right\rfloor\right\}\right|\in\mathcal{O}(\sqrt n)
> $$
>
> > [!note]- Proof
> > $$
> > \begin{align}
> > \left|\left\{\left\lfloor\frac{n}{1}\right\rfloor,\left\lfloor\frac{n}{2}\right\rfloor,\dots,\left\lfloor\frac{n}{n}\right\rfloor\right\}\right|&\le\left|\left\{\left\lfloor\frac{n}{d}\right\rfloor:d\in\{1,2,\dots,\lfloor\sqrt n\rfloor\}\right\}\right|+\left|\left\{\left\lfloor\frac{n}{1}\right\rfloor,\left\lfloor\frac{n}{2}\right\rfloor,\dots,\left\lfloor\frac{n}{n}\right\rfloor\right\}\cap\{1,2,\dots,\lfloor\sqrt n\rfloor\}\right|\\
> > &\le2\sqrt n\\
> > &\in\mathcal{O}(\sqrt n)
> > \end{align}
> > $$

Let $S_f(n)=\sum_{k=1}^nf(k)$.

[[Du's First Multiplication Sieve]] is an algorithm that computes $S_{f*g}(\lfloor\frac{n}{1}\rfloor),S_{f*g}(\lfloor\frac{n}{2}\rfloor),\dots,S_{f*g}(\lfloor\frac{n}{n}\rfloor)$ for arithmetic functions $f$ and $g$, if $S_f(\lfloor\frac{n}{1}\rfloor),S_f(\lfloor\frac{n}{2}\rfloor),\dots,S_f(\lfloor\frac{n}{n}\rfloor)$ and $S_g(\lfloor\frac{n}{1}\rfloor),S_g(\lfloor\frac{n}{2}\rfloor),\dots,S_g(\lfloor\frac{n}{n}\rfloor)$ are given, in $\mathcal{O}(n^\frac{3}{4})$ time and $\mathcal{O}(\sqrt n)$ space.

### Algorithm

> [!info] Lemma
> $$
> \forall n\in\Z_+,S_{f*g}(n)=\sum_{d=1}^ng(d)S_f\left(\left\lfloor\frac{n}{d}\right\rfloor\right)
> $$
>
> > [!note]- Proof
> > $$
> > \begin{align}
> > S_{f*g}(n)&=\sum_{k=1}^n(f*g)(k)\\
> > &=\sum_{k=1}^n\sum_{d\mid k}f\left(\frac{k}{d}\right)g(d)\\
> > &=\sum_{d=1}^ng(d)\sum_{k=1}^{\lfloor\frac{n}{d}\rfloor}f(k)\\
> > &=\sum_{d=1}^ng(d)S_f\left(\left\lfloor\frac{n}{d}\right\rfloor\right)
> > \end{align}
> > $$
> > 

Applying the lemma to find $S_{f*g}$ yields an algorithm that solves the problem in $\mathcal{O}(n^\frac{3}{4})$ time and $\mathcal{O}(\sqrt n)$ space.

~~~c++
std::unordered_map<int, int> du(int n, const std::unordered_map<int, int> &sf, const std::unordered_map<int, int> &sg) {
	int m = std::sqrt(n);

	std::vector<int> d;
	for (int i = 1; i < m; i++) {
		if (n / (n / i) == i) {
			d.push_back(i);
		}
	}
	for (int i = n / m; i > 0; i--) {
		d.push_back(n / i);
	}
	d.erase(std::unique(d.begin(), d.end()), d.end());

	std::unordered_map<int, int> sh;
	for (int i : d) {
		for (int j = 1; j <= i; j = i / (i / j) + 1) {
			sh[i] += (sg.at(i / (i / j)) - (j > 1 ? sg.at(j - 1) : 0)) * sf.at(i / j);
		}
	}
	return sh;
}
~~~

> [!note]- Proof
>
> Applying the lemma yields that this algorithm solves the problem in
> $$
> \mathcal{O}\left(\sum_{k\in\{\lfloor\frac{n}{1}\rfloor,\lfloor\frac{n}{2}\rfloor,\dots,\lfloor\frac{n}{n}\rfloor\}}\sqrt k\right)
> $$
>
> time.
> $$
> \mathcal{O}\left(\sum_{k\in\{\lfloor\frac{n}{1}\rfloor,\lfloor\frac{n}{2}\rfloor,\dots,\lfloor\frac{n}{n}\rfloor\}}\sqrt k\right)\subseteq\mathcal{O}\left(\sum_{k=1}^{\lfloor\sqrt n\rfloor}\sqrt k+\sum_{k=1}^{\lfloor\sqrt n\rfloor}\sqrt{\frac{n}{k}}\right)
> $$
>
> Since
> $$
> \begin{align}
> \mathcal{O}\left(\sum_{k=1}^{\lfloor\sqrt n\rfloor}\sqrt k\right)&\subseteq\mathcal{O}\left(\sum_{k=1}^{\lfloor\sqrt n\rfloor}n^{\frac{1}{4}}\right)\\
> &=\mathcal{O}(n^\frac{3}{4})
> \end{align}
> $$
> and
> $$
> \begin{align}
> \mathcal{O}\left(\sum_{k=1}^{\lfloor\sqrt n\rfloor}\sqrt{\frac{n}{k}}\right)&=\mathcal{O}\left(\sqrt{n}\sum_{k=1}^{\lfloor\sqrt n\rfloor}k^{-\frac{1}{2}}\right)\\
> &=\mathcal{O}\left(\sqrt{n}\int_0^{\sqrt{n}}x^{-\frac{1}{2}}\mathrm{d}x\right)\\
> &=\mathcal{O}(n^\frac{3}{4})
> \end{align}
> $$
> it follows that
> $$
> \mathcal{O}\left(\sum_{k\in\{\lfloor\frac{n}{1}\rfloor,\lfloor\frac{n}{2}\rfloor,\dots,\lfloor\frac{n}{n}\rfloor\}}\sqrt k\right)\subseteq\mathcal{O}(n^\frac{3}{4})
> $$
> Therefore,
> $$
> T(n)\in\mathcal{O}(n^\frac{3}{4})
> $$

