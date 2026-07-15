---
tags: [Computer Science]
---

[[Insertion Sort]] is an algorithm that sorts an array of $n$ numbers $a_0,a_1,\dots,a_{n-1}$ in non-decreasing order in $\mathcal{O}(n^2)$ time and $\mathcal{O}(1)$ space.

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
> This problem can also be solved by [[Quickselect]] in $\mathcal{O}(n^2)$ time and $\mathcal{O}(n)$ space.

### Algorithm 0

0. Sort $a_0,a_1,\dots,a_{n-2}$ recursively.
1. Insert $a_{n-1}$ into an appropriate position in $a_0,a_1,\dots,a_{n-2}$.

This algorithm solves the problem in $\mathcal{O}(n^2)$ time and $\mathcal{O}(1)$ space.

```c++
void insertion_sort(int n, std::vector<int> &a) {
	for (int i = 1; i < n; i++) {
		int x = a[i], j = i;
		for (; j > 0 && a[j - 1] > x; j--) {
			a[j] = a[j - 1];
		}
		a[j] = x;
	}
}
```

### Algorithm 1

Based on [[Insertion Sort#Algorithm 0]], applying [[Binary Search]] to find the appropriate position yields an algorithm that solves the problem in $\mathcal{O}(n^2)$ time and $\mathcal{O}(1)$ space.

```c++
void insertion_sort(int n, std::vector<int> &a) {
	for (int i = 1; i < n; i++) {
		std::rotate(std::ranges::lower_bound(a | std::views::take(i), a[i]), a.begin() + i, a.begin() + i + 1);
	}
}
```

