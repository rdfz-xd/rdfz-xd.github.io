---
tags: [Computer Science]
---

[[Bubble Sort]] is an algorithm that sorts an array of $n$ numbers $a_0,a_1,\dots,a_{n-1}$ in non-decreasing order in $\mathcal{O}(n^2)$ time and $\mathcal{O}(1)$ space.

> [!tip]
>
> This problem can also be solved by [[Selection Sort]] in $\mathcal{O}(n^2)$ time and $\mathcal{O}(1)$ space.

> [!tip]
>
> This problem can also be solved by [[Insertion Sort]] in $\mathcal{O}(n^2)$ time and $\mathcal{O}(1)$ space.

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

Repeat this process until $a$ becomes sorted:

- For $i=1,2,\dots,n-1$, if $a_{i-1}>a_i$, swap $a_{i-1}$ and $a_i$.

This algorithm solves the problem in $\mathcal{O}(n^2)$ time and $\mathcal{O}(1)$ space.

```c++
void bubble_sort(int n, std::vector<int> &a) {
	while (!std::ranges::is_sorted(a)) {
		for (int i = 1; i < n; i++) {
			if (a[i - 1] > a[i]) {
				std::swap(a[i - 1], a[i]);
			}
		}
	}
}
```

> [!note]- Proof
>
> It is easy to prove that, after $k$ repetitions, $a_{n-k},a_{n-k+1},\dots,a_{n-1}$ becomes sorted.