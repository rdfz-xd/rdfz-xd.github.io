---
tags: [Computer Science]
---

The [[Fast Mobius Transform]] is an algorithm that computes $f(S)=\sum_{T\subseteq S}g(T)$ for a function $g$ defined on $\mathcal{P}(\{0,1,\dots,n-1\})$ in $\mathcal{O}(n2^n)$ time and $\mathcal{O}(1)$ space.

### Algorithm 0

> [!info] Lemma
>
> Let
> $$
> f_i(S)=\sum_{T\subseteq S\land S\setminus T\subseteq\{0,1,\dots,i-1\}}g(T)
> $$
> then
> $$
> \forall i\in\{0,1,\dots,n-1\},\forall S\subseteq\{0,1,\dots,n-1\},f_{i+1}(S)=\begin{cases}
> f_i(S)+f_i(S\setminus\{i\}),&i\in S\\
> f_i(S),&i\notin S
> \end{cases}
> $$

Applying the lemma to find $f_n$ yields an algorithm that solves the problem in $\mathcal{O}(n2^n)$ time and $\mathcal{O}(n2^n)$ space.

```c++
void fmt(int n, std::vector<int> &a) {
	std::vector f(n + 1, a);
	for (int i = 0; i < n; i++) {
		for (u32 s = 0u; s < 1u << n; s++) {
			f[i + 1][s] = f[i][s] + (s >> i & 1u ? f[i][s ^ 1u << i] : 0);
		}
	}
	std::swap(a, f[n]);
}
```

### Algorithm 1

Based on [[Fast Mobius Transform#Algorithm 0]], ignoring the first dimension yields an algorithm that solves the problem in $\mathcal{O}(n2^n)$ time and $\mathcal{O}(1)$ space.

```c++
void fmt(int n, std::vector<int> &a) {
	for (int i = 0; i < n; i++) {
		for (u32 s = 0u; s < 1u << n; s++) {
			if (s >> i & 1u) {
				a[s] += a[s ^ 1u << i];
			}
		}
	}
}
```
