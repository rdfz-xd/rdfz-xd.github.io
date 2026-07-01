---
tags: [Computer Science, Computer Science/Graph Theory]
---

The [[Bellman-Ford Algorithm]] is an algorithm that computes the length of the shortest path from a vertex $s$ to every vertex in a directed graph $G=(V,E)$ with edge weights and no negative cycles in $\mathcal{O}(|V||E|)$ time and $\mathcal{O}(|V|)$ space.

> [!tip] Hint
>
> This problem can also be solved by the [[Floyd-Warshall Algorithm]] in $\mathcal{O}(|V|^3+|E|)$ time and $\mathcal{O}(|V|^2)$ space.

> [!tip] Hint
>
> This problem can also be solved by [[Johnson's Algorithm]] in
>
> - $\mathcal{O}(|V|^3+|V||E|)$ time and $\mathcal{O}(|V|^2+|E|)$ space, or
>
> - $\mathcal{O}((|V|^2+|V||E|)\log|E|)$ time and $\mathcal{O}(|V|^2+|E|)$ space.

### Algorithm 0

> [!info] Lemma
>
> Let $f_i(v)$ denote the length of the shortest path from $s$ to $v$ passing through at most $i$ edges, $\delta_\text{in}(v)$ denote the set of edges directed toward $v$. Then
> $$
> \forall i\in\Z_+,\forall v\in V,f_i(v)=\min\{f_{i-1}(v),\min_{e\in\delta_\text{in}(v)}(f_{i-1}(s(e))+w(e))\}
> $$

> [!info] Lemma
>
> Let $\operatorname{dist}(s,v)$ denote the length of the shortest path from $s$ to $v$, then
> $$
> \forall v\in V,\operatorname{dist}(s,v)=f_{|V|-1}(v)
> $$
>
> > [!note]- Proof
> >
> > Let $v_0v_1\dots v_{n-2}v_{n-1}$, where $v_0=s$ and $v_{n-1}=v$, be a shortest path from $s$ to $v$ passing through the least number of edges.
> >
> > Then, if $n>|V|$, applying the **Pigeonhole Principle** yields
> > $$
> > \exist i,j\in\{0,1,\dots,n-1\},i<j\land v_i=v_j
> > $$
> > Therefore, $v_0v_1\dots v_iv_{j+1}v_{j+2}\dots v_{n-1}$ is a shortest path passing through fewer edges.
> >
> > By contradiction, it follows that $n\le|V|$.

Applying the lemmas to find $f$ and $\operatorname{dist}$ yields an algorithm that solves the problem in $\mathcal{O}(|V||E|)$ time and $\mathcal{O}(|V|^2)$ space.

```c++
std::vector<int> bellman_ford(int n, int m, const std::vector<int> &u, const std::vector<int> &v, const std::vector<int> &w, int s) {
	std::vector dist(n, std::vector(n, inf));
	dist[0][s] = 0;
	for (int i = 1; i < n; i++) {
		dist[i] = dist[i - 1];
		for (int j = 0; j < m; j++) {
			dist[i][v[j]] = std::min(dist[i][v[j]], dist[i - 1][u[j]] + w[j]);
		}
	}
	return dist[n - 1];
}
```

### Algorithm 1

Based on [[Bellman-Ford Algorithm#Algorithm 0]], ignoring the first dimension yields an algorithm that solves the problem in $\mathcal{O}(|V||E|)$ time and $\mathcal{O}(|V|)$ space.

```c++
std::vector<int> bellman_ford(int n, int m, const std::vector<int> &u, const std::vector<int> &v, const std::vector<int> &w, int s) {
	std::vector dist(n, inf);
	dist[s] = 0;
	for (int i = 1; i < n; i++) {
		for (int j = 0; j < m; j++) {
			dist[v[i]] = std::min(dist[v[i]], dist[u[i]] + w[i]);
		}
	}
	return dist;
}
```

> [!note]- Proof
>
> It is easy to prove that each value in the  `dist` in [[Bellman-Ford Algorithm#Algorithm 1]] is always less than or equal to the corresponding value in the `dist` in [[Bellman-Ford Algorithm#Algorithm 0]].

### Algorithm 2

Based on [[Bellman-Ford Algorithm#Algorithm 1]], maintaining a queue to skip unchanged values that cannot be used to update other values yields an algorithm that solves the problem in $\mathcal{O}(|V||E|)$ and $\mathcal{O}(|V|+|E|)$ space.

```c++
std::vector<int> bellman_ford(int n, int m, const std::vector<int> &u, const std::vector<int> &v, const std::vector<int> &w, int s) {
	std::vector<std::vector<std::pair<int, int>>> adj(n);
	for (int i = 0; i < m; i++) {
		adj[u[i]].emplace_back(v[i], w[i]);
	}

	std::vector dist(n, inf);
	dist[s] = 0;
	std::queue<int> q;
	q.push(s);
	std::vector vis(n, false);
	vis[s] = true;

	while (!q.empty()) {
		int u = q.front();
		q.pop();
		vis[u] = false;

		for (auto [v, w] : adj[u]) {
			if (dist[v] > dist[u] + w) {
				dist[v] = dist[u] + w;
				if (!vis[v]) {
					q.push(v);
					vis[v] = true;
				}
			}
		}
	}

	return dist;
}
```

