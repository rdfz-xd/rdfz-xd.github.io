---
tags: [Computer Science]
---

The [[Extended Chinese Remainder Theorem]] is an algorithm that checks if there exists an integer $x$ such that
$$
x\equiv a_0\pmod{m_0}\land x\equiv a_1\pmod{m_1}
$$
and finds such an $x$ if there exists for integers $a_0,a_1$ and postive integers $m_0,m_1$ in $\mathcal{O}(\log m_0+\log m_1)$ time and $\mathcal{O}(\log m_0+\log m_1)$ space.

### Algorithm

> [!info] Lemma
> $$
> \exists x\in\Z,x\equiv a_0\pmod{m_0}\land x\equiv a_1\pmod{m_1}\iff\gcd\{m_0,m_1\}\mid a_1-a_0
> $$
>
> > [!note]- Proof
> > $$
> > \begin{align}
> > \exists x\in\Z,x\equiv a_0\pmod{m_0}\land x\equiv a_1\pmod{m_1}&\iff\exists p,q\in\Z,m_0p+a_0=m_1q+a_1\\
> > &\iff\exists p,q\in\Z,m_0p-m_1q=a_1-a_0
> > \end{align}
> > $$
> > Applying **Bézout's Identity** yields
> > $$
> > \exists p,q\in\Z,m_0p-m_1q=a_1-a_0\iff\gcd\{m_0,m_1\}\mid a_1-a_0
> > $$

0. Apply the [[Euclidean Algorithm]] to find $\gcd\{m_0,m_1\}$.
1. - If $\gcd\{m_0,m_1\}\nmid a_1-a_0$, applying the lemma yields that no solution exists.
   - Otherwise, apply the [[Extended Euclidean Algorithm]] to find a pair of integers $p$ and $q$ such that $m_0p+a_0=m_1q+a_1$, then $x=m_0p+a_0=m_1q+a_1$ is an integer such that $x\equiv a_0\pmod{m_0}\land x\equiv a_1\pmod{m_1}$.

This algorithm solves the problem in $\mathcal{O}(\log m_0+\log m_1)$ time and $\mathcal{O}(\log m_0+\log m_1)$ space.

```c++
std::optional<int> excrt(const std::array<int, 2> &a, const std::array<int, 2> &m) {
	int gcd = std::gcd(m[0], m[1]);
	if ((a[1] - a[0]) % gcd != 0) {
		return std::nullopt;
	}

	return m[0] * (a[1] - a[0]) / gcd * exgcd(m[0], m[1]).first + a[0];
}
```

