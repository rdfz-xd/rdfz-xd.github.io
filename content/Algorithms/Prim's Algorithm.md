---
tags: [Computer Science, Computer Science/Graph Theory]
---

[[Prim's Algorithm]] is an algorithm that computes the weight of the minimum spanning tree of a connected undirected graph $G=(V,E)$ with edge weights in

- $\mathcal{O}(|V|^2+|E|)$ time and $\mathcal{O}(|V|))$ space, or
- $\mathcal{O}(|E|\log(|V|))$ time and $\mathcal{O}(|V|)$ space.

> [!tip] Hint
>
> This problem can also be solved by [[Kruskal's Algorithm]] in $\mathcal{O}(|E|\log(|E|))$ time and $\mathcal{O}(|E|)$ space.

> [!tip] Hint
>
> This problem can also be solved by [[Boruvka's Algorithm]] in $\mathcal{O}(|E|\log(|V|))$ time and $\mathcal{O}(|V|)$ space.

### Algorithm 0

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
> > If $e\notin E(T)$, let $C$ be the cycle in $T+e$, $f$ be an edge in $C\cap\delta(v)\setminus\{e\}$, then since $w(f)\ge w(e)$, it follows that $T+e-f$ is a minimum spanning tree of $G$.

Let $v$ be a vertex in $V$, select an edge $e$ in $\arg\min_{e\in\delta(v)}w(e)$ and update $G$ to $G/e$. Repeat this process until $|V|=1$. Applying the lemma yields that the selected edges form a minimum spanning tree.

This algorithm solves the problem in $\mathcal{O}(|V|^2+|E|)$ time and $\mathcal{O}(|V|)$ space.

~~~c++
std::vector dist(n, inf);
dist[0] = 0;
std::vector<int> s(n);
std::iota(s.begin(), s.end(), 0);
int sum = 0;

while (!s.empty()) {
	int u = std::ranges::min(s, [&](int i, int j) -> bool {
		return dist[i] < dist[j];
	});
	std::erase(s, u);

	sum += dist[u];
	for (auto [v, w] : adj[u]) {
		dist[v] = std::min(dist[v], w);
	}
}

return sum;
~~~

### Algorithm 1

Based on [[Prim's Algorithm#Algorithm 0]], using a **binary heap** to maintain the structure of the graph $G$ yields an algorithm that solves the problem in $\mathcal{O}(|E|\log(|V|))$ time and $\mathcal{O}(|V|)$ space.

~~~c++
std::priority_queue<std::pair<int, int>, std::vector<std::pair<int, int>>, std::greater<>> q;
q.emplace(0, 0);
std::vector vis(n, false);
int sum = 0;

while (!q.empty()) {
	auto [d, u] = q.top();
	q.pop();
	if (vis[u]) {
		continue;
	}
	vis[u] = true;

	sum += d;
	for (auto [v, w] : adj[u]) {
		q.emplace(w, v);
	}
}

return sum;
~~~

