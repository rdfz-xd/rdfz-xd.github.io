---
tags: [Computer Science, Computer Science/Algorithm, Computer Science/Graph Theory]
---

The [[Floyd-Warshall Algorithm]] is an algorithm that computes the length of the shortest path between every pair of vertices in a graph $G=\langle V,E\rangle$ with edge weights in $\mathcal{O}(|V|^3+|E|)$ time and $\mathcal{O}(|V|^2+|E|)$ space.

> [!tip] Hint
>
> If the edge weights are non-negative, this problem can also be solved by [[Dijkstra's Algorithm]] in
>
> - $\mathcal{O}(|V|^3+|V||E|)$ time and $\mathcal{O}(|V|^2+|E|)$ space, or
> - $\mathcal{O}(|V|(|V|+|E|)\log(|V|))$ and $\mathcal{O}(|V|^2+|E|)$ space.

### Algorithm 0

Let $V=\{v_0,v_1,\dots,v_{|V|-1}\}$, $f(i,x,y)$ denote the length of the shortest path from $x$ to $y$ that only passes through vertices $v_0,v_1,\dots,v_{i-1}$. Then it is easy to prove that
$$
\forall i\in\{1,2,\dots,|V|\},\forall x,y\in V,f(i,x,y)=\min\{f(i-1,x,y),f(i-1,x,v_{i-1})+f(i-1,v_{i-1},y)\}
$$
and
$$
\forall x,y\in V,\operatorname{dist}(x,y)=f(|V|,x,y)
$$
Therefore, computing $f$ yields an algorithm that solves the problem in $\mathcal{O}(|V|^3+|E|)$ time and $\mathcal{O}(|V|^3+|E|)$ space.

~~~c++
std::vector dist(n, std::vector(n, std::vector(n, inf)));
for (auto [u, v, w] : edges) {
	dist[0][u][v] = w;
}
for (int k = 0; k < n; k++) {
	for (int i = 0; i < n; i++) {
		for (int j = 0; j < n; j++) {
			dist[k + 1][i][j] = std::min(dist[k][i][j], dist[k][i][k] + dist[k][k][j]);
		}
	}
}
~~~

### Algorithm 1

> [!info] Lemma
> $$
> \forall i\in\{1,2,\dots,|V|\},\forall x\in V,f(i,x,v_{i-1})=f(i-1,x,v_{i-1})
> $$
>
> $$
> \forall i\in\{1,2,\dots,|V|\},\forall y\in V,f(i,v_{i-1},y)=f(i-1,v_{i-1},y)
> $$

Based on [[Floyd-Warshall Algorithm#Algorithm 0]], applying the lemma yields an algorithm that solves the problem in $\mathcal{O}(|V|^3+|E|)$ time and $\mathcal{O}(|V|^2+|E|)$ space.

~~~c++
std::vector dist(n, std::vector(n, inf));
for (auto [u, v, w] : edges) {
	dist[u][v] = w;
}
for (int k = 0; k < n; k++) {
	for (int i = 0; i < n; i++) {
		for (int j = 0; j < n; j++) {
			dist[i][j] = std::min(dist[i][j], dist[i][k] + dist[k][j]);
		}
	}
}
~~~

