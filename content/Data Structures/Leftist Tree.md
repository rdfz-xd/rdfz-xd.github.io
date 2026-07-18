---
tags: [Computer Science]
---

The [[Leftist Tree]] is a data structure that maintains a multiset $S$ of numbers by maintaining a binary tree.

Specifically, in the binary tree, each node stores an element of $S$. The binary tree satisfies that the element in each node is less than or equal to the element in its parent.

In addition, let $d(x)$ denote the minimum number of steps required to reach an empty node, starting from node $x$ and walking down the binary tree. $d(x)$ is also maintained for each node $x$.

This requires $\mathcal{O}(|S|)$ space.

> [!info] Lemma
>
> Let $x$ denote the root of the binary tree, then
> $$
> d(x)\in\mathcal{O}(\log|S|)
> $$
>
> > [!note]- Proof
> >
> > > [!info] Lemma
> > >
> > > Let $f(n)$ denote the minimum size of a binary tree where the $d$ of the root is $n$, then
> > > $$
> > > \forall n\in\N,f(n)=2^n-1
> > > $$
> > >
> > > > [!note]- Proof
> > > >
> > > > For each $n$ in $\Z_+$, if $f(n-1)=2^{n-1}-1$,
> > > > $$
> > > > \begin{align}
> > > > f(n)&=1+f(n-1)+\min_{m=n-1}^\infty f(m)\\
> > > > &=1+2f(n-1)\\
> > > > &=2^n-1
> > > > \end{align}
> > > > $$
> > > > By induction, it follows that
> > > > $$
> > > > \forall n\in\N,f(n)=2^n-1
> > > > $$
> >
> > Applying the lemma yields
> > $$
> > |S|\ge2^{d(x)}-1
> > $$
> >
> > $$
> > \begin{align}
> > |S|\ge2^{d(x)}-1&\iff d(x)\le\log_2(|S|+1)\\
> > &\implies d(x)\in\mathcal{O}(\log|S|)
> > \end{align}
> > $$

## Merge

[[Leftist Tree#Merge]] merges two [[Leftist Tree|Leftist Trees]] of $S$ and $T$, respectively, into a single [[Leftist Tree]] of $S\cup T$ in $\mathcal{O}(\log|S|+\log|T|)$ time and $\mathcal{O}(\log|S|+\log|T|)$ space.

### Algorithm

Wlog, assume $\max S\ge\max T$.

Let $x$ denote the root of the first [[Leftist Tree]], $l$ and $r$ denote the left child and the right child of $x$, respectively.

- If $d(l)<d(r)$, merge the left sub-[[Leftist-Tree]] of $x$ with the second [[Leftist Tree]] recursively.
- Otherwise, merge the right sub-[[Leftist-Tree]] of $x$ with the second [[Leftist Tree]] recursively.

This algorithm solves the problem in $\mathcal{O}(\log|S|+\log|T|)$ time and $\mathcal{O}(\log|S|+\log|T|)$ space.

```c++
Node *merge(Node *x, Node *y) {
	return y_combinator([&](auto &&self, Node *x, Node *y) -> Node * {
		if (!x) {
			return y;
		}
		if (!y) {
			return x;
		}

		if (x->val < y->val) {
			std::swap(x, y);
		}

		auto &z = (x->lch ? x->lch->d : 0) < (x->rch ? x->rch->d : 0) ? x->lch : x->rch;
		z = self(z, y);
		x->d = std::min(x->lch ? x->lch->d : 0, x->rch ? x->rch->d : 0) + 1;
		return x;
	})(x, y);
}
```