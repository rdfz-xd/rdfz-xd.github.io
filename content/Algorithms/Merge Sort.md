---
tags: [Computer Science]
---

[[Merge Sort]] is an algorithm that sorts an array of $n$ numbers $a_0,a_1,\dots,a_{n-1}$ in non-decreasing order in $\mathcal{O}(n\log n)$ time and $\mathcal{O}(n)$ space.

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
> This problem can also be solved by [[Heapsort]] in $\mathcal{O}(n\log n)$ time and $\mathcal{O}(1)$ space.

> [!tip]
>
> This problem can also be solved by [[Quicksort]] in **expected** $\mathcal{O}(n\log n)$ time and $\mathcal{O}(\log n)$ space.

### Algorithm

0. Let $m=\left\lfloor\frac{n}{2}\right\rfloor$. Sort $a_0,a_1,\dots,a_{m-1}$ and $a_m,a_{m+1},\dots,a_{n-1}$ recursively.

1. Sort $a_0,a_1,\dots,a_{n-1}$ in the following way:

   Consider finding the result of sorting $b_0,b_1,\dots,b_{n_b-1},c_0,c_1,\dots,c_{n_c-1}$, where $b_0\le b_1\le\dots\le b_{n_b-1}$ and $c_0\le c_1\le\dots\le c_{n_c-1}$.

   - If $b_0<c_0$, the minimum value among $b_0,b_1,\dots,b_{n_b-1},c_0,c_1,\dots,c_{n_c-1}$ must be $b_0$. Find the result of sorting $b_1,b_2,\dots,b_{n_b-1},c_0,c_1,\dots,c_{n_c-1}$ recursively. Let $d_0=b_0$, the result be $d_1,d_2,\dots,d_{n_b+n_c-1}$, then $d_0,d_1,\dots,d_{n_b+n_c-1}$ is the result of sorting $b_0,b_1,\dots,b_{n_b-1},c_0,c_1,\dots,c_{n_c-1}$.
   - Otherwise, the minimum value among $b_0,b_1,\dots,b_{n_b-1},c_0,c_1,\dots,c_{n_c-1}$ must be $c_0$. Find the result of sorting $b_0,b_1,\dots,b_{n_b-1},c_1,c_2,\dots,c_{n_c-1}$ recursively. Let $d_0=c_0$, the result be $d_1,d_2,\dots,d_{n_b+n_c-1}$, then $d_0,d_1,\dots,d_{n_b+n_c-1}$ is the result of sorting $b_0,b_1,\dots,b_{n_b-1},c_0,c_1,\dots,c_{n_c-1}$.

This algorithm solves the problem in $\mathcal{O}(n\log n)$ time and $\mathcal{O}(n)$ space.

```c++
void merge_sort(int n, std::vector<int> &a) {
	std::vector<int> tmp(n);
	y_combinator([&](auto &&self, std::vector<int>::iterator l, std::vector<int>::iterator r) -> void {
		if (l + 1 == r) {
			return;
		}

		auto mid = l + (r - l) / 2;
		self(l, mid), self(mid, r);

		auto i = l, j = mid, k = tmp.begin();
		while (i != mid && j != r) {
			*k++ = *i < *j ? *i++ : *j++;
		}
		for (; i != mid; i++) {
			*k++ = *i;
		}
		for (; j != r; j++) {
			*k++ = *j;
		}

		std::copy(tmp.begin(), k, l);
	})(a.begin(), a.end());
}
```

