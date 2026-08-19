---
tags: [Computer Science]
---

Let
$$
\operatorname{span} S=\left\{\bigoplus_{x\in T}x:T\subseteq S\right\}
$$


The [[XOR Basis]] is a data structure that maintains a set $S\subseteq\{0,1,\dots,2^m-1\}$ by maintaining a set $B$ such that
$$
\operatorname{span}B=\operatorname{span}S\land\forall u,v\in B,u\ne v\Rightarrow\operatorname{msb}u\ne\operatorname{msb}v
$$
This requires $O(m)$ space.

## Add

[[XOR Basis#Add]] updates $S$ to $S\cup\{x\}$ in $\mathcal{O}(m)$ time and $\mathcal{O}(1)$ space.

### Algorithm

- If $\nexists b\in B,\operatorname{msb}b=\operatorname{msb}x$, it is easy to prove that $B'=B\cup\{x\}$ is a set such that $\operatorname{span}B'=\operatorname{span}(S\cup\{x\})\land\forall u,v\in B',u\ne v\Rightarrow\operatorname{msb}u\ne\operatorname{msb}v$.
- Otherwise, it is easy to prove that $\operatorname{span}(S\cup\{x\})=\operatorname{span}(S\cup\{x\oplus b\})$. Update $S$ to $S\cup\{x\oplus b\}$ recursively.

This algorithm solves the problem in $\mathcal{O}(m)$ time and $\mathcal{O}(1)$ space.

```c++
void add(int x) {
	for (int i = m - 1; i >= 0; i--) {
		if (x >> i & 1) {
			if (!b[i]) {
				b[i] = x;
			}
			x ^= b[i];
		}
	}
}
```

## Find

[[XOR Basis#Find]] checks if $x\in\operatorname{span}S$ in $\mathcal{O}(m)$ time and $\mathcal{O}(1)$ space.

### Algorithm

> [!info] Lemma
> $$
> x\in\operatorname{span} S\iff x\in\operatorname{span}B
> $$

- If $\nexists b\in B,\operatorname{msb}b=\operatorname{msb}x$, it is easy to prove that $x\notin\operatorname{span}B$.
- Otherwise, it is easy to prove that $x\in\operatorname{span}B\iff x\oplus b\in\operatorname{span}B$. Check if $x\oplus b\in\operatorname{span}B$ recursively.

This algorithm solves the problem in $\mathcal{O}(m)$ time and $\mathcal{O}(1)$ space.

```c++
bool find(int x) {
	for (int i = m - 1; i >= 0; i--) {
		if (x >> i & 1) {
			x ^= b[i];
		}
	}
	return !x;
}
```

