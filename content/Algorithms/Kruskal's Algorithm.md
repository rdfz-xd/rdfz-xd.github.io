---
tags: [Computer Science, Computer Science/Graph Theory]
---

[[Kruskal's Algorithm]] is an algorithm that computes the weight of the minimum spanning tree of a connected undirected graph $G=(V,E)$ with edge weights in $\mathcal{O}(|E|\log(|E|))$ time and $\mathcal{O}(|E|)$ space.

> [!tip] Hint
>
> This problem can also be solved by [[Prim's Algorithm]] in
>
> - $\mathcal{O}(|V|^2+|E|)$ time and $\mathcal{O}(|V|)$ space, or
> - $\mathcal{O}(|E|\log(|V|))$ time and $\mathcal{O}(|V|)$ space.

### Algorithm

> [!info] Lemma
>
> Let $M$ denote the set of minimum spanning trees of $G$, then
> $$
> \forall e\in\arg\min_{e\in E}w(e),\exist T\in M,e\in E(T)
> $$
>
> > [!note]- Proof
> >
> > Let $T$ be an arbitrary minimum spanning tree of $G$.
> >
> > If $e\notin E(T)$, let $C$ be the cycle in $T+e$, $f$ be an edge in $C\setminus\{e\}$. Then since $w(f)\ge w(e)$, it follows that $T+e-f$ is a minimum spanning tree.

Repeatedly select an edge $e$ in $\arg\min_{e\in E}w(e)$ and update $G$ to $G/e$ until $|V|=1$. Applying the lemma yields that the selected edges form a minimum spanning tree.

Applying **Introsort** to sort the edges and using a **Disjoint Set Union** to maintain the structure of the graph $G$ yield an algorithm that solves the problem in $\mathcal{O}(|E|\log(|E|))$ time and $\mathcal{O}(|E|)$ space.

~~~c++
std::ranges::sort(e);

DSU dsu(n);
int sum = 0;

for (auto [w, u, v] : e) {
	if (dsu.merge(u, v)) {
		sum += w;
	}
}

return sum;
~~~

