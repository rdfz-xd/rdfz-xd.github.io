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

[[Du's Second Multiplication Sieve]] is an algorithm that computes $S_{f*g}(1),S_{f*g}(2),\dots,S_{f*g}(\lfloor n^\frac{2}{3}\rfloor-1)$ and $S_{f*g}(\lfloor\frac{n}{1}\rfloor),S_{f*g}(\lfloor\frac{n}{2}\rfloor),\dots,S_{f*g}(\lfloor\frac{n}{n}\rfloor)$ for **multiplicative** functions $f$ and $g$, if $S_f(1),S_f(2),\dots,S_f(\lfloor n^\frac{2}{3}\rfloor-1)$, $S_f(\lfloor\frac{n}{1}\rfloor),S_f(\lfloor\frac{n}{2}\rfloor),\dots,S_f(\lfloor\frac{n}{n}\rfloor)$, $S_g(1),S_g(2),\dots,S_g(\lfloor n^\frac{2}{3}\rfloor-1)$, and $S_g(\lfloor\frac{n}{1}\rfloor),S_g(\lfloor\frac{n}{2}\rfloor),\dots,S_g(\lfloor\frac{n}{n}\rfloor)$ are given, in $\mathcal{O}(n^\frac{2}{3})$ time and $\mathcal{O}(n^\frac{2}{3})$ space.

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

1. For each $k$ in $\{k:k\in\{1,2,\dots,\lfloor n^\frac{2}{3}\rfloor-1\}\land\exist p\in \mathbb{P},\exist e\in\N,k=p^e\}$, find $(f*g)(k)$.

2. Use the results from Step 1 to find $(f*g)(1),(f*g)(2),\dots,(f*g)(\lfloor n^\frac{2}{3}\rfloor-1)$.
3. Use the results from Step 2 to find $S_{f*g}(1),S_{f*g}(2),\dots,S_{f*g}(\lfloor n^\frac{2}{3}\rfloor-1)$.
4. For each $k$ in $\{\lfloor\frac{n}{1}\rfloor,\lfloor\frac{n}{2}\rfloor,\dots,\lfloor\frac{n}{n}\rfloor\}\setminus\{1,2,\dots,\lfloor n^\frac{2}{3}\rfloor-1\}$, apply the lemma to find $S_{f*g}(k)$.

This algorithm solves the problem in $\mathcal{O}(n^\frac{2}{3})$ time and $\mathcal{O}(n^\frac{2}{3})$ space.

~~~c++
std::unordered_map<int, int> du(int n, const std::unordered_map<int, int> &sf, const std::unordered_map<int, int> &sg) {
	int m = std::pow(n, .67);

	std::vector<int> h(m);
	h[1] = 1;
	for (int i = 2; i < m; i++) {
		if (pk[i] == i) {
			h[i] = 0;
			for (int j = i; j; j /= pf[i]) {
				h[i] += (sf.at(j) - (j > 1 ? sf.at(j - 1) : 0)) * (sg.at(i / j) - (i > j ? sg.at(i / j - 1) : 0));
			}
		} else {
			h[i] = h[i / pk[i]] * h[pk[i]];
		}
	}

	std::unordered_map<int, int> sh;
	sh[1] = h[1];
	for (int i = 2; i < m; i++) {
		sh[i] = sh[i - 1] + h[i];
	}
	for (int i = n / m; i > 0; i--) {
		sh[n / i] = 0;
		for (int j = 1; j <= n / i; j = n / i / (n / i / j) + 1) {
			sh[n / i] += (sg.at(n / i / (n / i / j)) - (j > 1 ? sg.at(j - 1) : 0)) * sf.at(n / i / j);
		}
	}
	return sh;
}
~~~

> [!note]- Proof
>
> Applying the lemma yields
> $$
> T(n)\in\mathcal{O}\left(n^\frac{2}{3}+\sum_{d=1}^{\lfloor n^\frac{1}{3}\rfloor}\sqrt{\frac{n}{d}}\right)
> $$
> Since
> $$
> \begin{align}
> \mathcal{O}\left(\sum_{d=1}^{\lfloor n^\frac{1}{3}\rfloor}\sqrt{\frac{n}{d}}\right)&=\mathcal{O}\left(\sqrt{n}\sum_{d=1}^{\lfloor n^\frac{1}{3}\rfloor}d^{-\frac{1}{2}}\right)\\
> &=\mathcal{O}\left(\sqrt n\int_0^{n^\frac{1}{3}}x^{-\frac{1}{2}}\mathrm{d}x\right)\\
> &=\mathcal{O}(n^\frac{2}{3})
> \end{align}
> $$
> it follows that
> $$
> \mathcal{O}\left(n^\frac{2}{3}+\sum_{d=1}^{\lfloor n^\frac{1}{3}\rfloor}\sqrt{\frac{n}{d}}\right)=\mathcal{O}(n^\frac{2}{3})
> $$
> Therefore,
> $$
> T(n)\in\mathcal{O}(n^\frac{2}{3})
> $$
