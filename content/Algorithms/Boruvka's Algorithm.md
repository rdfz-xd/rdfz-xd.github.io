---
tags: [Computer Science, Computer Science/Graph Theory]
---

[[Boruvka's Algorithm]] is an algorithm that computes the weight of the minimum spanning tree of a connected undirected graph $G=(V,E)$ with edge weights in $\mathcal{O}(|E|\log|V|)$ time and $\mathcal{O}(|E|)$ space.

> [!tip]
>
> This problem can also be solved by [[Kruskal's Algorithm]] in $\mathcal{O}(|E|\log|E|)$ time and $\mathcal{O}(|E|)$ space.

> [!tip]
>
> This problem can also be solved by [[Prim's Algorithm]] in
>
> - $\mathcal{O}(|V|^2+|E|)$ time and $\mathcal{O}(|E|)$ space, or
> - $\mathcal{O}(|E|\log|E|)$ time and $\mathcal{O}(|E|)$ space.

### Algorithm

> [!info] Lemma
>
> Let $\mathcal{T}$ denote the set of minimum spanning trees of $G$, $\delta(v)$ denote the set of edges incident with $v$. Then
> $$
> \forall v\in V,\forall e\in\arg\min_{e\in\delta(v)}w(e),\exist T\in\mathcal{T},e\in E(T)
> $$
>
> > [!note]- Proof
> >
> > Let $T$ be an arbitrary minimum spanning tree of $G$.
> >
> > If $e\notin E(T)$, let $C$ be the cycle in $T+e$, $f$ be an edge in $C\cap\delta(v)\setminus\{e\}$, then since $w(f)\ge w(e)$, it follows that $T+e-f$ is a minimum spanning tree containing $e$.

0. For each vertex $v$ in $V$, choose an edge $e_v$ in $\arg\min_{e\in\delta(v)}w(e)$.

1. For each $e_v$, if it is still connecting two distinct vertices, select and contract it.
2. Solve for the resulting graph recursively.

Let $u$ be the other vertex incident with $e_v$, then it is easy to prove that
$$
\min_{e\in\delta(u)}w(e)\le\min_{e\in\delta(v)}w(e)
$$
Therefore, at the moment each edge is selected, it satisfies the conditions of the lemma. Applying the lemma yields that the selected edges form a minimum spanning tree.

This algorithm solves the problem in $\mathcal{O}(|E|\log|V|)$ time and $\mathcal{O}(|E|)$ space.

~~~c++
int boruvka(int n, int m, const std::vector<int> &u, const std::vector<int> &v, const std::vector<int> &w) {
	std::vector f(m, false);
	while (std::ranges::count(f, true) < n - 1) {
		std::vector<std::vector<int>> adj(n);
		for (int i = 0; i < m; i++) {
			if (f[i]) {
				adj[u[i]].push_back(v[i]);
				adj[v[i]].push_back(u[i]);
			}
		}

		std::vector bel(n, -1);
		int cnt = 0;

		for (int i = 0; i < n; i++) {
			if (~bel[i]) {
				continue;
			}
			bel[i] = cnt;

			std::queue<int> q;
			q.push(i);
			while (!q.empty()) {
				int u = q.front();
				q.pop();

				for (int v : adj[u]) {
					if (bel[v] == -1) {
						bel[v] = cnt;
						q.push(v);
					}
				}
			}

			cnt++;
		}

		std::vector e(cnt, -1);
		for (int i = 0; i < m; i++) {
			if (bel[u[i]] == bel[v[i]]) {
				continue;
			}

			for (int j : {bel[u[i]], bel[v[i]]}) {
				if (e[j] == -1 || w[e[j]] > w[i]) {
					e[j] = i;
				}
			}
		}

		for (int i = 0; i < cnt; i++) {
			f[e[i]] = true;
		}
	}

	int sum = 0;
	for (int i = 0; i < m; i++) {
		if (f[i]) {
			sum += w[i];
		}
	}
	return sum;
}
~~~

> [!note]- Proof
>
> It is easy to prove that in each phase, $|V|$ decreases by at least a factor of $2$.
