---
tags: [Computer Science]
---

The [[Treap]] is a data structure that maintains an array of $n$ numbers $a_0,a_1,\dots,a_{n-1}$ by maintaining a randomized [[Cartesian Tree]].

Specifically, a random priority $w_i$ is generated independently and identically for each $a_i$. The [[Cartesian Tree]] is built based on $w_0,w_1,\dots,w_{n-1}$.

This requires $\mathcal{O}(n)$ space.

> [!info] Lemma
>
> Let $\operatorname{dep}(i)$ denote the depth of the $i$-th node in the [[Cartesian Tree]], then
> $$
> \forall i\in\{0,1,\dots,n-1\},\mathbb{E}[\operatorname{dep}(i)]\in\mathcal{O}(\log n)
> $$
>
> > [!note]- Proof
> >
> > Let $A_{i,j}$ be $1$ if $j$ is an ancestor of $i$, excluding $i$ itself, and $0$ otherwise, then
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

[[Treap#Split]] splits a [[Treap]] of $a_0,a_1,\dots,a_{n-1}$ into two [[Treap|Treaps]] of $a_0,a_1,\dots,a_{k-1}$ and $a_k,a_{k+1},\dots,a_{n-1}$, respectively, in **expected** $\mathcal{O}(\log n)$ time and **expected** $\mathcal{O}(\log n)$ space.

### Algorithm

- If $k$ is less than or equal the size of the left sub-[[Treap]] of the root, the root and the whole right sub-[[Treap]] should be in the second [[Treap]]. Split the left sub-[[Treap]] recursively.

- Otherwise, the root and the whole left sub-[[Treap]] should be in the first [[Treap]]. Split the right sub-[[Treap]] recursively.

This algorithm solves the problem in **expected** $\mathcal{O}(\log n)$ time and **expected** $\mathcal{O}(\log n)$ space.

```c++
std::pair<Node *, Node *> split(Node *o, int k) {
	return y_combinator([&](auto &&self, Node *o, int k) -> std::pair<Node *, Node *> {
		if (!o) {
			return {nullptr, nullptr};
		}

		if (k <= (o->lch ? o->lch->siz : 0)) {
			auto [x, y] = self(o->lch, k);
			o->lch = y;
			o->siz = 1 + (o->lch ? o->lch->siz : 0) + (o->rch ? o->rch->siz : 0);
			return {x, o};
		} else {
			auto [x, y] = self(o->rch, k - (o->lch ? o->lch->siz : 0) - 1);
			o->rch = x;
			o->siz = 1 + (o->lch ? o->lch->siz : 0) + (o->rch ? o->rch->siz : 0);
			return {o, y};
		}
	})(o, k);
}
```

## Merge

[[Treap#Merge]] merges two [[Treap|Treaps]] of $a_0,a_1,\dots,a_{k-1}$ and $a_k,a_{k+1},\dots,a_{n-1}$, respectively, into a single [[Treap]] of $a_0,a_1,\dots,a_{n-1}$ in **expected** $\mathcal{O}(\log n)$ time and **expected** $\mathcal{O}(\log n)$ space.

### Algorithm

Let $x$ denote the root of the first [[Treap]], $y$ denote the root of the second [[Treap]].

- If $w_x>w_y$, $x$ should be the root of the merged [[Treap]]. Merge the right sub-[[Treap]] of $x$ with the second [[Treap]] recursively.
- Otherwise, $y$ should be the root of the merged [[Treap]]. Merge the first [[Treap]] with the left sub-[[Treap]] of $y$ recursively.

This algorithm solves the problem in **expected** $\mathcal{O}(\log n)$ time and **expected** $\mathcal{O}(\log n)$ space.

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
			x->siz = 1 + (x->lch ? x->lch->siz : 0) + (x->rch ? x->rch->siz : 0);
			return x;
		} else {
			y->lch = self(x, y->lch);
			y->siz = 1 + (y->lch ? y->lch->siz : 0) + (y->rch ? y->rch->siz : 0);
			return y;
		}
	})(x, y);
}
```