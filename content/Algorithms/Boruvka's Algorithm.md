---
tags: [Computer Science, Computer Science/Graph Theory]
---

[[Boruvka's Algorithm]] is an algorithm that computes the weight of the minimum spanning tree of a connected undirected graph $G=(V,E)$ with edge weights in $\mathcal{O}(|E|\log(|V|))$ time and $\mathcal{O}(|V|)$ space.

> [!tip] Hint
>
> This problem can also be solved by [[Kruskal's Algorithm]] in $\mathcal{O}(|E|\log(|E|))$ time and $\mathcal{O}(|E|)$ space.

> [!tip] Hint
>
> This problem can also be solved by [[Prim's Algorithm]] in
>
> - $\mathcal{O}(|V|^2+|E|)$ time and $\mathcal{O}(|V|)$ space, or
> - $\mathcal{O}(|E|\log(|V|))$ time and $\mathcal{O}(|V|)$ space.

### Algorithm

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

For each $v$ in $V$, let $e_v$ be an edge in $\arg\min_{f\in\delta(v)}w(f)$. Then, for each $v$ in $V$, if $e_v$ is not a self-loop, select $e_v$, update $G$ to $G/e_v$, and update $e$ accordingly. Repeat this process until $|V|=1$.

Let $u$ be the other vertex incident with $e_v$, then it is easy to prove that
$$
\min_{f\in\delta(u)}w(f)\le\min_{f\in\delta(v)}w(f)
$$
Therefore, applying the lemma yields that the selected edges form a minimum spanning tree.

Using a **Disjoint Set Union** to maintain the structure of the graph $G$ yields an algorithm that solves the problem in $\mathcal{O}(|E|\log(|V|))$ time and $\mathcal{O}(|V|)$ space.

> [!note]- Proof
>
> It is easy to prove that in each phase, $|V|$ decreases by at least a factor of $2$.

~~~c++
DSU dsu(n);
int sum = 0;

while (dsu.size(0) < n) {
	std::vector e(n, -1);
	for (int i = 0; i < m; i++) {
		if (dsu.same(u[i], v[i])) {
			continue;
		}

		for (int j : {dsu.find(u[i]), dsu.find(v[i])}) {
			if (e[j] == -1 || w[e[j]] > w[i]) {
				e[j] = i;
			}
		}
	}
	for (int i = 0; i < n; i++) {
		if (dsu.find(i) == i && dsu.merge(u[e[i]], v[e[i]])) {
			sum += w[e[i]];
		}
	}
}

return sum;
~~~

