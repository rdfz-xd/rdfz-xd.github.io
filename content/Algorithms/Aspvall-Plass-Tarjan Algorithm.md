---
tags: [Computer Science, Computer Science/Graph Theory]
---

The [[Aspvall-Plass-Tarjan Algorithm]] is an algorithm that checks if
$$
\exists x_0,x_1,\dots,x_{n-1}\in\{0,1\},\forall i\in\{0,1,\dots,m-1\},x_{u_i}=a_i\lor x_{v_i}=b_i
$$
and finds such a sequence $x_0,x_1,\dots,x_{n-1}$ if there exists for $u_0,u_1,\dots,u_{m-1},v_0,v_1,\dots,v_{m-1}\in\{0,1,\dots,n-1\}$ and $a_0,a_1,\dots,a_{m-1},b_0,b_1,\dots,b_{m-1}\in\{0,1\}$ in $\mathcal{O}(n+m)$ time and $\mathcal{O}(n+m)$ space.

### Algorithm

> [!info] Lemma
> $$
> x_{u_i}=a_i\lor x_{v_i}=b_i\iff (x_{u_i}\ne a_i\Rightarrow x_{v_i}=b_i)\land(x_{v_i}\ne b_i\Rightarrow x_{u_i}=a_i)
> $$

0. Let $V=\{\langle i,p\rangle:i\in\{0,1,\dots,n-1\}\land p\in\{0,1\}\},E=\{\langle\langle u_i,1-a_i\rangle,\langle v_i,b_i\rangle\rangle:i\in\{0,1,\dots,m-1\}\}\cup\{\langle\langle v_i,1-b_i\rangle,\langle u_i,a_i\rangle\rangle:i\in\{0,1,\dots,m-1\}\},G=\langle V,E\rangle$.

> [!info] Lemma
>
> Let $X=\{\langle x_0,x_1,\dots,x_{n-1}\rangle:(\forall i\in\{0,1,\dots,n-1\},x_i\in\{0,1\})\land(\forall i\in\{0,1,\dots,m-1\},x_{u_i}=a_i\lor x_{v_i}=b_i)\}$, then
> $$
> \forall i,j\in\{0,1,\dots,n-1\},\forall p,q\in\{0,1\},\langle i,p\rangle\leadsto_G\langle j,q\rangle\Rightarrow\forall\langle x_0,x_1,\dots,x_{n-1}\rangle\in X,x_i=p\Rightarrow x_j=q
> $$
>
> > [!note]- Proof
> >
> > Applying the lemma yields
> > $$
> > \forall\langle\langle i,p\rangle,\langle j,q\rangle\rangle\in E,\forall\langle x_0,x_1,\dots,x_{n-1}\rangle\in X,x_i=p\Rightarrow x_j=q
> > $$

> [!info] Lemma
> $$
> \exists i\in\{0,1,\dots,n-1\},\langle i,0\rangle\leftrightsquigarrow_G\langle i,1\rangle\implies X=\empty
> $$
>
> > [!note]- Proof
> >
> > Applying the lemma yields
> > $$
> > \begin{align}
> > \langle i,0\rangle\leftrightsquigarrow_G\langle i,1\rangle&\implies\forall\langle x_0,x_1,\dots,x_{n-1}\rangle\in X,(x_i=0\Rightarrow x_i=1)\land(x_i=1\Rightarrow x_i=0)\\
> > &\iff X=\empty
> > \end{align}
> > $$

> [!info] Lemma
>
> Let $\mathcal{S}$ denote the set of the strongly connected components of $G$, and let $S_0,S_1,\dots,S_{|\mathcal{S}|-1}$ be a topological sort of the strongly connected components by their reachability, and let $t(i,p)$ denote the position of the strongly connected component containing $\langle i,p\rangle$ in $S_0,S_1,\dots,S_{|\mathcal{S}|-1}$.
>
> Then, if $\nexists i\in\{0,1,\dots,n-1\},\langle i,0\rangle\leftrightsquigarrow_G\langle i,1\rangle$,
> $$
> x_0=[t(0,1)>t(0,0)],x_1=[t(1,1)>t(1,0)],\dots,x_{n-1}=[t(n-1,1)>t(n-1,0)]
> $$
> satisfies $\forall i\in\{0,1,\dots,m-1\},x_{u_i}=a_i\lor x_{v_i}=b_i$.
>
> > [!note]- Proof
> >
> > $$
> > \begin{align}
> > \langle u_i,1-a_i\rangle\leadsto_G\langle v_i,b_i\rangle\land\langle v_i,1-b_i\rangle\leadsto_G\langle u_i,a_i\rangle&\implies t(u_i,1-a_i)\le t(v_i,b_i)\land t(v_i,1-b_i)\le t(u_i,a_i)\\
> > &\implies t(u_i,a_i)>t(u_i,1-a_i)\lor t(v_i,b_i)>t(v_i,1-b_i)\\
> > &\iff x_{u_i}=a_i\lor x_{v_i}=b_i
> > \end{align}
> > $$

1. Apply an appropriate strongly-connected-component-finding algorithm (e.g., [[Tarjan's Strongly Connected Components Algorithm]], [[Kosaraju's Algorithm]]) to find the strongly connected components of $G$ and apply [[Kahn's Algorithm]] to find a topological sort of the strongly connected components by their reachability.
2. Apply the lemma to check if there exists a solution and apply the lemma to find one if there exists.

This algorithm solves the problem in $\mathcal{O}(n+m)$ time and $\mathcal{O}(n+m)$ space.

```c++
std::optional<std::vector<bool>> aspvall_plass_tarjan(int n, int m, const std::vector<int> &u, const std::vector<bool> &a, const std::vector<int> &v, const std::vector<bool> &b) {
	std::vector<int> s(2 * m), t(2 * m);
	for (int i = 0; i < m; i++) {
		s[2 * i] = u[i] << 1 | !a[i], t[2 * i] = v[i] << 1 | b[i];
		s[2 * i + 1] = v[i] << 1 | !b[i], t[2 * i + 1] = u[i] << 1 | a[i];
	}

	auto scc = tarjan_scc(2 * n, 2 * m, s, t);

	std::vector<int> topo(2 * n);
	for (int i = 0; i < int(scc.size()); i++) {
		for (int j : scc[i]) {
			topo[j] = scc.size() - i - 1;
		}
	}
	if (std::ranges::any_of(std::views::iota(0, n), [&](int i) -> bool {
		return topo[i << 1 | true] == topo[i << 1 | false];
	})) {
		return std::nullopt;
	}

	return std::ranges::to<std::vector>(std::views::iota(0, n) | std::views::transform([&](int i) -> bool {
		return topo[i << 1 | true] > topo[i << 1 | false];
	}));
}
```

