---
tags: [Computer Science]
---

Let $S_f(n)=\sum_{k=1}^nf(k)$.

[[Du's Second Multiplication Sieve]] is an algorithm that computes $S_{f*g}(\lfloor\frac{n}{1}\rfloor),S_{f*g}(\lfloor\frac{n}{2}\rfloor),\dots,S_{f*g}(\lfloor\frac{n}{n}\rfloor)$ for **multiplicative** functions $f$ and $g$ in $\mathcal{O}(n^\frac{2}{3})$ time and $\mathcal{O}(n^\frac{2}{3})$ space, if $f(1),f(2),\dots,f(\lfloor n^\frac{2}{3}\rfloor)$, $S_f(\lfloor\frac{n}{1}\rfloor),S_f(\lfloor\frac{n}{2}\rfloor),\dots,S_f(\lfloor\frac{n}{n}\rfloor)$, $g(1),g(2),\dots,g(\lfloor n^\frac{2}{3}\rfloor)$, and $S_g(\lfloor\frac{n}{1}\rfloor),S_g(\lfloor\frac{n}{2}\rfloor),\dots,S_g(\lfloor\frac{n}{n}\rfloor)$ are given.

> [!tip] Hint
>
> This problem can also be solved by [[Du's First Multiplication Sieve]] in $\mathcal{O}(n^\frac{3}{4})$ time and $\mathcal{O}(\sqrt n)$ space.

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

1. For each $k$ in $\{k:k\in\{1,2,\dots,\lfloor n^\frac{2}{3}\rfloor\}\land\exist p\in \mathbb{P},\exist e\in\N,k=p^e\}$, find $(f*g)(k)$.

2. Find $(f*g)(1),(f*g)(2),\dots,(f*g)(\lfloor n^\frac{2}{3}\rfloor)$ using the results from Step 1.
3. Find $S_{f*g}(1),S_{f*g}(2),\dots,S_{f*g}(\lfloor n^\frac{2}{3}\rfloor)$ using the results from Step 2.
4. For each $k$ in $\{\lfloor\frac{n}{1}\rfloor,\lfloor\frac{n}{2}\rfloor,\dots,\lfloor\frac{n}{n}\rfloor\}\setminus\{1,2,\dots,\lfloor n^\frac{2}{3}\rfloor\}$, applying the lemma to find $S_{f*g}(k)$.

This algorithm solves the problem in $\mathcal{O}(n^\frac{2}{3})$ time and $\mathcal{O}(n^\frac{2}{3})$ space.

~~~c++
std::vector<int> h(n23 + 1);
h[1] = 1;
for (int i = 2; i <= n23; i++) {
	if (pk[i] == i) {
		h[i] = 0;
		for (int j = i; j; j /= pf[i]) {
			h[i] += f[j] * g[i / j];
		}
	} else {
		h[i] = f[i / pk[i]] * g[pk[i]];
	}
}

std::unordered_map<int, int> sh;
for (int i = 1; i <= n23; i++) {
	sh[i] = sh[i - 1] + h[i];
}
for (int i = n / n23; i > 0; i--) {
	sh[n / i] = 0;
	for (int j = 1; j <= n / i; j = n / i / (n / i / j) + 1) {
		sh[n / i] += (sg[n / i / (n / i / j)] - sg[j - 1]) * sf[n / i / j];
	}
}
return sh;
~~~

> [!note]- Proof
>
> > [!info] Lemma
> > $$
> > \forall n\in\Z_+,\left|\left\{\left\lfloor\frac{n}{1}\right\rfloor,\left\lfloor\frac{n}{2}\right\rfloor,\dots,\left\lfloor\frac{n}{n}\right\rfloor\right\}\right|\le2\sqrt n
> > $$
> >
> > > [!note]- Proof
> > > $$
> > > \begin{align}
> > > \left|\left\{\left\lfloor\frac{n}{1}\right\rfloor,\left\lfloor\frac{n}{2}\right\rfloor,\dots,\left\lfloor\frac{n}{n}\right\rfloor\right\}\right|&\le\left|\left\{\left\lfloor\frac{n}{d}\right\rfloor:d\in\{1,2,\dots,\lfloor\sqrt n\rfloor\}\right\}\right|+\left|\left\{\left\lfloor\frac{n}{1}\right\rfloor,\left\lfloor\frac{n}{2}\right\rfloor,\dots,\left\lfloor\frac{n}{n}\right\rfloor\right\}\cap\{1,2,\dots,\lfloor\sqrt n\rfloor\}\right|\\
> > > &\le2\sqrt n
> > > \end{align}
> > > $$
>
> Applying the lemma yields that
> $$
> T(n)\in\mathcal{O}\left(n^\frac{2}{3}+\sum_{d=1}^{\lfloor n^\frac{1}{3}\rfloor}\sqrt{\frac{n}{d}}\right)
> $$
> Therefore, since
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
