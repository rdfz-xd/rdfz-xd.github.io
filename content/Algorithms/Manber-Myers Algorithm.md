---
tags: [Computer Science, Computer Science/String Theory]
---

The [[Manber-Myers Algorithm]] is an algorithm that finds the lexicographical order of the suffixes of a string $s$ of length $n$ in $\mathcal{O}(n\log n)$ time and $\mathcal{O}(n)$ space.

> [!tip]
>
> This problem can also be solved by [[Selection Sort]] in $\mathcal{O}(n^3)$ time and $\mathcal{O}(n)$ space.

> [!tip]
>
> This problem can also be solved by [[Insertion Sort]] in $\mathcal{O}(n^2\log n)$ time and $\mathcal{O}(n)$ space.

> [!tip]
>
> This problem can also be solved by [[Bubble Sort]] in $\mathcal{O}(n^3)$ time and $\mathcal{O}(n)$ space.

> [!tip]
>
> This problem can also be solved by [[Merge Sort]] in $\mathcal{O}(n^2\log n)$ time and $\mathcal{O}(n)$ space.

> [!tip]
>
> This problem can also be solved by [[Heapsort]] in $\mathcal{O}(n^2\log n)$ time and $\mathcal{O}(n)$ space.

> [!tip]
>
> This problem can also be solved by [[Quicksort]] in $\mathcal{O}(n^2\log n)$ time and $\mathcal{O}(n)$ space.

### Algorithm

0. Apply an appropriate sorting algorithm (e.g., [[Merge Sort]], [[Heapsort]], [[Quicksort]]) to find the lexicographical order of $s_0,s_1,\dots,s_{n-1}$.
1. For $k=2^0,2^1,\dots,2^{\lceil\log_2n\rceil-1}$, let $t_i=s_is_{i+1}\dots s_{\min\{i+k,n\}-1}$. Apply [[Radix Sort]] to find the lexicographical order of $t_0t_k,t_1t_{1+k},\dots,t_{n-1}t_{n-1+k}$ by taking the lexicographical order of $t_i$ as the primary key and the lexicographical order of $t_{i+k}$ as the secondary key.

This algorithm solves the problem in $\mathcal{O}(n\log n)$ time and $\mathcal{O}(n)$ space.

```c++
std::vector<int> manber_myers(int n, const std::string &s) {
	std::vector<int> sa(n);
	std::iota(sa.begin(), sa.end(), 0);
	std::ranges::sort(sa, {}, [&](int i) -> char {
		return s[i];
	});

	std::vector<int> rk(n);
	rk[sa[0]] = 0;
	for (int i = 1; i < n; i++) {
		rk[sa[i]] = rk[sa[i - 1]] + (s[sa[i]] != s[sa[i - 1]]);
	}

	for (int k = 1; k < n; k *= 2) {
		std::vector<int> o(k);
		std::iota(o.begin(), o.end(), n - k);
		for (int i : sa) {
			if (i >= k) {
				o.push_back(i - k);
			}
		}

		std::vector cnt(rk[sa[n - 1]] + 1, 0);
		for (int i = 0; i < n; i++) {
			cnt[rk[i]]++;
		}
		std::exclusive_scan(cnt.begin(), cnt.end(), cnt.begin(), 0);
		for (int i : o) {
			sa[cnt[rk[i]]++] = i;
		}

		std::vector<int> nrk(n);
		nrk[sa[0]] = 0;
		for (int i = 1; i < n; i++) {
			nrk[sa[i]] = nrk[sa[i - 1]] + (rk[sa[i]] != rk[sa[i - 1]] || sa[i - 1] + k == n || rk[sa[i] + k] != rk[sa[i - 1] + k]);
		}
		std::swap(rk, nrk);
	}

	return sa;
}
```
