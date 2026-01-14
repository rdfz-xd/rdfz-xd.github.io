---
tags: [Computer Science, Computer Science/Algorithm, Computer Science/Graph Theory]
---

[[Kruskal's Algorithm]] is an algorithm that computes the weight of the minimum spanning tree in a connected undirected graph $G=(V,E)$ with edge weights in $\mathcal{O}(|E|\log(|E|))$ time and $\mathcal{O}(|E|)$ space.

> [!tip] Hint
>
> This problem can also be solved by [[Prim's Algorithm]] in
>
> - $\mathcal{O}(|V|^2+|E|)$ time and $\mathcal{O}(|V|)$ space, or
> - $\mathcal{O}(|E|\log(|V|))$ time and $\mathcal{O}(|V|)$ space.

### Algorithm

Maintain a set $S$ of selected edges. Process all edges in non-decreasing order of weight, select an edge $e$ if $S\cup\{e\}$ is acyclic.

> [!note]- Proof
>
> Let $P_n$ be true iff after processing $n$ edges, there exists a minimum spanning tree $T$ that contains all the selected edges and none of the rejected edges.
>
> > [!info] Lemma
> > $$
> > \forall n\in\{0,1,\dots,|E|-1\},P_n\Rightarrow P_{n+1}
> > $$
> >
> > > [!note]- Proof
> > >
> > > Let $T$ be a minimum spanning tree that satisfies for $n$.
> > >
> > > If $e$ is rejected, since it is easy to prove that $e\notin E(T)$, it follows that $T$ satisfies for $n+1$.
> > >
> > > If $e$ is selected and $e\in E(T)$, $T$ satisfies for $n+1$.
> > >
> > > If $e$ is selected and $e\notin E(T)$, let $C$ be the cycle in $T+e$, then since $T$ satisfies for $n$, it follows that there exists $f\in C$ such that $f$ is not processed.
> > >
> > > Since $f$ is not processed, it follows that $w(f)\ge w(e)$.
> > >
> > > Since $w(f)>w(e)$ implies that $T+e-f$ is a spanning tree with less weight than $T$, it follows that $w(f)=w(e)$. 
> > >
> > > Therefore, $T+e-f$ satisfies for $n+1$.
>
> Since it is easy to prove that $P_0$ is true, it follows that applying the lemma yields that $P_{|E|}$ is true.

Applying **Introsort** to sort the edges and using a **Disjoint Set Union** to maintain the set $S$ yield an algorithm that solves the problem in $\mathcal{O}(|E|\log(|E|))$ time and $\mathcal{O}(|E|)$ space.

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

