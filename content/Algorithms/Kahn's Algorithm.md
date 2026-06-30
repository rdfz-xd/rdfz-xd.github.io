---
tags: [Computer Science, Computer Science/Graph Theory]
---

[[Kahn's Algorithm]] is an algorithm that finds a topological sort for a directed acyclic graph $G=(V,E)$ in $\mathcal{O}(|V|+|E|)$ time and $\mathcal{O}(|V|)$ space.

### Algorithm 0

> [!info] Lemma
>
> Let $\deg_\text{in}(v)$ denote the in-degree of $v$, then
> $$
> \exist v\in V,\deg_\text{in}(v)=0
> $$
>
> > [!note]- Proof
> >
> > If $\forall v\in V,\deg_\text{in}(v)>0$, let $f(v)$ be a vertex such that there exists an edge directed from $f(v)$ to $v$.
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
> > By contradiction, it follows that $\exist v\in V,\deg_\text{in}(v)=0$.

0. Let $v$ be a vertex in $\{v:v\in V\land\deg_\text{in}(v)=0\}$.

1. Find a topological sort $v_0,v_1,\dots,v_{|V|-2}$ of $G-v$ recursively.
2. $v,v_0,v_1,\dots,v_{|V|-2}$ is a topological sort of $G$.

This algorithm solves the problem in $\mathcal{O}(|V|^2+|E|)$ time and $\mathcal{O}(|V|)$ space.

```c++
std::vector deg(n, 0);
for (int u = 0; u < n; u++) {
	for (int v : adj[u]) {
		deg[v]++;
	}
}

std::vector<int> s(n), o;
std::iota(s.begin(), s.end(), 0);
while (!s.empty()) {
	int u = std::ranges::min(s, std::less(), [&](int u) -> int {
		return deg[u];
	});
	std::erase(s, u);

	o.push_back(u);
	for (int v : adj[u]) {
		deg[v]--;
	}
}
return o;
```

### Algorithm 1

Based on [[Kahn's Algorithm#Algorithm 0]], maintaining $\{v:v\in V\land\deg_\text{in}(v)=0\}$ yields an algorithm that solves the problem in $\mathcal{O}(|V|+|E|)$ time and $\mathcal{O}(|V|)$ space.

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

