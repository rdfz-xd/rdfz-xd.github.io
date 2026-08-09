---
tags: [Computer Science]
---

The [[Fast Cantor Expansion]] is an algorithm that finds the lexicographical rank of a permutation $p_0,p_1,\dots,p_{n-1}$ of $\{0,1,\dots,n-1\}$ among all permutations of $\{0,1,\dots,n-1\}$ in $\mathcal{O}(n\log n)$ time and $\mathcal{O}(n)$ space.

### Algorithm 0

> [!info] Lemma
>
> For any permutation $p_0,p_1,\dots,p_{n-1}$ of $\{0,1,\dots,n-1\}$, the lexicographical rank of $p_0,p_1,\dots,p_{n-1}$ among all permutations of $\{0,1,\dots,n-1\}$ is
> $$
> \sum_{i=0}^{n-1}(n-i-1)!\sum_{j=i+1}^{n-1}[p_j<p_i]
> $$

Applying the lemma to find the lexicographical rank of $p_0,p_1,\dots,p_{n-1}$ yields an algorithm that solves the problem in $\mathcal{O}(n^2)$ time and $\mathcal{O}(n)$ space.

```c++
int fce(int n, const std::vector<int> &p) {
	std::vector fac(n, 1);
	for (int i = 1; i < n; i++) {
		fac[i] = i * fac[i - 1];
	}

	std::vector vis(n, false);
	int rank = 0;

	for (int i = n - 1; i >= 0; i--) {
		rank += std::ranges::count(vis | std::views::take(p[i]), true) * fac[n - i - 1];
		vis[p[i]] = true;
	}

	return rank;
}
```

### Algorithm 1

Based on [[Fast Cantor Expansion#Algorithm 0]], using a [[Fenwick Tree]] to maintain `vis` yields an algorithm that solves the problem in $\mathcal{O}(n\log n)$ time and $\mathcal{O}(n)$ space.

```c++
int fce(int n, const std::vector<int> &p) {
	std::vector fac(n, 1);
	for (int i = 1; i < n; i++) {
		fac[i] = i * fac[i - 1];
	}

	FenwickTree<int> fen(n);
	int rank = 0;

	for (int i = n - 1; i >= 0; i--) {
		rank += fen.sum(p[i]) * fac[n - i - 1];
		fen.add(p[i], 1);
	}

	return rank;
}
```

