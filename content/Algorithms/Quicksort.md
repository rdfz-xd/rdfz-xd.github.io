---
tags: [Computer Science]
---

[[Quicksort]] is an algorithm that sorts an array of $n$ numbers $a_0,a_1,\dots,a_{n-1}$ in non-decreasing order in $\mathcal{O}(n\log n)$ time and $\mathcal{O}(\log n)$ space.

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
> This problem can also be solved by [[Quickselect]] in $\mathcal{O}(n^2)$ time and $\mathcal{O}(n)$ space.

### Algorithm 0

0. Let $x$ be a number chosen uniformly at random from $a_0,a_1,\dots,a_{n-1}$.
1. Let $b_0,b_1,\dots,b_{n_b-1}$ be the numbers among $a_0,a_1,\dots,a_{n-1}$ that are less than $x$, $c_0,c_1,\dots,c_{n_c-1}$ be the numbers equal to $x$, $d_0,d_1,\dots,d_{n_d-1}$ be the numbers greater than $x$.
2. Sort $b_0,b_1,\dots,b_{n_b-1}$ and $d_0,d_1,\dots,d_{n_d-1}$ recursively.
3. $b_0,b_1,\dots,b_{n_b-1},c_0,c_1,\dots,c_{n_c-1},d_0,d_1,\dots,d_{n_d-1}$ is the result of sorting $a_0,a_1,\dots,a_{n-1}$.

This algorithm solves the problem in **expected** $\mathcal{O}(n\log n)$ time and $\mathcal{O}(n)$ space.

```c++
void quicksort(int n, std::vector<int> &a) {
	y_combinator([&](auto &&self, std::vector<int>::iterator l, std::vector<int>::iterator r) -> void {
		if (l == r) {
			return;
		}

		int x = l[std::uniform_int_distribution<>(0, r - l - 1)(rng)];

		auto s = l, t = r;
		for (auto i = s; i != t; ) {
			if (*i < x) {
				std::swap(*i++, *s++);
			} else if (*i > x) {
				std::swap(*i, *--t);
			} else {
				i++;
			}
		}
		self(l, s), self(t, r);
	})(a.begin(), a.end());
}
```

> [!note]- Proof
>
> > [!info] Lemma
> >
> > If $a_0,a_1,\dots,a_{n-1}$ are pairwise distinct, let $X$ be the number of comparisons performed between distinct elements, then
> > $$
> > \mathbb{E}[X]\in\mathcal{O}(n\log n)
> > $$
> >
> > > [!note]- Proof
> > >
> > > Let $v_i$ denote the $i$-th smallest element among $a_0,a_1,\dots,a_{n-1}$, $X_{i,j}$ denote the number of comparisons performed between $v_i$ and $v_j$. Then
> > > $$
> > > \begin{align}
> > > \mathbb{E}[X]&=\mathbb{E}\left[\sum_{i=0}^{n-1}\sum_{j=i+1}^{n-1}X_{i,j}\right]\\
> > > &=\sum_{i=0}^{n-1}\sum_{j=i+1}^{n-1}\mathbb{E}[X_{i,j}]\\
> > > &=\sum_{i=0}^{n-1}\sum_{j=i+1}^{n-1}\Pr[X_{i,j}=1]
> > > \end{align}
> > > $$
> > > Since it is easy to prove that $X_{i,j}=1$ iff, when $v_i$ and $v_j$ are separated, the chosen element is $v_i$ or $v_j$, it follows that
> > > $$
> > > \Pr[X_{i,j}=1]=\frac{2}{j-i+1}
> > > $$
> > > Therefore,
> > > $$
> > > \begin{align}
> > > \mathbb{E}[X]&=\sum_{i=0}^{n-1}\sum_{j=i+1}^{n-1}\frac{2}{j-i+1}\\
> > > &=2\sum_{i=0}^{n-1}(H_{n-i}-1)\\
> > > &\le2nH_n\\
> > > &\in\mathcal{O}(n\log n)
> > > \end{align}
> > > $$
>
> Let $X$ be the number of comparisons performed between distinct elements when running on $a_0,a_1,\dots,a_{n-1}$, $X'$ be the number when running on $(a_0,0),(a_1,1),\dots,(a_{n-1},n-1)$, then, it is easy to prove that
> $$
> \begin{align}
> \mathbb{E}[X]&\le\mathbb{E}[X']\\
> &\in\mathcal{O}(n\log n)
> \end{align}
> $$

### Algorithm 1

Based on [[Quicksort#Algorithm 0]], instead of sorting both subarrays recursively, sorting the shorter one recursively and the longer one iteratively yields an algorithm that solves the problem in **expected** $\mathcal{O}(n\log n)$ time and $\mathcal{O}(\log n)$ space.

```c++
void quicksort(int n, std::vector<int> &a) {
	y_combinator([&](auto &&self, std::vector<int>::iterator l, std::vector<int>::iterator r) -> void {
		while (l != r) {
			int x = l[std::uniform_int_distribution<>(0, r - l - 1)(rng)];

			auto s = l, t = r;
			for (auto i = s; i != t; ) {
				if (*i < x) {
					std::swap(*i++, *s++);
				} else if (*i > x) {
					std::swap(*i, *--t);
				} else {
					i++;
				}
			}

			if (s - l < r - t) {
				self(l, s);
				l = t;
			} else {
				self(t, r);
				r = s;
			}
		}
	})(a.begin(), a.end());
}
```

### Algorithm 2

Based on [[Quicksort#Algorithm 0]], instead of choosing $x$ at random, determine $x$ in the following way:

- Apply [[Quickselect]] to find the median of $a_0,a_1,\dots,a_{n-1}$, and set $x$ to this median.

This algorithm solves the problem in $\mathcal{O}(n\log n)$ time and $\mathcal{O}(\log n)$ space.

```c++
void quicksort(int n, std::vector<int> &a) {
	auto quickselect = y_combinator([&](auto &&self, std::vector<int>::iterator l, std::vector<int>::iterator r, int k) -> int {
		while (r - l >= 5) {
			for (int i = 0; i < (r - l) / 5; i++) {
				std::sort(l + 5 * i, l + 5 * (i + 1));
				std::swap(l[i], l[5 * i + 2]);
			}

			int x = self(l, l + (r - l) / 5, (r - l) / 10);

			auto s = l, t = r;
			for (auto i = s; i != t; ) {
				if (*i < x) {
					std::swap(*i++, *s++);
				} else if (*i > x) {
					std::swap(*i, *--t);
				} else {
					i++;
				}
			}

			if (k < s - l) {
				r = s;
			} else if (k >= t - l) {
				k -= t - l;
				l = t;
			} else {
				return x;
			}
		}

		std::sort(l, r);
		return l[k];
	});

	y_combinator([&](auto &&self, std::vector<int>::iterator l, std::vector<int>::iterator r) -> void {
		if (l == r) {
			return;
		}

		int x = quickselect(l, r, (r - l) / 2);
		self(l, std::lower_bound(l, r, x));
		self(std::upper_bound(l, r, x), r);
	})(a.begin(), a.end());
}
```

