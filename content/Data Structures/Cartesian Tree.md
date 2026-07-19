---
tags: [Computer Science]
---

The [[Cartesian Tree]] is a data structure that maintains an array of $n$ numbers $a_0,a_1,\dots,a_{n-1}$ by maintaining a binary tree.

Specifically, in the binary tree, each node stores an element in $a_0,a_1,\dots,a_{n-1}$. The binary tree satisfies that the in-order traversal order of the nodes matches their order in the array, and the element in each node is less than or equal to the element in its parent.

This requires $\mathcal{O}(n)$ space.

## Build

[[Cartesian Tree#Build]] builds a [[Cartesian Tree]] for $a_0,a_1,\dots,a_{n-1}$ in $\mathcal{O}(n)$ time and $\mathcal{O}(n)$ space.

### Algorithm

0. Build a [[Cartesian Tree]] for $a_0,a_1,\dots,a_{n-2}$ recursively, and let $r_0,r_1,\dots,r_{m-1}$ denote the right spine of the [[Cartesian Tree]], from the root to the bottom.
1. Let $i$ be the integer in $\{0,1,\dots,m\}$ such that $(\forall j\in\{0,1,\dots,i-1\},a_{r_j}\ge a_{n-1})\land(\forall j\in\{i,i+1,\dots,m-1\},a_{r_j}<a_{n-1})$. Cut the edge between node $r_{i-1}$ and node $r_i$, and let node $n-1$ be the new right child of node $r_{i-1}$, node $r_i$ be the new left child of node $n-1$.

Using a stack to maintain the right spine yields an algorithm that solves the problem in $\mathcal{O}(n)$ time and $\mathcal{O}(n)$ space.

```c++
void build(int n, const std::vector<int> &a) {
	lch.assign(n, -1), rch.assign(n, -1);
	std::vector<int> stk;

	for (int i = 0; i < n; i++) {
		while (!stk.empty() && a[stk.back()] < a[i]) {
			rch[stk.back()] = std::exchange(lch[i], stk.back());
			stk.pop_back();
		}
		stk.push_back(i);
	}
	while (stk.size() > 1) {
		int i = stk.back();
		stk.pop_back();

		rch[stk.back()] = i;
	}
	root = stk[0];
}
```
