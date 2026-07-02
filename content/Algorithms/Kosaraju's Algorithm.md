---
tags: [Computer Science, Computer Science/Graph Theory]
---

[[Kosaraju's Algorithm]] is an algorithm that finds the strongly connected components of a directed graph $G=(V,E)$ in $\mathcal{O}(|V|+|E|)$ and $\mathcal{O}(|V|+|E|)$ space.

### Algorithm

0. Find an arbitrary depth-first search forest of $G$. Let $t_\text{out}(v)$ denote the exit time of $v$ during the depth-first search, and let $v_0,v_1,\dots,v_{|V|-1}$ be the vertices in the decreasing order of $t_\text{out}$.

> [!info] Lemma
>
> Let
> $$
> t_\text{out}(S)=\max_{v\in S}t_\text{out}(v)
> $$
> Then, let $\mathcal{S}$ denote the set of the strongly connected components of $G$, and let $S_0,S_1,\dots,S_{|\mathcal{S}|-1}$ be the strongly connected components of $G$ in the decreasing order of $t_\text{out}$, then $S_0,S_1,\dots,S_{|\mathcal{S}|-1}$ is also a topological sort of the strongly connected components by their reachability.
>
> > [!note]- Proof
> >
> > It is easy to prove that
> > $$
> > \forall S,T\in\mathcal{S},(S\ne T\land S\leadsto_G T)\Rightarrow t_\text{out}(S)>t_\text{out}(T)
> > $$

> [!info] Lemma
> $$
> \forall v\in V,v\in S_0\Leftrightarrow v_0\leadsto_{G^\text{T}}v
> $$
>
> > [!note]- Proof
> >
> > Applying the definition yields $v_0\in S_0$.
> >
> > Therefore,
> > $$
> > \forall v\in S_0,v\leadsto_Gv_0
> > $$
> >
> > $$
> > \forall v\in S_0,v\leadsto_Gv_0\iff\forall v\in S_0,v_0\leadsto_{G^\text{T}}v
> > $$
> >
> > Since $S_0,S_1,\dots,S_{|\mathcal{S}|-1}$ is a topological sort by reachability, it follows that
> > $$
> > \forall i\in\{1,2,\dots,|\mathcal{S}|-1\},S_i\not\leadsto_GS_0
> > $$
> >
> > $$
> > \begin{align}
> > \forall i\in\{1,2,\dots,|\mathcal{S}|-1\},S_i\not\leadsto_GS_0&\iff\forall i\in\{1,2,\dots,|\mathcal{S}|-1\},S_0\not\leadsto_{G^\text{T}}S_i\\
> > &\iff\forall v\in V\setminus S_0,v_0\not\leadsto_{G^\text{T}}v\\
> > &\iff\forall v\in V,v_0\leadsto_{G^\text{T}}v\Rightarrow v\in S_0
> > \end{align}
> > $$
> >
> > 

1. Apply the lemma to find $S_0$.
2. Find the strongly connected components $T_0,T_1,\dots,T_{|\mathcal{T}|-1}$ of $G-S_0$ recursively.

> [!info] Lemma
> $$
> \forall x,y\in V\setminus S_0,x\leadsto_Gy\Leftrightarrow x\leadsto_{G-S_0}y
> $$
>
> > [!note]- Proof
> >
> > Since $S_0,S_1,\dots,S_{|\mathcal{S}|-1}$ is a topological sort by reachability, it follows that
> > $$
> > \forall i\in\{1,2,\dots,|\mathcal{S}|-1\},S_i\not\leadsto_GS_0
> > $$
> > Since
> > $$
> > \forall i\in\{1,2,\dots,|\mathcal{S}|-1\},S_i\not\leadsto_GS_0\iff\forall v\in V\setminus S_0,v\not\leadsto_GS_0
> > $$
> > it follows that, for any path $x,u_0,u_1,\dots,u_{n-1},y$ from $x$ to $y$ in $G$,
> > $$
> > \forall i\in\{0,1,\dots,n-1\},u_i\notin S_0
> > $$
> > Therefore,
> > $$
> > x\leadsto_Gy\implies x\leadsto_{G-S_0}y
> > $$
> > 

3. Applying the lemma yields that $S_0,T_0,T_1,\dots,T_{|\mathcal{T}|-1}$ are the strongly connected components of $G$.

This algorithm solves the problem in $\mathcal{O}(|V|+|E|)$ time and $\mathcal{O}(|V|+|E|)$ space.

```c++
std::vector<int> kosaraju(int n, int m, const std::vector<int> &u, const std::vector<int> &v) {
	std::vector<std::vector<int>> adj(n), adjt(n);
	for (int i = 0; i < m; i++) {
		adj[u[i]].push_back(v[i]);
		adjt[v[i]].push_back(u[i]);
	}

	std::vector vis(n, false);
	std::vector<int> o;

	for (int i = 0; i < n; i++) {
		if (vis[i]) {
			continue;
		}

		y_combinator([&](auto &&self, int u) -> void {
			vis[u] = true;
			for (int v : adj[u]) {
				if (!vis[v]) {
					self(v);
				}
			}
			o.push_back(u);
		})(i);
	}

	std::vector bel(n, -1);
	int cnt = 0;

	for (int i : o | std::views::reverse) {
		if (~bel[i]) {
			continue;
		}

		y_combinator([&](auto &&self, int u) -> void {
			bel[u] = cnt;
			for (int v : adjt[u]) {
				if (bel[v] == -1) {
					self(v);
				}
			}
		})(i);
		cnt++;
	}

	return bel;
}
```

