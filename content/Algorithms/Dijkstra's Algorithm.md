---
tags: [Computer Science, Computer Science/Algorithm, Computer Science/Graph Theory]
---

[[Dijkstra's Algorithm]] is an algorithm that computes $\operatorname{dist}(s,v_0),\operatorname{dist}(s,v_1),\dots,\operatorname{dist}(s,v_{|V|-1})$ for a graph $G$ with non-negative edge weights and a vertex $s\in G$ in

- $\mathcal{O}(|V|^2+|E|)$ time and $\mathcal{O}(|V|+|E|)$ space
- $\mathcal{O}((|V|+|E|)\log(|V|))$ time and $\mathcal{O}(|V|+|E|)$ space

### Algorithm 0

> [!Lemma]
>
> Let $P_v$ be the set of all shortest paths from $s$ to $v$, then
> $$
> \forall u,v\in V,\operatorname{dist}(s,u)>\operatorname{dist}(s,v)\Rightarrow\forall p\in P_v,u\not\in p
> $$
>
> > [!Proof]-
> > $$
> > \begin{align}
> > \exist p\in P_v,u\in p&\implies\operatorname{dist}(s,u)+\operatorname{dist}(u,v)\le\operatorname{dist}(s,v)\\
> > &\implies\operatorname{dist}(s,u)\le\operatorname{dist}(s,v)
> > \end{align}
> > $$

Let $d_S(v)$ be the length of the shortest path from $s$ to $v$ only passing through vertices in $S$. Visit the vertices in the order of their distance from $s$ by maintaining a set $S$ of unvisited vertices. Let $v$ be a vertex in $\operatorname{argmin}_{v\in S}d_{V\setminus S}(v)$, then applying the lemma yields $\operatorname{dist}(s,v)=d_{V\setminus S}(v)$. Therefore, the next vertex to visit can be $v$.

This algorithm solves the problem in $\mathcal{O}(|V|^2+|E|)$ time and $\mathcal{O}(|V|+|E|)$ space.

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
~~~

### Algorithm 1

Based on [[Dijkstra's Algorithm#Algorithm 0]], using a **heap** to maintain the set $S$ yields an algorithm that solves the problem in $\mathcal{O}((|V|+|E|)\log(|V|))$ time and $\mathcal{O}(|V|+|E|)$ space.

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
~~~

