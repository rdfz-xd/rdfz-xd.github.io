---
tags: [Computer Science, Computer Science/Graph Theory]
---

[[Hierholzer's Algorithm]] is an algorithm that finds an Eulerian circuit in a weakly connected directed graph $G=(V,E)$, where the in-degree of each vertex equals its out-degree, in $\mathcal{O}(|E|)$ time and $\mathcal{O}(|E|)$ space.

### Algorithm 0

0. Starting from an arbitrary vertex, walk by arbitrarily choosing an unvisited edge until the current vertex has no unvisited edges left.

> [!info] Lemma
>
> This process finds a circuit.
>
> > [!note]- Proof
> >
> > Let $v_0,v_1,\dots,v_{n-1}$ be the trail.
> >
> > - If $v_0\ne v_{n-1}$, let $c$ be the number of occurrence of $v_{n-1}$ in $v_0,v_1,\dots,v_{n-1}$, then the number of visited edges directed toward $v_{n-1}$ is $c$, and the number of visited edges directed away from $v_{n-1}$ is $c-1$.
> >
> >   Let $\deg_\text{in}(v)$ denote the in-degree of $v$, $\deg_\text{out}(v)$ denote the out-degree of $v$. Then, since there are $c$ visited edges directed toward $v_{n-1}$, $\deg_\text{in}(v_{n-1})\ge c$. On the other hand, since $v_{n-1}$ has no unvisited edges left in the end, $\deg_\text{out}(v_{n-1})=c-1$.
> >
> >   Therefore,
> >   $$
> >   \deg_\text{in}(v_{n-1})>\deg_\text{out}(v_{n-1})
> >   $$
> >
> > By contradiction, it follows that $v_0=v_{n-1}$.

1. Let $C$ denote the circuit. After removing the edges in $C$ from $G$, find an Eulerian circuit in each weakly connected component recursively.
2. Joining these Eulerian circuits into $C$ yields an Eulerian circuit in $G$.

This algorithm solves the problem in $\mathcal{O}(|E|)$ time and $\mathcal{O}(|E|)$ space.

```c++
std::vector<int> hierholzer(int n, int m, const std::vector<int> &u, const std::vector<int> &v) {
	std::vector<std::vector<int>> adj(n);
	for (int i = 0; i < m; i++) {
		adj[u[i]].push_back(v[i]);
	}

	std::vector<int> res;
	y_combinator([&](auto &&self, int u) -> void {
		std::vector<int> c;
		y_combinator([&](auto &&self, int u) -> void {
			c.push_back(u);
			if (!adj[u].empty()) {
				int v = adj[u].back();
				adj[u].pop_back();

				self(v);
			}
		})(u);

		if (c.size() == 1) {
			res.push_back(u);
		} else {
			for (int v : c) {
				self(v);
			}
		}
	})(0);

	return res;
}
```

### Algorithm 1

Based on [[Hierholzer's Algorithm#Algorithm 0]], instead of storing the circuit explicitly, recursing during the backtracking after the circuit is found yields an algorithm that solves the problem in $\mathcal{O}(|E|)$ time and $\mathcal{O}(|E|)$ space.

```c++
std::vector<int> hierholzer(int n, int m, const std::vector<int> &u, const std::vector<int> &v) {
	std::vector<std::vector<int>> adj(n);
	for (int i = 0; i < m; i++) {
		adj[u[i]].push_back(v[i]);
	}

	std::vector<int> res;
	y_combinator([&](auto &&self, int u) -> void {
		while (!adj[u].empty()) {
			int v = adj[u].back();
			adj[u].pop_back();

			self(v);
		}
		res.push_back(u);
	})(0);
	std::ranges::reverse(res);

	return res;
}
```

