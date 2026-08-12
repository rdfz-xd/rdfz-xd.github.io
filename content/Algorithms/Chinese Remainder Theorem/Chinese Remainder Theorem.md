---
tags: [Computer Science]
---

The [[Chinese Remainder Theorem]] is an algorithm that finds an integer $x$ such that
$$
\forall i\in\{0,1,\dots,n-1\},x\equiv a_i\pmod{m_i}
$$
for integers $a_0,a_1,\dots,a_{n-1}$ and positive integers $m_0,m_1,\dots,m_{n-1}$ such that $m_0,m_1,\dots,m_{n-1}$ are **pairwise coprime** in $\mathcal{O}(\sum_{i=0}^{n-1}\log m_i)$ time and $\mathcal{O}(\sum_{i=0}^{n-1}\log m_i)$ space.

> [!tip]
>
> This problem can also be solved by the [[Extended Chinese Remainder Theorem]] in $\mathcal{O}(\sum_{i=0}^{n-1}\log m_i)$ time and $\mathcal{O}(\sum_{i=0}^{n-1}\log m_i)$ space.

### Algorithm

> [!info] Lemma
>
> Let $M=\prod_{i=0}^{n-1}m_i$, then
> $$
> x=\sum_{i=0}^{n-1}\frac{M}{m_i}\left(\left(\frac{M}{m_i}\right)^{-1}\bmod m_i\right)a_i
> $$
> is an integer such that $\forall i\in\{0,1,\dots,n-1\},x\equiv a_i\pmod{m_i}$.
>
> > [!note]- Proof
> > $$
> > \begin{align}
> > x&=\sum_{j=0}^{n-1}\frac{M}{m_j}\left(\left(\frac{M}{m_j}\right)^{-1}\bmod m_j\right)a_j\\
> > &\equiv\frac{M}{m_i}\left(\left(\frac{M}{m_i}\right)^{-1}\bmod m_i\right)a_i\pmod{m_i}\\
> > &\equiv a_i\pmod{m_i}
> > \end{align}
> > $$

0. For each $i$ in $\{0,1,\dots,n-1\}$, apply the [[Extended Euclidean Algorithm]] to find a pair of integers $u$ and $v$ such that $\frac{M}{m_i}u+m_iv=1$, then $\left(\frac{M}{m_i}\right)^{-1}\equiv u\pmod{m_i}$.
1. Apply the lemma to find $x$.

This algorithm solves the problem in $\mathcal{O}(\sum_{i=0}^{n-1}\log m_i)$ time and $\mathcal{O}(\sum_{i=0}^{n-1}\log m_i)$ space.

```c++
int crt(int n, const std::vector<int> &a, const std::vector<int> &m) {
	int M = std::accumulate(m.begin(), m.end(), 1, std::multiplies()), x = 0;
	for (int i = 0; i < n; i++) {
		x += M / m[i] * exgcd(M / m[i], m[i]).first * a[i];
	}
	return x;
}
```

