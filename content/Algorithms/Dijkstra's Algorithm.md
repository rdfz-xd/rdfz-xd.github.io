---
tags: [Computer Science, Computer Science/Algorithm, Computer Science/Graph Theory]
---

[[Dijkstra's Algorithm]] is an algorithm that computes the length of the shortest path from a vertex $s$ to every vertex in a graph $G=(V,E)$ with **non-negative** edge weights in

- $\mathcal{O}(|V|^2+|E|)$ time and $\mathcal{O}(|V|)$ space, or
- $\mathcal{O}((|V|+|E|)\log(|V|))$ time and $\mathcal{O}(|V|)$ space.

> [!tip] Hint
>
> This problem can also be solved by the [[Floyd-Warshall Algorithm]] in $\mathcal{O}(|V|^3+|E|)$ time and $\mathcal{O}(|V|^2)$ space.

### Algorithm 0

> [!info] Lemma
>
> Let $d_S(v)$ denote the length of the shortest path from $s$ to $v$ that only passes through vertices in $S$.
> $$
> \forall S\subseteq V,\forall v\in\arg\min_{v\in S}\,d_{V\setminus S}(v),\operatorname{dist}(s,v)=d_{V\setminus S}(v)
> $$
>
> > [!Proof]-
> >
> > Let $x$ be a vertex in $S$, $y$ be the first vertex on a shortest path from $s$ to $x$ such that $y\in S$. Then
> > $$
> > \begin{align}
> > \operatorname{dist}(s,x)&=\operatorname{dist}(s,y)+\operatorname{dist}(y,x)\\
> > &=d_{V\setminus S}(y)+\operatorname{dist}(y,x)\\
> > &\ge d_{V\setminus S}(y)\\
> > &\ge\min_{z\in S}\,d_{V\setminus S}(z)
> > \end{align}
> > $$
> > Therefore,
> > $$
> > \operatorname{dist}(s,v)\le d_{V\setminus S}(v)\land\operatorname{dist}(s,v)\ge d_{V\setminus S}(v)\iff\operatorname{dist}(s,v)=d_{V\setminus S}(v)
> > $$

Maintain a set $S$ of unvisited vertices, repeatedly visit a vertex $v$ in $\arg\min_{v\in S}d_{V\setminus S}(v)$ and apply the lemma to find $\operatorname{dist}(s,v)$ until $S=\empty$.

This algorithm solves the problem in $\mathcal{O}(|V|^2+|E|)$ time and $\mathcal{O}(|V|)$ space.

~~~c++
std::vector dist(n, inf);
dist[0] = 0;
std::vector<int> s(n);
std::iota(s.begin(), s.end(), 0);

while (!s.empty()) {
	int u = std::ranges::min(s, [&](int i, int j) -> bool {
		return dist[i] < dist[j];
	});
	std::erase(s, u);

	for (auto [v, w] : adj[u]) {
		dist[v] = std::min(dist[v], dist[u] + w);
	}
}

return dist;
~~~

### Algorithm 1

Based on [[Dijkstra's Algorithm#Algorithm 0]], using a **binary heap** to maintain the set $S$ yields an algorithm that solves the problem in $\mathcal{O}((|V|+|E|)\log(|V|))$ time and $\mathcal{O}(|V|)$ space.

~~~c++
std::vector dist(n, inf);
dist[0] = 0;
std::priority_queue<std::pair<int, int>, std::vector<std::pair<int, int>>, std::greater<>> s;
s.emplace(dist[0], 0);

while (!s.empty()) {
	auto [prio, u] = s.top();
	s.pop();
	if (prio != dist[u]) {
		continue;
	}

	for (auto [v, w] : adj[u]) {
		if (dist[v] > dist[u] + w) {
			dist[v] = dist[u] + w;
			s.emplace(dist[v], v);
		}
	}
}

return dist;
~~~

