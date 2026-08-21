---
tags: [Computer Science]
---

The [[Basis]] is a data structure that maintains a set $S\subseteq\R^n$ by maintaining a set $B$ such that
$$
\operatorname{span}B=\operatorname{span}S\land\forall\mathbf{u},\mathbf{v}\in B,\mathbf{u}\ne\mathbf{v}\Rightarrow f(\mathbf{u})\ne f(\mathbf{v})
$$
where $f(\mathbf{x})=\min\{i:i\in\{0,1,\dots,n-1\}\land\mathbf{x}_i\ne0\}$.

This requires $\mathcal{O}(n^2)$ space.

## Add

[[Basis#Add]] updates $S$ to $S\cup\{\mathbf{x}\}$ in $\mathcal{O}(n^2)$ time and $\mathcal{O}(n)$ space.

### Algorithm

- If $\nexists\mathbf{b}\in B,f(\mathbf{b})=f(\mathbf{x})$, it is easy to prove that $B'=B\cup\{\mathbf{x}\}$ is a set such that $\operatorname{span}B'=\operatorname{span}(S\cup\{\mathbf{x}\})\land\forall\mathbf{u},\mathbf{v}\in B,\mathbf{u}\ne\mathbf{v}\Rightarrow f(\mathbf{u})\ne f(\mathbf{v})$.
- Otherwise, let $i=f(\mathbf{x})$, then it is easy to prove that $\operatorname{span}(S\cup\{\mathbf{x}\})=\operatorname{span}\left(S\cup\left\{\mathbf{x}-\frac{\mathbf{x}_i}{\mathbf{b}_i}\mathbf{b}\right\}\right)$. Update $S$ to $S\cup\left\{\mathbf{x}-\frac{\mathbf{x}_i}{\mathbf{b}_i}\mathbf{b}\right\}$ recursively.

This algorithm solves the problem in $\mathcal{O}(n^2)$ time and $\mathcal{O}(n)$ space.

```c++
void add(std::vector<double> x) {
	for (int i = 0; i < n; i++) {
		if (x[i] == 0) {
			continue;
		}

		if (!b[i]) {
			b[i] = x;
			break;
		}

		double d = x[i] / (*b[i])[i];
		for (int j = 0; j < n; j++) {
			x[j] -= d * (*b[i])[j];
		}
	}
}
```

## Find

[[Basis#Find]] checks if $\mathbf{x}\in\operatorname{span}S$ in $\mathcal{O}(n^2)$ time and $\mathcal{O}(n)$ space.

### Algorithm

> [!info] Lemma
> $$
> \mathbf{x}\in\operatorname{span}S\iff\mathbf{x}\in\operatorname{span}B
> $$

- If $\nexists\mathbf{b}\in B,f(\mathbf{b})=f(\mathbf{x})$, it is easy to prove that $\mathbf{x}\notin\operatorname{span}B$.
- Otherwise, let $i=f(\mathbf{x})$, then it is easy to prove that $\mathbf{x}\in\operatorname{span}B\iff\mathbf{x}-\frac{\mathbf{x}_i}{\mathbf{b}_i}\mathbf{b}\in\operatorname{span}B$. Check if $\mathbf{x}-\frac{\mathbf{x}_i}{\mathbf{b}_i}\mathbf{b}\in\operatorname{span}B$ recursively.

This algorithm solves the problem in $\mathcal{O}(n^2)$ time and $\mathcal{O}(n)$ space.

```c++
bool find(std::vector<double> x) {
	for (int i = 0; i < n; i++) {
		if (x[i] == 0) {
			continue;
		}

		if (!b[i]) {
			return false;
		}

		double d = x[i] / (*b[i])[i];
		for (int j = 0; j < n; j++) {
			x[j] -= d * (*b[i])[j];
		}
	}
	return true;
}
```

