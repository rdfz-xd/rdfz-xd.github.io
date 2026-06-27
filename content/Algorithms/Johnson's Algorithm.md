---
tags: [Computer Science, Computer Science/Graph Theory]
---

[[Johnson's Algorithm]] is an algorithm that computes the length of the shortest path between every pair of vertices in a directed graph $G=(V,E)$ with edge weights and no negative cycles in

- $\mathcal{O}(|V|^3+|V||E|)$ time and $\mathcal{O}(|V|^2)$ space, or

- $\mathcal{O}((|V|^2+|V||E|)\log|E|)$ time and $\mathcal{O}(|V|^2+|E|)$ space.

> [!tip] Hint
>
> This problem can also be solved by the [[Floyd-Warshall Algorithm]] in $\mathcal{O}(|V|^3+|E|)$ time and $\mathcal{O}(|V|^2)$ space.

> [!tip] Hint
>
> This problem can also be solved by the [[Bellman-Ford Algorithm]] in $\mathcal{O}(|V|^2|E|)$ time and $\mathcal{O}(|V|^2)$ space.

### Algorithm

1. Let $s$ be a new vertex, and let $G^*=(V\cup\{s\},E\cup\{(s,v,0):v\in V\})$.
2. Apply the [[Bellman-Ford Algorithm]] to find $\operatorname{dist}_{G^*}(s,v)$ for each vertex $v$ in $V$.

> [!info] Lemma
>
> Let $h(v)=\operatorname{dist}_{G^*}(s,v)$, then
> $$
> \forall e\in E,w(e)+h(s(e))-h(t(e))\ge0
> $$
>
> > [!note]- Proof
> > $$
> > w(e)+h(s(e))-h(t(e))<0\iff\operatorname{dist}_{G^*}(s,t(e))>\operatorname{dist}_{G^*}(s,s(e))+w(e)
> > $$
> > Therefore, let $e_0e_1\dots e_{n-1}$ be a shortest path from $s$ to $s(e)$, then $e_0e_1\dots e_{n-1}e$ is a path from $s$ to $t(e)$ with a weight less than $\operatorname{dist}_{G^*}(s,t(e))$.
> >
> > By contradiction, it follows that $w(e)+h(s(e))-h(t(e))\ge0$.

3. Let $G'=(V,\{(s(e),t(e),w(e)+h(s(e))-h(t(e)):e\in E\})$, then applying the lemma yields that $G'$ is a directed graph with non-negative edge weights.
4. Apply [[Dijkstra's Algorithm]] $|V|$ times to find $\operatorname{dist}_{G'}(x,y)$ for each pair of vertices $x$ and $y$ in $V$.

> [!info] Lemma
> $$
> \forall x,y\in V,\operatorname{dist}_G(x,y)=\operatorname{dist}_{G'}(x,y)-h(x)+h(y)
> $$
>
> > [!note]- Proof
> >
> > Let $e_0e_1\dots e_{n-1}$ be a path from $x$ to $y$ in $G$, $e'_0e'_1\dots e'_{n-1}$ be the corresponding path in $G'$.
> > $$
> > \begin{align}
> > \sum_{i=0}^{n-1}w(e_i)&=-h(x)+\sum_{i=0}^{n-1}(w(e_i)+h(s(e))-h(t(e)))+h(y)\\
> > &=\sum_{i=0}^{n-1}w(e'_i)-h(x)+h(y)
> > \end{align}
> > $$

5. Apply the lemma to find $\operatorname{dist}_G$.

This algorithm solves the problem in

- $\mathcal{O}(|V|^3+|V||E|)$ time and $\mathcal{O}(|V|^2)$ space, or

- $\mathcal{O}((|V|^2+|V||E|)\log|E|)$ time and $\mathcal{O}(|V|^2+|E|)$ space.

```c++
auto adj0 = adj;
adj0.emplace_back();
for (int i = 0; i < n; i++) {
	adj0[n].emplace_back(i, 0);
}

auto h = bellman_ford(adj0, n);

auto adj1 = adj;
for (int u = 0; u < n; u++) {
	for (auto &[v, w] : adj1[u]) {
		w += h[u] - h[v];
	}
}

std::vector dist(n, std::vector<int>(n));
for (int u = 0; u < n; u++) {
	dist[u] = dijkstra(adj1, u);
	for (int v = 0; v < n; v++) {
		dist[u][v] -= h[u] - h[v];
	}
}
return dist;
```

