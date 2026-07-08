---
tags: [Computer Science]
---

[[Treap]] is a data structure that maintains an array of $n$ numbers $a_0,a_1,\dots,a_{n-1}$ by maintaining a binary tree.

Specifically, a random priority $w_i$ is generated for each $a_i$. In the binary tree, each node stores a pair $(a_i,w_i)$. The binary tree satisfies that the in-order traversal order of the nodes matches their order in the array, and the priority of each node is lower than the priority of its parent. In other words, the binary tree is a **Cartesian Tree** with respect to $w_0,w_1,\dots,w_{n-1}$.

This costs of space of $\mathcal{O}(n)$.

> [!info] Lemma
>
> Let $\operatorname{dep}(i)$ denote the depth of the $i$-th node in the binary tree, then
> $$
> \forall i\in\{0,1,\dots,n-1\},\mathbb{E}[\operatorname{dep}(i)]\in\mathcal{O}(\log n)
> $$
>
> > [!note]- Proof
> >
> > Let $A_{i,j}$ be $1$ if $j$ is an ancestor of $i$ (excluding $i$ itself), and $0$ otherwise, then
> > $$
> > \begin{align}
> > \forall i\in\{0,1,\dots,n-1\},\mathbb{E}[\operatorname{dep}(i)]&=\mathbb{E}\left[\sum_{j=0}^{n-1}A_{i,j}\right]\\
> > &=\sum_{j=0}^{n-1}\mathbb{E}[A_{i,j}]\\
> > &=\sum_{j=0}^{n-1}\Pr[A_{i,j}=1]
> > \end{align}
> > $$
> > If $j<i$, since $j$ is an ancestor of $i$ iff
> > $$
> > w_j=\max_{k=j}^iw_k
> > $$
> > it follows that
> > $$
> > \begin{align}
> > \Pr[A_{i,j}=1]&=\Pr\left[w_j=\max_{k=j}^iw_k\right]\\
> > &=\frac{1}{i-j+1}
> > \end{align}
> > $$
> > Symmetrically, it is easy to prove that, if $j>i$,
> > $$
> > \Pr[A_{i,j}=1]=\frac{1}{j-i+1}
> > $$
> > Therefore,
> > $$
> > \begin{align}
> > \mathbb{E}[\operatorname{dep}(i)]&=\sum_{j=0}^{i-1}\frac{1}{i-j+1}+\sum_{j=i+1}^{n-1}\frac{1}{j-i+1}\\
> > &=H_{i+1}-1+H_{n-i}-1\\
> > &\in\mathcal{O}(\log n)
> > \end{align}
> > $$



## Split

[[Treap#Split]] splits a [[Treap]] of $(a_0,w_0),(a_1,w_1),\dots,(a_{n-1},w_{n-1})$ into two [[Treap|Treaps]] of $(a_0,w_0),(a_1,w_1),\dots,(a_{k-1},w_{k-1})$ and $(a_k,w_k),(a_{k+1},w_{k+1}),\dots,(a_{n-1},w_{n-1})$, respectively, in expected $\mathcal{O}(\log n)$ time and expected $\mathcal{O}(\log n)$ space.

### Algorithm

- If the size of the left sub-[[Treap]] of the root is greater than or equal to $k$, the whole right sub-[[Treap]] should be in the second [[Treap]]. Split the left sub-[[Treap]] recursively.

- Otherwise, the whole left sub-[[Treap]] should be in the first [[Treap]]. Split the right sub-[[Treap]] recursively.

This algorithm solves the problem in expected $\mathcal{O}(\log n)$ time and expected $\mathcal{O}(\log n)$ space.

```c++
std::pair<Node *, Node *> split(Node *o, int k) {
	return y_combinator([&](auto &&self, Node *o, int k) -> std::pair<Node *, Node *> {
		if (!o) {
			return {nullptr, nullptr};
		}

		if (k <= size(o->lch)) {
			auto [x, y] = self(o->lch, k);
			o->lch = y;
			o->siz = size(o->lch) + 1 + size(o->rch);
			return {x, o};
		} else {
			auto [x, y] = self(o->rch, k - size(o->lch) - 1);
			o->rch = x;
			o->siz = size(o->lch) + 1 + size(o->rch);
			return {o, y};
		}
	})(o, k);
}
```

## Merge

[[Treap#Merge]] merges two [[Treap|Treaps]] of $(a_0,w_0),(a_1,w_1),\dots,(a_{k-1},w_{k-1})$ and $(a_k,w_k),(a_{k+1},w_{k+1}),\dots,(a_{n-1},w_{n-1})$, respectively, into a single [[Treap]] of $(a_0,w_0),(a_1,w_1),\dots,(a_{n-1},w_{n-1})$ in expected $\mathcal{O}(\log n)$ time and expected $\mathcal{O}(\log n)$ space.

### Algorithm

Let $x$ be the root of the first [[Treap]], $y$ be the root of the second [[Treap]].

- If the priority of $x$ is higher than the priority of $y$, $x$ should be the root of the merged [[Treap]]. Merge the right sub-[[Treap]] of $x$ with the second [[Treap]] recursively.
- Otherwise, $y$ should be the root of the merged [[Treap]]. Merge the first [[Treap]] with the left sub-[[Treap]] of $y$ recursively.

This algorithm solves the problem in expected $\mathcal{O}(\log n)$ time and expected $\mathcal{O}(\log n)$ space.

```c++
Node *merge(Node *x, Node *y) {
	return y_combinator([&](auto &&self, Node *x, Node *y) -> Node * {
		if (!x) {
			return y;
		}
		if (!y) {
			return x;
		}

		if (x->prio > y->prio) {
			x->rch = self(x->rch, y);
			x->siz = size(x->lch) + 1 + size(x->rch);
			return x;
		} else {
			y->lch = self(x, y->lch);
			y->siz = size(y->lch) + 1 + size(y->rch);
			return y;
		}
	})(x, y);
}
```