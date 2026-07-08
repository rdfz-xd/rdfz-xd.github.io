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

[[Du's First Division Sieve]] is an algorithm that computes $S_f(\lfloor\frac{n}{1}\rfloor),S_f(\lfloor\frac{n}{2}\rfloor),\dots,S_f(\lfloor\frac{n}{n}\rfloor)$ for arithmetic functions $f$ and $g$ ($g(1)\ne0$), if $S_g(\lfloor\frac{n}{1}\rfloor),S_g(\lfloor\frac{n}{2}\rfloor),\dots,S_g(\lfloor\frac{n}{n}\rfloor)$ and $S_{f*g}(\lfloor\frac{n}{1}\rfloor),S_{f*g}(\lfloor\frac{n}{2}\rfloor),\dots,S_{f*g}(\lfloor\frac{n}{n}\rfloor)$ are given, in $\mathcal{O}(n^\frac{3}{4})$ time and $\mathcal{O}(\sqrt n)$ space.

### Algorithm

> [!info] Lemma
> $$
> \forall n\in\Z_+,S_f(n)=\frac{S_{f*g}(n)-\sum_{d=2}^ng(d)S_f(\lfloor\frac{n}{d}\rfloor)}{g(1)}
> $$
>
> > [!note]- Proof
> > $$
> > \begin{align}
> > S_{f*g}(n)&=\sum_{k=1}^n(f*g)(k)\\
> > &=\sum_{k=1}^n\sum_{d\mid k}f\left(\frac{k}{d}\right)g(d)\\
> > &=\sum_{d=1}^ng(d)\sum_{k=1}^{\lfloor\frac{n}{d}\rfloor}f(k)\\
> > &=\sum_{d=1}^ng(d)S_f\left(\left\lfloor\frac{n}{d}\right\rfloor\right)\\
> > &=g(1)S_f(n)+\sum_{d=2}^ng(d)S_f\left(\left\lfloor\frac{n}{d}\right\rfloor\right)
> > \end{align}
> > $$
> >
> > $$
> > S_{f*g}(n)=g(1)S_f(n)+\sum_{d=2}^ng(d)S_f\left(\left\lfloor\frac{n}{d}\right\rfloor\right)\iff S_f(n)=\frac{S_{f*g}(n)-\sum_{d=2}^ng(d)S_f(\lfloor\frac{n}{d}\rfloor)}{g(1)}
> > $$

Applying the lemma to find $S_f$ yields an algorithm that solves in the problem in $\mathcal{O}(n^\frac{3}{4})$ time and $\mathcal{O}(\sqrt n)$ space.

~~~c++
std::unordered_map<int, int> du(int n, const std::unordered_map<int, int> &sg, const std::unordered_map<int, int> &sh) {
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

	std::unordered_map<int, int> sf;
	for (int i : d) {
		sf[i] = sh.at(i);
		for (int j = 2; j <= i; j = i / (i / j) + 1) {
			sf[i] -= (sg.at(i / (i / j)) - sg.at(j - 1)) * sf[i / j];
		}
		sf[i] /= sg.at(1);
	}
	return sf;
}
~~~

> [!note]- Proof
>
> Applying the lemma yields that the time complexity of the algorithm is
> $$
> \mathcal{O}\left(\sum_{k\in\{\lfloor\frac{n}{1}\rfloor,\lfloor\frac{n}{2}\rfloor,\dots,\lfloor\frac{n}{n}\rfloor\}}\sqrt k\right)
> $$
>
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

