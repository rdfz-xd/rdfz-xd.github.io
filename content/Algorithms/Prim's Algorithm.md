---
tags: [Computer Science, Computer Science/Graph Theory]
---

[[Prim's Algorithm]] is an algorithm that computes the weight of the minimum spanning tree in a connected undirected graph $G=(V,E)$ with edge weights in

- $\mathcal{O}(|V|^2+|E|)$ time and $\mathcal{O}(|V|))$ space, or
- $\mathcal{O}(|E|\log(|V|))$ time and $\mathcal{O}(|V|)$ space.

> [!tip] Hint
>
> This problem can also be solved by [[Kruskal's Algorithm]] in $\mathcal{O}(|E|\log(|E|))$ time and $\mathcal{O}(|E|)$ space.

### Algorithm 0

Let $s$ be an arbitrary vertex. Maintain a set $S$ of vertices reachable from $s$ via selected edges. Repeatedly select an edge $e$ in $\arg\min_{e\in(S,V\setminus S)}w(e)$ until $S=V$.

> [!note]- Proof
>
> Let $P_n$ be true iff when $|S|=n$, there exists a minimum spanning tree $T$ that contains all the selected edges.
>
> > [!info] Lemma
> > $$
> > \forall n\in\{1,2,\dots,|V|-1\},P_n\Rightarrow P_{n+1}
> > $$
> >
> > > [!note]- Proof
> > >
> > > If $e\in E(T)$, $T$ satisfies for $n+1$.
> > >
> > > If $e\notin E(T)$, let $C$ be the cycle in $T+e$, $f$ be an edge in $C\cap(S,V\setminus S)\setminus\{e\}$. Then $w(f)\ge w(e)$.
> > >
> > > Since $w(f)>w(e)$ implies that $T+e-f$ is a spanning tree with less weight than $T$, it follows that $w(f)=w(e)$.
> > >
> > > Therefore, $T+e-f$ satisfies for $n+1$.
>
> Since it is easy to prove that $P_1$ is true, applying the lemma yields that $P_{|V|}$ is true.

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

Based on [[Prim's Algorithm#Algorithm 0]], using a **binary heap** to maintain $V\setminus S$ yields an algorithm that solves the problem in $\mathcal{O}(|E|\log(|V|))$ time and $\mathcal{O}(|V|)$ space.

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

