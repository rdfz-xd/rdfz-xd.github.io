---
tags: [Computer Science, Computer Science/Graph Theory]
---

[[Kahn's Algorithm]] is an algorithm that finds a topological sort of a directed acyclic graph $G=(V,E)$ in $\mathcal{O}(|V|+|E|)$ time and $\mathcal{O}(|V|)$ space.

### Algorithm

> [!info] Lemma
>
> Let $\operatorname{deg}(v)$ denote the number of edges directed toward $v$, then
> $$
> \exist v\in V,\operatorname{deg}(v)=0
> $$
>
> > [!note]- Proof
> >
> > If $\forall v\in V,\deg(v)>0$, let $f(v)$ be a vertex such that there exists an edge directed from $f(v)$ to $v$.
> >
> > Let $v_0,v_1,\dots,v_{|V|}$ be a sequence of vertices in $V$ such that
> > $$
> > \forall i\in\{0,1,\dots,|V|-1\},v_{i+1}=f(v_i)
> > $$
> > Then applying the **Pigeonhole Principle** yields
> > $$
> > \exist i,j\in\{0,1,\dots,|V|\},i<j\land v_i=v_j
> > $$
> > Therefore, $v_j,v_{j-1},\dots,v_{i+1}$ is a cycle in $G$.
> >
> > By contradiction, it follows that $\exist v\in V,\operatorname{deg}(v)=0$.

1. Let $v$ be a vertex in $\{v:v\in V\land\operatorname{deg}(v)=0\}$.
2. Find a topological sort $v_0,v_1,\dots,v_{|V|-2}$ of $G-v$ recursively.
3. $v,v_0,v_1,\dots,v_{|V|-2}$ is a topological sort of $G$.

This algorithm solves the problem in $\mathcal{O}(|V|+|E|)$ time and $\mathcal{O}(|V|)$ space.

```c++
std::vector deg(n, 0);
for (int u = 0; u < n; u++) {
	for (int v : adj[u]) {
		deg[v]++;
	}
}

std::queue<int> q;
for (int i = 0; i < n; i++) {
	if (!deg[i]) {
		q.push(i);
	}
}

std::vector<int> o;
while (!q.empty()) {
	int u = q.front();
	q.pop();

	o.push_back(u);
	for (int v : adj[u]) {
		if (!--deg[v]) {
			q.push(v);
		}
	}
}
return o;
```

