---
tags: [Computer Science, Computer Science/Graph Theory]
---

The [[Floyd-Warshall Algorithm]] is an algorithm that computes the length of the shortest path between every pair of vertices in a directed graph $G=(V,E)$ with edge weights and no negative cycles in $\mathcal{O}(|V|^3+|E|)$ time and $\mathcal{O}(|V|^2)$ space.

> [!tip] Hint
>
> This problem can also be solved by the [[Bellman-Ford Algorithm]] in $\mathcal{O}(|V|^2|E|)$ time and $\mathcal{O}(|V|^2)$ space.

### Algorithm 0

Let $V=\{v_0,v_1,\dots,v_{|V|-1}\}$, and let $f_i(x,y)$ denote the length of the shortest path from $x$ to $y$ that only passes through vertices $v_0,v_1,\dots,v_{i-1}$.

> [!info] Lemma
> $$
> \forall i\in\{1,2,\dots,|V|\},\forall x,y\in V,f_i(x,y)=\min\{f_{i-1}(x,y),f_{i-1}(x,v_{i-1})+f_{i-1}(v_{i-1},y)\}
> $$

> [!info] Lemma
> $$
> \forall x,y\in V,\operatorname{dist}_G(x,y)=f_{|V|}(x,y)
> $$

Applying the lemmas to find $f$ and $\operatorname{dist}_G$ yields an algorithm that solves the problem in $\mathcal{O}(|V|^3+|E|)$ time and $\mathcal{O}(|V|^3)$ space.

~~~c++
std::vector dist(n + 1, std::vector(n, std::vector(n, inf)));
for (auto [u, v, w] : E) {
	dist[0][u][v] = w;
}
for (int k = 0; k < n; k++) {
	for (int i = 0; i < n; i++) {
		for (int j = 0; j < n; j++) {
			dist[k + 1][i][j] = std::min(dist[k][i][j], dist[k][i][k] + dist[k][k][j]);
		}
	}
}
return dist[n];
~~~

### Algorithm 1

> [!info] Lemma
> $$
> \forall i\in\{1,2,\dots,|V|\},\forall x\in V,f_i(x,v_{i-1})=f_{i-1}(x,v_{i-1})
> $$
>
> $$
> \forall i\in\{1,2,\dots,|V|\},\forall y\in V,f_i(v_{i-1},y)=f_{i-1}(v_{i-1},y)
> $$

Based on [[Floyd-Warshall Algorithm#Algorithm 0]], applying the lemma yields an algorithm that solves the problem in $\mathcal{O}(|V|^3+|E|)$ time and $\mathcal{O}(|V|^2)$ space.

~~~c++
std::vector dist(n, std::vector(n, inf));
for (auto [u, v, w] : E) {
	dist[u][v] = w;
}
for (int k = 0; k < n; k++) {
	for (int i = 0; i < n; i++) {
		for (int j = 0; j < n; j++) {
			dist[i][j] = std::min(dist[i][j], dist[i][k] + dist[k][j]);
		}
	}
}
return dist;
~~~

