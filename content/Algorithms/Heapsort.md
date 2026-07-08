---
tags: [Computer Science]
---

[[Heapsort]] is an algorithm that sorts an array of $n$ numbers $a_0,a_1,\dots,a_{n-1}$ in non-decreasing order in $\mathcal{O}(n\log n)$ time and $\mathcal{O}(1)$ space.

> [!tip] Hint
>
> This problem can also be solved by [[Selection Sort]] in $\mathcal{O}(n^2)$ time and $\mathcal{O}(1)$ space.

> [!tip] Hint
>
> This problem can also be solved by [[Insertion Sort]] in $\mathcal{O}(n^2)$ time and $\mathcal{O}(1)$ space.

> [!tip] Hint
>
> This problem can also be solved by [[Bubble Sort]] in $\mathcal{O}(n^2)$ time and $\mathcal{O}(1)$ space.

> [!tip] Hint
>
> This problem can also be solved by [[Merge Sort]] in $\mathcal{O}(n\log n)$ time and $\mathcal{O}(n)$ space.

### Algorithm 0

0. Let multiset $S=\{a_0,a_1,\dots,a_{n-1}\}$.
1. For $i=n-1,n-2,\dots,0$, set $a_i=\max S$, and update $S$ to $S\setminus\{\max S\}$.

Using a [[Binary Heap]] to maintain $S$ yields an algorithm that solves the problem in $\mathcal{O}(n\log n)$ time and $\mathcal{O}(n)$ space.

```c++
void heapsort(int n, std::vector<int> &a) {
	std::priority_queue q(a.begin(), a.end());
	for (int i = n - 1; i >= 0; i--) {
		a[i] = q.top();
		q.pop();
	}
}
```

### Algorithm 1

Based on [[Algorithm 0]], instead of building a [[Binary Heap]] explicitly, operating directly on the array yields an algorithm that solves the problem in $\mathcal{O}(n\log n)$ time and $\mathcal{O}(1)$ space.

```c++
void heapsort(int n, std::vector<int> &a) {
	auto b = a.begin() - 1;
	for (int i = n; i > 0; i--) {
		for (int j = i, k; j << 1 <= n; j = k) {
			k = j << 1 | ((j << 1 | 1) <= n && b[j << 1 | 1] > b[j << 1]);
			if (b[j] < b[k]) {
				std::swap(b[j], b[k]);
			} else {
				break;
			}
		}
	}
	for (int i = n; i > 1; i--) {
		std::swap(b[1], b[i]);
		for (int j = 1, k; j << 1 < i; j = k) {
			k = j << 1 | ((j << 1 | 1) < i && b[j << 1 | 1] > b[j << 1]);
			if (b[j] < b[k]) {
				std::swap(b[j], b[k]);
			} else {
				break;
			}
		}
	}
}
```

