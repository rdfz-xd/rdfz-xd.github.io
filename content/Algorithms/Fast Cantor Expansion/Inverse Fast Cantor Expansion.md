---
tags: [Computer Science]
---

The [[Inverse Fast Cantor Expansion]] is an algorithm that finds the $k$-th lexicographically smallest permutation of $\{0,1,\dots,n-1\}$ in $\mathcal{O}(n\log n)$ time and $\mathcal{O}(n)$ space.

### Algorithm 0

> [!info] Lemma
>
> For any permutation $p_0,p_1,\dots,p_{n-1}$ of $\{0,1,\dots,n-1\}$, the lexicographical rank of $p_0,p_1,\dots,p_{n-1}$ among all permutations of $\{0,1,\dots,n-1\}$ is
> $$
> \sum_{i=0}^{n-1}(n-i-1)!\sum_{j=i+1}^{n-1}[p_j<p_i]
> $$

0. Let $p_0=\left\lfloor\frac{k}{(n-1)!}\right\rfloor$. Find the $k\bmod(n-1)!$-th lexicographically smallest permutation $p_1,p_2,\dots,p_{n-1}$ of $\{0,1,\dots,n-1\}\setminus\{p_0\}$ recursively.
0. Applying the lemma yields that $p_0,p_1,\dots,p_{n-1}$ is the $k$-th lexicographically smallest permutation of $\{0,1,\dots,n-1\}$.

This algorithm solves the problem in $\mathcal{O}(n^2)$ time and $\mathcal{O}(n)$ space.

```c++
std::vector<int> ifce(int n, int k) {
	std::vector fac(n, 1);
	for (int i = 1; i < n; i++) {
		fac[i] = i * fac[i - 1];
	}

	std::vector vis(n, true);
	std::vector<int> p(n);

	for (int i = 0; i < n; i++) {
		p[i] = (std::views::iota(0, n) | std::views::filter([&](int j) -> bool {
			return vis[j];
		}) | std::views::drop(k / fac[n - i - 1])).front();
		vis[p[i]] = false;
		k %= fac[n - i - 1];
	}

	return p;
}
```

### Algorithm 1

Based on [[Inverse Fast Cantor Expansion#Algorithm 0]], using a [[Fenwick Tree]] to maintain `vis` yields an algorithm that solves the problem in $\mathcal{O}(n\log n)$ time and $\mathcal{O}(n)$ space.

```c++
std::vector<int> ifce(int n, int k) {
	std::vector fac(n, 1);
	for (int i = 1; i < n; i++) {
		fac[i] = i * fac[i - 1];
	}

	FenwickTree fen(n, 1);
	std::vector<int> p(n);

	for (int i = 0; i < n; i++) {
		p[i] = fen.select(k / fac[n - i - 1]);
		fen.add(p[i], -1);
		k %= fac[n - i - 1];
	}

	return p;
}
```
