---
tags: [Computer Science, Computer Science/Graph Theory]
---

[[Tarjan's Strongly Connected Components Algorithm]] is an algorithm that finds the strongly connected components of a directed graph $G=(V,E)$ in $\mathcal{O}(|V|+|E|)$ and $\mathcal{O}(|V|+|E|)$ space.

> [!tip] Hint
>
> This problem can also be solved by [[Kosaraju's Algorithm]] in $\mathcal{O}(|V|+|E|)$ time and $\mathcal{O}(|V|+|E|)$ space.

### Algorithm

0. Find an arbitrary depth-first search forest $T$ of $G$.

> [!info] Lemma
>
> Call the vertex in a strongly connected component $S$ that is visited first during the depth-first search the *root* of $S$, then, in $T$, all the vertices in $S$ are in the subtree rooted at the *root* of $S$.

> [!info] Lemma
>
> For any strongly connected component $S$ of $G$, $T[S]$ is connected.
>
> > [!note]- Proof
> >
> > Let $r$ be the *root* of $S$, then, for any vertex $v$ in $S$, applying the lemma yields that $r$ is an ancestor of $v$ in $T$.
> >
> > For any vertex $u$ on the path between $r$ and $v$ in $T$, $r\leadsto u\land u\leadsto v$.
> >
> > Since $v$ is strongly connected to $r$, it follows that
> > $$
> > u\leadsto v\iff u\leadsto r
> > $$
> > Therefore, since $u\leadsto r\land r\leadsto u$, it follows that $u$ is also strongly connected to $r$.

1. During the depth-first search, if $v$ is a *root*, after processing its subtree, assign all the vertices in its subtree that have not been assigned to any strongly connected component to the current component. Applying the lemma yields that the current component is the strongly connected component rooted at $v$.

> [!info] Lemma
>
> For any vertex $v$ in $V$, $v$ is a *root* iff, after processing its subtree, there is no edge in $E$ directed from a vertex in the subtree to an unassigned vertex outside the subtree.
>
> > [!note]- Proof
> >
> > - If $e$ is an edge directed from a vertex in the subtree to an unassigned vertex outside the subtree, since $t(e)$ is unassigned, the *root* of the strongly connected component containing $t(e)$ is an ancestor of $v$ that is not $v$.
> >
> >   Let $r$ denote this *root*, then, since $t(e)$ is strongly connected to $r$, it follows that
> >   $$
> >   v\leadsto t(e)\iff v\leadsto r
> >   $$
> >   Therefore, since $v\leadsto r\land r\leadsto v$, it follows that $v$ is strongly connected to $r$, which implies that $v$ is not a *root*.
> >
> > - If there is no edge directed from a vertex in the subtree to an unassigned vertex outside the subtree,
> >
> >   - if $v$ does not have a parent, $v$ is a *root*.
> >
> >   - Otherwise, let $p$ be the parent of $v$.
> >
> >     - If $p$ and $v$ are strongly connected, let $v_0,v_1,\dots,v_{n-1}$, where $v_0=v$ and $v_{n-1}=p$, be a path from $v$ to $p$.
> >
> >       Then, since $p\leadsto v$, it follows that $v_0,v_1,\dots,v_{n-1}$ are in the same connected component as $v$, which implies that $v_0,v_1,\dots,v_{n-1}$ are all unassigned.
> >
> >       Since $v$ is in the subtree but $p$ is not, there exists an $i$ in $\{1,2,\dots,n-1\}$ such that $v_{i-1}$ is in the subtree but $v_i$ is not, which implies that $(v_{i-1},v_i)$ is an edge directed from a vertex in the subtree to an unassigned vertex outside the subtree.
> >
> >     By contradiction, it follows that $p$ and $v$ are not strongly connected, which implies that $v$ is a *root*.

> [!info] Lemma
>
> Let $t_\text{in}(v)$ denote the entry time of $v$ during the depth-first search, $t_\text{low}(v)$ denote, after processing the subtree rooted at $v$,  the minimum $t_\text{in}$ of an unassigned vertex reachable from a vertex in the subtree via at most one edge in $E$.
>
> Then, for any vertex $v$ in $V$, $v$ is a *root* iff $t_\text{low}(v)=t_\text{in}(v)$.

Applying the lemma to check if $v$ is a *root* yields an algorithm that solves the problem in $\mathcal{O}(|V|+|E|)$ time and $\mathcal{O}(|V|+|E|)$ space.

```c++
std::vector<std::vector<int>> tarjan(int n, int m, const std::vector<int> &u, const std::vector<int> &v) {
	std::vector<std::vector<int>> adj(n);
	for (int i = 0; i < m; i++) {
		adj[u[i]].push_back(v[i]);
	}

	std::vector in(n, -1);
	int t = 0;
	std::vector<int> stk;
	std::vector<std::vector<int>> res;
	std::vector vis(n, false);

	for (int i = 0; i < n; i++) {
		if (~in[i]) {
			continue;
		}

		y_combinator([&](auto &&self, int u) -> int {
			int low = in[u] = t++;
			stk.push_back(u);

			for (int v : adj[u]) {
				if (in[v] == -1) {
					low = std::min(low, self(v));
				} else if (!vis[v]) {
					low = std::min(low, in[v]);
				}
			}

			if (low == in[u]) {
				res.emplace_back();

				int v;
				do {
					v = stk.back();
					stk.pop_back();

					res.back().push_back(v);
					vis[v] = true;
				} while (v != u);
			}

			return low;
		})(i);
	}

	return res;
}
```

