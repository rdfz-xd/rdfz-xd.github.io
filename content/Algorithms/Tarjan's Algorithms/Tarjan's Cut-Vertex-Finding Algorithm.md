---
tags: [Computer Science, Computer Science/Graph Theory]
---

[[Tarjan's Cut-Vertex-Finding Algorithm]] is an algorithm that finds the cut vertices in an undirected graph $G=(V,E)$ in $\mathcal{O}(|V|+|E|)$ time and $\mathcal{O}(|V|+|E|)$ space.

### Algorithm

0. Find an arbitrary depth-first search forest $T$ of $G$.

> [!info] Lemma
>
> For any vertex $v$ in $V$, $v$ is a cut vertex in $G$ iff, in $T$, $v$ has a parent and there exists a child $c$ of $v$ such that there is no edge in $E$ connecting a vertex in the subtree rooted at $c$ to a vertex other than $v$ outside the subtree, or $v$ has no parent but has more than one child.

> [!info] Lemma
>
> Let $t_\text{in}(v)$ denote the entry time of $v$ during the depth-first search, $t_\text{low}(v)$ denote the minimum $t_\text{in}$ of a vertex reachable from a vertex in the subtree rooted at $v$ via at most one edge in $E$.
>
> Then, $v$ is a cut vertex iff, in $T$, $v$ has a parent and there exists a child $c$ of $v$ such that $t_\text{low}(c)=t_\text{in}(v)$, or $v$ has no parent but has more than one child.

1. Apply the lemma to find the cut vertices.

This algorithm solves the problem in $\mathcal{O}(|V|+|E|)$ time and $\mathcal{O}(|V|+|E|)$ space.

```c++
std::vector<int> tarjan(int n, int m, const std::vector<int> &u, const std::vector<int> &v) {
	std::vector<std::vector<int>> adj(n);
	for (int i = 0; i < m; i++) {
		adj[u[i]].push_back(v[i]);
		adj[v[i]].push_back(u[i]);
	}

	std::vector in(n, -1);
	int t = 0;
	std::vector<int> res;

	for (int i = 0; i < n; i++) {
		if (~in[i]) {
			continue;
		}

		y_combinator([&](auto &&self, int u) -> int {
			int low = in[u] = t++, cnt = 0;
			for (int v : adj[u]) {
				if (in[v] == -1) {
					int clow = self(v);
					low = std::min(low, clow);
					cnt += clow == in[u];
				} else {
					low = std::min(low, in[v]);
				}
			}
			if (cnt > (u == i)) {
				res.push_back(u);
			}

			return low;
		})(i);
	}

	return res;
}
```

