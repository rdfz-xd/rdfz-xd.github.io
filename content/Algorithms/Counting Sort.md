---
tags: [Computer Science]
---

[[Counting Sort]] is an algorithm that sorts an array of $n$ integers $a_0,a_1,\dots,a_{n-1}\in\{0,1,\dots,m-1\}$ in non-decreasing order in $\mathcal{O}(n+m)$ time and $\mathcal{O}(m)$ space.

> [!tip]
>
> This problem can also be solved by [[Selection Sort]] in $\mathcal{O}(n^2)$ time and $\mathcal{O}(1)$ space.

> [!tip]
>
> This problem can also be solved by [[Insertion Sort]] in $\mathcal{O}(n^2)$ time and $\mathcal{O}(1)$ space.

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

### Algorithm

0. For each $i$ in $\{0,1,\dots,m-1\}$, find the number of occurrences $c_i$ of $i$ in $a_0,a_1,\dots,a_{n-1}$.
1. $\underbrace{0,0,\dots,0}_{c_0},\underbrace{1,1,\dots,1}_{c_1},\dots,\underbrace{m-1,m-1,\dots,m-1}_{c_{m-1}}$ is the result of sorting $a_0,a_1,\dots,a_{n-1}$.

This algorithm solves the problem in $\mathcal{O}(n+m)$ time and $\mathcal{O}(m)$ space.

```c++
void counting_sort(int n, int m, std::vector<int> &a) {
	std::vector cnt(m, 0);
	for (int i = 0; i < n; i++) {
		cnt[a[i]]++;
	}
	for (int i = 0, j = 0; i < m; i++) {
		while (cnt[i]--) {
			a[j++] = i;
		}
	}
}
```
