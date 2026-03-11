---
tags: [Computer Science]
---

A [[Binary Heap]] maintains a multiset $S$ of numbers by maintaining a complete binary tree where each vertex contains an element in $S$, and the element in each vertex is greater than or equal to the element in its parent, which costs a space of $\mathcal{O}(|S|)$.

## Push

[[Binary Heap#Push]] updates $S$ to $S\cup\{x\}$ in $\mathcal{O}(\log(|S|))$ time and $\mathcal{O}(1)$ space.

1. Make a new vertex that contains $x$.
2. Maintain the order by swapping elements.

This algorithm solves the problem in $\mathcal{O}(\log(|S|))$ time and $\mathcal{O}(1)$ space.

~~~c++
a.push_back(x);
for (int i = a.size() - 1; i > 1; i >>= 1) {
	if (a[i >> 1] > a[i]) {
		std::swap(a[i >> 1], a[i]);
	}
}
~~~

## Top

[[Binary Heap#Top]] finds $\min S$ in $\mathcal{O}(1)$ time and $\mathcal{O}(1)$ space.

Since the element in each vertex is greater than or equal to the element in its parent, it follows that the element in the root is $\min S$.

Finding the element in the root yields an algorithm that solves the problem in $\mathcal{O}(1)$ time and $\mathcal{O}(1)$ space.

~~~c++
return a[1];
~~~

## Pop

[[Binary Heap#Pop]] updates $S$ to $S\setminus\min S$ in $\mathcal{O}(\log(|S|))$ time and $\mathcal{O}(1)$ space.

1. Swap the element in the root with the element in the last vertex.
2. Delete the last vertex.
3. Maintain the order by swapping elements.

This algorithm solves the problem in $\mathcal{O}(\log(|S|))$ time and $\mathcal{O}(1)$ space.

~~~c++
std::swap(a[1], a.back());
a.pop_back();
for (int i = 1, j; i << 1 < int(a.size()); i = j) {
	j = (i << 1 | 1) >= int(a.size()) || a[i << 1] < a[i << 1 | 1] ? i << 1 : i << 1 | 1;
	if (a[i] <= a[j]) {
		break;
	}
	std::swap(a[i], a[j]);
}
~~~

