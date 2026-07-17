---
tags: [Computer Science]
---

The [[Binary Heap]] is a data structure that maintains a multiset $S$ of numbers by maintaining a complete binary tree.

Specifically, in the complete binary tree, each node stores an element of $S$. The complete binary tree satisfies that the element in each node is less than or equal to the element in its parent.

This requires $\mathcal{O}(|S|)$ space.

## Push

[[Binary Heap#Push]] updates $S$ to $S\cup\{x\}$ in $\mathcal{O}(\log|S|)$ time and $\mathcal{O}(1)$ space.

### Algorithm

0. Make a new node that stores $x$.

1. Maintain the order by swapping elements.

This algorithm solves the problem in $\mathcal{O}(\log|S|)$ time and $\mathcal{O}(1)$ space.

~~~c++
void push(int x) {
	a.push_back(x);
	for (int i = a.size() - 1; i > 1 && a[i >> 1] < a[i]; i >>= 1) {
		std::swap(a[i >> 1], a[i]);
	}
}
~~~

## Top

[[Binary Heap#Top]] finds $\max S$ in $\mathcal{O}(1)$ time and $\mathcal{O}(1)$ space.

### Algorithm

Since the element in each node is less than or equal to the element in its parent, the element in the root is $\max S$.

Accessing the element in the root yields an algorithm that solves the problem in $\mathcal{O}(1)$ time and $\mathcal{O}(1)$ space.

~~~c++
int top() {
	return a[1];
}
~~~

## Pop

[[Binary Heap#Pop]] updates $S$ to $S\setminus\{\max S\}$ in $\mathcal{O}(\log|S|)$ time and $\mathcal{O}(1)$ space.

### Algorithm

0. Swap the element in the root and the element in the last node.

1. Delete the last node.
2. Maintain the order by swapping elements.

This algorithm solves the problem in $\mathcal{O}(\log|S|)$ time and $\mathcal{O}(1)$ space.

~~~c++
void pop() {
	std::swap(a[1], a.back());
	a.pop_back();
	for (int i = 1, j; i << 1 < int(a.size()); i = j) {
		j = i << 1 | ((i << 1 | 1) < int(a.size()) && a[i << 1 | 1] > a[i << 1]);
		if (a[i] < a[j]) {
			std::swap(a[i], a[j]);
		} else {
			break;
		}
	}
}
~~~

