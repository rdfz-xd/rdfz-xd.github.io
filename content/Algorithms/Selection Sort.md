---
tags: [Computer Science]
---

[[Selection Sort]] is an algorithm that sorts an array of $n$ numbers $a_0,a_1,\dots,a_{n-1}$ in non-decreasing order in $\mathcal{O}(n^2)$ time and $\mathcal{O}(1)$ space.

>  [!tip] Hint
>
> This problem can also be solved by [[Insertion Sort]] in $\mathcal{O}(n^2)$ time and $\mathcal{O}(1)$ space.

> [!tip] Hint
>
> This problem can also be solved by [[Bubble Sort]] in $\mathcal{O}(n^2)$ time and $\mathcal{O}(1)$ space.

> [!tip] Hint
>
> This problem can also be solved by [[Merge Sort]] in $\mathcal{O}(n\log n)$ time and $\mathcal{O}(n)$ space.

> [!tip] Hint
>
> This problem can also be solved by [[Heapsort]] in $\mathcal{O}(n\log n)$ time and $\mathcal{O}(1)$ space.

### Algorithm

0. Find the minimum element $a_i$ among $a_0,a_1,\dots,a_{n-1}$.
1. Swap $a_0$ and $a_i$, and sort $a_1,a_2,\dots,a_{n-1}$ recursively.

This algorithm solves the problem in $\mathcal{O}(n^2)$ time and $\mathcal{O}(1)$ space.

```c++
void selection_sort(int n, std::vector<int> &a) {
	for (int i = 0; i < n - 1; i++) {
		std::swap(a[i], *std::ranges::min_element(a | std::views::drop(i)));
	}
}
```