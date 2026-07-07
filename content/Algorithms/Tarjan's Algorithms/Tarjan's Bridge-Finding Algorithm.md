---
tags: [Computer Science, Computer Science/Graph Theory]
---

[[Tarjan's Bridge-Finding Algorithm]] is an algorithm that finds the bridges in an undirected graph $G=(V,E)$ in $\mathcal{O}(|V|+|E|)$ time and $\mathcal{O}(|V|+|E|)$ space.

### Algorithm

0. Find an arbitrary depth-first search forest $T$ of $G$.

> [!info] Lemma
>
> Every bridge in $G$ corresponds to an edge in $E(T)$.

> [!info] Lemma
>
> For any edge $e$ in $E(T)$, let $e'$ be the corresponding edge of $e$ in $E$, then $e'$ is a bridge in $G$ iff there is no non-tree edge in $E$ connecting a vertex in the subtree rooted at $t(e)$ to a vertex outside the subtree.

> [!info] Lemma
>
> Let $t_\text{in}(v)$ denote the entry time of $v$ during the depth-first search, $t_\text{low}(v)$ denote the minimum $t_\text{in}$ of a vertex reachable from a vertex in the subtree rooted at $v$ via at most one non-tree edge in $E$.
>
> Then, for any edge $e$ in $E(T)$, $e$ corresponds to a bridge in $G$ iff $t_\text{low}(t(e))=t_\text{in}(t(e))$.

1. Apply the lemma to find the bridges.

This algorithm solves the problem in $\mathcal{O}(|V|+|E|)$ time and $\mathcal{O}(|V|+|E|)$ space.

```c++
std::vector<int> tarjan(int n, int m, const std::vector<int> &u, const std::vector<int> &v) {
	std::vector<std::vector<std::pair<int, int>>> adj(n);
	for (int i = 0; i < m; i++) {
		adj[u[i]].emplace_back(v[i], i);
		adj[v[i]].emplace_back(u[i], i);
	}

	std::vector in(n, -1);
	int t = 0;
	std::vector<int> res;

	for (int i = 0; i < n; i++) {
		if (~in[i]) {
			continue;
		}

		y_combinator([&](auto &&self, int u, int i) -> int {
			int low = in[u] = t++;
			for (auto [v, j] : adj[u]) {
				if (j == i) {
					continue;
				}

				if (in[v] == -1) {
					low = std::min(low, self(v, j));
				} else {
					low = std::min(low, in[v]);
				}
			}
			if (~i && low == in[u]) {
				res.push_back(i);
			}

			return low;
		})(i, -1);
	}

	return res;
}
```

