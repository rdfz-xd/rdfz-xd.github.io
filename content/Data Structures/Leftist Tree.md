---
tags: [Computer Science]
---

The [[Leftist Tree]] is a data structure that maintains a multiset $S$ of numbers by maintaining a binary tree.

Specifically, in the binary tree, each node stores an element of $S$. The binary tree satisfies that the element in each node is less than or equal to the element in its parent.

Let $d(x)$ denote the minimum number of steps required to reach an empty node, starting from node $x$ and walking down the binary tree. The binary tree satisfies that, for each node, the $d$ of its left child is greater than or equal to the $d$ of its right child.

This requires $\mathcal{O}(|S|)$ space.

> [!info] Lemma
>
> Let $r$ denote the root of the binary tree, then
> $$
> d(r)\in\mathcal{O}(\log|S|)
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
> > |S|\ge2^{d(r)}-1
> > $$
> >
> > $$
> > \begin{align}
> > |S|\ge2^{d(r)}-1&\iff d(r)\le\log_2(|S|+1)\\
> > &\implies d(r)\in\mathcal{O}(\log|S|)
> > \end{align}
> > $$

## Merge

[[Leftist Tree#Merge]] merges two [[Leftist Tree|Leftist Trees]] of $S$ and $T$, respectively, into a single [[Leftist Tree]] of $S\cup T$ in $\mathcal{O}(\log|S|+\log|T|)$ time and $\mathcal{O}(\log|S|+\log|T|)$ space.

### Algorithm

Let $r$ be the root of the [[Leftist Tree]] with the greater maximum value.

0. Merge the right sub-[[Leftist-Tree]] of $r$ with the other [[Leftist Tree]] recursively.
1. If the $d$ of the right child of $r$ exceeds the $d$ of the left child, swap the left child and the right child.

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
		x->rch = self(x->rch, y);
		if ((x->lch ? x->lch->d : 0) < (x->rch ? x->rch->d : 0)) {
			std::swap(x->lch, x->rch);
		}
		x->d = (x->rch ? x->rch->d : 0) + 1;
		return x;
	})(x, y);
}
```