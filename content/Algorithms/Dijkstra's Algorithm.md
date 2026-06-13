---
tags: [Computer Science, Computer Science/Graph Theory]
---

[[Dijkstra's Algorithm]] is an algorithm that computes the length of the shortest path from a vertex $s$ to every vertex in a directed graph $G=(V,E)$ with **non-negative** edge weights in

- $\mathcal{O}(|V|^2+|E|)$ time and $\mathcal{O}(|V|)$ space, or
- $\mathcal{O}((|V|+|E|)\log|E|)$ time and $\mathcal{O}(|E|)$ space.

> [!tip] Hint
>
> This problem can also be solved by the [[Floyd-Warshall Algorithm]] in $\mathcal{O}(|V|^3+|E|)$ time and $\mathcal{O}(|V|^2)$ space.

> [!tip] Hint
>
> This problem can also be solved by the [[Bellman-Ford Algorithm]] in $\mathcal{O}(|V||E|)$ time and $\mathcal{O}(|V|)$ space.

### Algorithm 0

Since the edge weights are non-negative, based on the [[Bellman-Ford Algorithm#Algorithm 2|Bellman-Ford Algorithm]], always selecting the vertex with the minimum `dist` yields an algorithm in which each vertex is visited exactly once.

This algorithm solves the problem in $\mathcal{O}(|V|^2+|E|)$ time and $\mathcal{O}(|V|)$ space.

~~~c++
std::vector dist(n, inf);
dist[s] = 0;
std::vector<int> q(n);
std::iota(q.begin(), q.end(), 0);

while (!q.empty()) {
	int u = std::ranges::min(q, [&](int i, int j) -> bool {
		return dist[i] < dist[j];
	});
	std::erase(q, u);

	for (auto [v, w] : adj[u]) {
		dist[v] = std::min(dist[v], dist[u] + w);
	}
}

return dist;
~~~

### Algorithm 1

Based on [[Dijkstra's Algorithm#Algorithm 0]], using a [[Binary Heap]] to maintain the queue yields an algorithm that solves the problem in $\mathcal{O}((|V|+|E|)\log|E|)$ time and $\mathcal{O}(|E|)$ space.

~~~c++
std::vector dist(n, inf);
dist[s] = 0;
std::priority_queue<std::pair<int, int>, std::vector<std::pair<int, int>>, std::greater<>> q;
q.emplace(dist[s], s);

while (!q.empty()) {
	auto [prio, u] = q.top();
	q.pop();
	if (prio != dist[u]) {
		continue;
	}

	for (auto [v, w] : adj[u]) {
		if (dist[v] > dist[u] + w) {
			dist[v] = dist[u] + w;
			q.emplace(dist[v], v);
		}
	}
}

return dist;
~~~

