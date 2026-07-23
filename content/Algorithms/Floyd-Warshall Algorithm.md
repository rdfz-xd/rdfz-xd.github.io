---
tags: [Computer Science, Computer Science/Graph Theory]
---

The [[Floyd-Warshall Algorithm]] is an algorithm that computes the length of the shortest path between every pair of vertices in a directed graph $G=(V,E)$ with edge weights and no negative cycles in $\mathcal{O}(|V|^3+|E|)$ time and $\mathcal{O}(|V|^2)$ space.

> [!tip]
>
> This problem can also be solved by the [[Bellman-Ford Algorithm]] in $\mathcal{O}(|V|^2|E|)$ time and $\mathcal{O}(|V|^2)$ space.

> [!tip]
>
> This problem can also be solved by [[Johnson's Algorithm]] in
>
> - $\mathcal{O}(|V|^3+|V||E|)$ time and $\mathcal{O}(|V|^2+|E|)$ space, or
>
> - $\mathcal{O}((|V|^2+|V||E|)\log|E|)$ time and $\mathcal{O}(|V|^2+|E|)$ space.

### Algorithm 0

> [!info] Lemma
>
> Let $V=\{v_0,v_1,\dots,v_{|V|-1}\}$, and let $f_i(x,y)$ denote the length of the shortest path from $x$ to $y$ that only passes through (excluding the endpoints) vertices $v_0,v_1,\dots,v_{i-1}$. Then
> $$
> \forall i\in\{0,1,\dots,|V|-1\},\forall x,y\in V,f_{i+1}(x,y)=\min\{f_i(x,y),f_i(x,v_i)+f_i(v_i,y)\}
> $$

Applying the lemma to find $f_{|V|}$ yields an algorithm that solves the problem in $\mathcal{O}(|V|^3+|E|)$ time and $\mathcal{O}(|V|^3)$ space.

~~~c++
std::vector<std::vector<int>> floyd_warshall(int n, int m, const std::vector<int> &u, const std::vector<int> &v, const std::vector<int> &w) {
	std::vector dist(n + 1, std::vector(n, std::vector(n, inf)));
	for (int i = 0; i < m; i++) {
		dist[0][u[i]][v[i]] = std::min(dist[0][u[i]][v[i]], w[i]);
	}
	for (int k = 0; k < n; k++) {
		for (int i = 0; i < n; i++) {
			for (int j = 0; j < n; j++) {
				dist[k + 1][i][j] = std::min(dist[k][i][j], dist[k][i][k] + dist[k][k][j]);
			}
		}
	}
	return dist[n];
}
~~~

### Algorithm 1

> [!info] Lemma
> $$
> \forall i\in\{0,1,\dots,|V|-1\},\forall x\in V,f_{i+1}(x,v_i)=f_i(x,v_i)
> $$
>
> $$
> \forall i\in\{0,1,\dots,|V|-1\},\forall y\in V,f_{i+1}(v_i,y)=f_i(v_i,y)
> $$

Based on [[Floyd-Warshall Algorithm#Algorithm 0]], applying the lemma yields that the first dimension can be ignored.

Ignoring the first dimension yields an algorithm that solves the problem in $\mathcal{O}(|V|^3+|E|)$ time and $\mathcal{O}(|V|^2)$ space.

~~~c++
std::vector<std::vector<int>> floyd_warshall(int n, int m, const std::vector<int> &u, const std::vector<int> &v, const std::vector<int> &w) {
	std::vector dist(n, std::vector(n, inf));
	for (int i = 0; i < m; i++) {
		dist[u[i]][v[i]] = std::min(dist[u[i]][v[i]], w[i]);
	}
	for (int k = 0; k < n; k++) {
		for (int i = 0; i < n; i++) {
			for (int j = 0; j < n; j++) {
				dist[i][j] = std::min(dist[i][j], dist[i][k] + dist[k][j]);
			}
		}
	}
	return dist;
}
~~~

