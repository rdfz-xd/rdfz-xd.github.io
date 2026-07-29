---
tags: [Computer Science]
---

[[Radix Sort]] is an algorithm that sorts an array of $n$ integers $a_0,a_1,\dots,a_{n-1}\in\{0,1,\dots,m^d-1\}$ in non-decreasing order in $\mathcal{O}(d(n+m))$ time and $\mathcal{O}(n+m)$ space.

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

> [!tip]
>
> This problem can also be solved by [[Counting Sort]] in $\mathcal{O}(n+m^d)$ time and $\mathcal{O}(m^d)$ space.

### Algorithm

> [!info] Lemma
> $$
> \forall x\in\{0,1,\dots,m^d-1\},x=\left\lfloor\frac{x}{m^{d-1}}\right\rfloor m^{d-1}+x\bmod m^{d-1}
> $$

0. Sort $a_0,a_1,\dots,a_{n-1}$ based on $a_i\bmod m^{d-1}$ recursively.
1. Apply [[Counting Sort]] to stably sort $a_0,a_1,\dots,a_{n-1}$ based on $\left\lfloor\frac{a_i}{m^{d-1}}\right\rfloor$.

This algorithm solves the problem in $\mathcal{O}(d(n+m))$ time and $\mathcal{O}(n+m)$ space.

```c++
void radix_sort(int n, int m, int d, std::vector<int> &a) {
	for (int i = 0, k = 1; i < d; i++, k *= m) {
		std::vector cnt(m, 0);
		for (int j = 0; j < n; j++) {
			cnt[a[j] / k % m]++;
		}
		std::exclusive_scan(cnt.begin(), cnt.end(), cnt.begin(), 0);

		std::vector<int> b(n);
		for (int j = 0; j < n; j++) {
			b[cnt[a[j] / k % m]++] = a[j];
		}
		std::swap(a, b);
	}
}
```
