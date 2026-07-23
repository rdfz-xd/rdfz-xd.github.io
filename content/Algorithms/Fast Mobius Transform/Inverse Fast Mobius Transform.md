---
tags: [Computer Science]
---

The [[Inverse Fast Mobius Transform]] is an algorithm that finds a function $g$ such that $\forall S\subseteq\{0,1,\dots,n-1\},\sum_{T\subseteq S}g(T)=f(S)$ in $\mathcal{O}(n2^n)$ time and $\mathcal{O}(1)$ space.

### Algorithm

> [!info] Lemma
> $$
> g(S)=\sum_{T\subseteq S}(-1)^{|S|-|T|}f(T)
> $$
> is a function such that $\forall S\subseteq\{0,1,\dots,n-1\},\sum_{T\subseteq S}g(T)=f(S)$.
>
> > [!note]- Proof
> > $$
> > \begin{align}
> > \sum_{T\subseteq S}g(T)&=\sum_{T\subseteq S}\sum_{Q\subseteq T}(-1)^{|T|-|Q|}f(Q)\\
> > &=\sum_{Q\subseteq S}f(Q)\sum_{Q\subseteq T\subseteq S}(-1)^{|T|-|Q|}\\
> > &=\sum_{Q\subseteq S}f(Q)\sum_{T\subseteq S\setminus Q}(-1)^{|T|}\\
> > &=\sum_{Q\subseteq S}f(Q)\sum_{k=0}^{|S\setminus Q|}\binom{|S\setminus Q|}{k}(-1)^k\\
> > &=\sum_{Q\subseteq S}[|S\setminus Q|=0]f(Q)\\
> > &=f(S)
> > \end{align}
> > $$

0. Apply the [[Fast Mobius Transform]] to find $\sum_{T\subseteq S}(-1)^{|T|}f(T)$ for each subset $S$ of $\{0,1,\dots,n-1\}$.
1. Apply the lemma to find $g$.

This algorithm solves the problem in $\mathcal{O}(n2^n)$ time and $\mathcal{O}(1)$ space.

```c++
void ifmt(int n, std::vector<int> &a) {
	for (u32 s = 0u; s < 1u << n; s++) {
		if (std::popcount(s) % 2 == 1) {
			a[s] *= -1;
		}
	}
	fmt(n, a);
	for (u32 s = 0u; s < 1u << n; s++) {
		if (std::popcount(s) % 2 == 1) {
			a[s] *= -1;
		}
	}
}
```

