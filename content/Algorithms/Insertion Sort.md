---
tags: [Computer Science]
---

[[Insertion Sort]] is an algorithm that sorts a sequence of $n$ numbers $a_0,a_1,\dots,a_{n-1}$ in non-decreasing order in $\mathcal{O}(n^2)$ time and $\mathcal{O}(1)$ space.

> [!tip]
>
> This problem can also be solved by [[Selection Sort]] in $\mathcal{O}(n^2)$ time and $\mathcal{O}(1)$ space.

> [!tip]
>
> This problem can also be solved by [[Bubble Sort]] in $\mathcal{O}(n^2)$ time and $\mathcal{O}(1)$ space.

> [!tip]
>
> This problem can also be solved by [[Merge Sort]] in $\mathcal{O}(n\log n)$ time and $\mathcal{O}(n)$ space.

> [!tip]
>
> This problem can also be solved by [[Heapsort]] in $\mathcal{O}(n\log n)$ time and $\mathcal{O}(1)$ space.

> [!tip]
>
> This problem can also be solved by [[Quicksort]] in $\mathcal{O}(n\log n)$ time and $\mathcal{O}(\log n)$ space.

> [!tip]
>
> This problem can also be solved by the [[Manber-Myers Algorithm]] in $\mathcal{O}(n\log n)$ time and $\mathcal{O}(n)$ space.

### Algorithm 0

0. Sort $a_0,a_1,\dots,a_{n-2}$ recursively.
1. Let $i$ be the integer in $\{0,1,\dots,n-1\}$ such that $(\forall j\in\{0,1,\dots,i-1\},a_j<a_{n-1})\land(\forall j\in\{i,i+1,\dots,n-2\},a_j\ge a_{n-1})$, then $a_0,a_1,\dots,a_{i-1},a_{n-1},a_i,a_{i+1},\dots,a_{n-2}$ is the result of sorting $a_0,a_1,\dots,a_{n-1}$.

This algorithm solves the problem in $\mathcal{O}(n^2)$ time and $\mathcal{O}(1)$ space.

```c++
void insertion_sort(int n, std::vector<int> &a) {
	for (int i = 1; i < n; i++) {
		for (int j = i; j > 0 && a[j - 1] > a[j]; j--) {
			std::swap(a[j - 1], a[j]);
		}
	}
}
```

### Algorithm 1

Based on [[Insertion Sort#Algorithm 0]], applying [[Binary Search]] to find $i$ yields an algorithm that solves the problem in $\mathcal{O}(n^2)$ time and $\mathcal{O}(1)$ space.

```c++
void insertion_sort(int n, std::vector<int> &a) {
	for (int i = 1; i < n; i++) {
		std::rotate(std::ranges::lower_bound(a | std::views::take(i), a[i]), a.begin() + i, a.begin() + i + 1);
	}
}
```
