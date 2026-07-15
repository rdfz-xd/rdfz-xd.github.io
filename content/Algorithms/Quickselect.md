---
tags: [Computer Science]
---

[[Quickselect]] is an algorithm that finds the $k$-th smallest element in an array of $n$ numbers $a_0,a_1,\dots,a_{n-1}$ in $\mathcal{O}(n)$ time and $\mathcal{O}(n)$ space.

> [!tip]
>
> This problem can also be solved by [[Selection Sort]] in $\mathcal{O}(n^2)$ time and $\mathcal{O}(n)$ space.

> [!tip]
>
> This problem can also be solved by [[Insertion Sort]] in $\mathcal{O}(n^2)$ time and $\mathcal{O}(n)$ space.

> [!tip]
>
> This problem can also be solved by [[Bubble Sort]] in $\mathcal{O}(n^2)$ time and $\mathcal{O}(n)$ space.

> [!tip]
>
> This problem can also be solved by [[Merge Sort]] in $\mathcal{O}(n\log n)$ time and $\mathcal{O}(n)$ space.

> [!tip]
>
> This problem can also be solved by [[Heapsort]] in $\mathcal{O}(n\log n)$ time and $\mathcal{O}(n)$ space.

> [!tip]
>
> This problem can also be solved by [[Quicksort]] in $\mathcal{O}(n\log n)$ time and $\mathcal{O}(n)$ space.

### Algorithm 0

0. Let $x$ be a number chosen uniformly at random from $a_0,a_1,\dots,a_{n-1}$.
1. Let $b_0,b_1,\dots,b_{n_b-1}$ be the numbers among $a_0,a_1,\dots,a_{n-1}$ that are less than $x$, $c_0,c_1,\dots,c_{n_c-1}$ be the numbers equal to $x$, $d_0,d_1,\dots,d_{n_d-1}$ be the numbers greater than $x$.
2. - If $k<n_b$, the $k$-th smallest element is the $k$-th smallest element among $b_0,b_1,\dots,b_{n_b-1}$. Solve for it recursively.
   - If $k\ge n_b+n_c$, the $k$-th smallest element is the $k-n_b-n_c$-th smallest element among $d_0,d_1,\dots,d_{n_d-1}$. Solve for it recursively.
   - Otherwise, the $k$-th smallest element is $x$.

This algorithm solves the problem in **expected** $\mathcal{O}(n)$ time and $\mathcal{O}(n)$ space.

```c++
int quickselect(int n, std::vector<int> a, int k) {
	auto l = a.begin(), r = a.end();
	while (true) {
		int x = l[std::uniform_int_distribution<int>(0, r - l - 1)(rng)];

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
}
```

> [!note]- Proof
>
> > [!info] Lemma
> >
> > If $a_0,a_1,\dots,a_{n-1}$ are pairwise distinct, let $X$ be the number of comparisons performed between distinct elements, then
> > $$
> > \mathbb{E}[X]\in\mathcal{O}(n)
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
> > >
> > > - If $i<j\le k$, since $X_{i,j}=1$ iff, when $v_i$ gets abandoned, the chosen element is $v_i$ or $v_j$, it follows that
> > >   $$
> > >   \Pr[X_{i,j}=1]=\frac{2}{k-i+1}
> > >   $$
> > >
> > > - If $k\le i<j$, since $X_{i,j}=1$ iff, when $v_j$ gets abandoned, the chosen element is $v_i$ or $v_j$, it follows that
> > >   $$
> > >   \Pr[X_{i,j}=1]=\frac{2}{j-k+1}
> > >   $$
> > >
> > > - If $i<k<j$, since $X_{i,j}=1$ iff, when $v_i$ or $v_j$ gets abandoned, the chosen element is $v_i$ or $v_j$, it follows that
> > >   $$
> > >   \Pr[X_{i,j}=1]=\frac{2}{j-i+1}
> > >   $$
> > >
> > > Therefore,
> > > $$
> > > \mathbb{E}[X]=\sum_{i=0}^k\sum_{j=i+1}^k\frac{2}{k-i+1}+\sum_{j=k}^{n-1}\sum_{i=k}^{j-1}\frac{2}{j-k+1}+\sum_{i=0}^{k-1}\sum_{j=k+1}^{n-1}\frac{2}{j-i+1}
> > > $$
> > > Since
> > > $$
> > > \begin{align}
> > > \sum_{i=0}^k\sum_{j=i+1}^k\frac{2}{k-i+1}&=2\sum_{i=0}^{k-1}\frac{k-i}{k-i+1}\\
> > > &\le2k
> > > \end{align}
> > > $$
> > > and
> > > $$
> > > \begin{align}
> > > \sum_{j=k}^{n-1}\sum_{i=k}^{j-1}\frac{2}{j-k+1}&=2\sum_{j=k+1}^{n-1}\frac{j-k}{j-k+1}\\
> > > &\le2(n-k-1)
> > > \end{align}
> > > $$
> > > and
> > > $$
> > > \begin{align}
> > > \sum_{i=0}^{k-1}\sum_{j=k+1}^{n-1}\frac{2}{j-i+1}&\le2\sum_{d=3}^n\frac{d-2}{d}\\
> > > &\le2n
> > > \end{align}
> > > $$
> > > it follows that
> > > $$
> > > \begin{align}
> > > \mathbb{E}[X]&\le2k+2(n-k-1)+2n\\
> > > &\le4n\\
> > > &\in\mathcal{O}(n)
> > > \end{align}
> > > $$
>
> Let $X$ be the number of comparisons performed between distinct elements when running on $a_0,a_1,\dots,a_{n-1}$, $X'$ be the number when running on $(a_0,0),(a_1,1),\dots,(a_{n-1},n-1)$, then, it is easy to prove that
> $$
> \begin{align}
> \mathbb{E}[X]&\le\mathbb{E}[X']\\
> &\in\mathcal{O}(n)
> \end{align}
> $$

### Algorithm 1

Based on [[Algorithm 0]], instead of choosing $x$ at random, determine $x$ in the following way:

0. Divide $a_0,a_1,\dots,a_{n-1}$ into $\left\lfloor\frac{n}{5}\right\rfloor$ groups of $5$, ignoring the remainder.
1. Apply an appropriate sorting algorithm (e.g., [[Selection Sort]], [[Insertion Sort]], [[Bubble Sort]], [[Merge Sort]], [[Heapsort]], [[Quicksort]]) to find the median of each group.
2. Find the median of these medians recursively, and set $x$ to this median.

This algorithm solves the problem in $\mathcal{O}(n)$ time and $\mathcal{O}(n)$ space.

```c++
int quickselect(int n, std::vector<int> a, int k) {
	return y_combinator([&](auto &&self, std::vector<int>::iterator l, std::vector<int>::iterator r, int k) -> int {
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
	})(a.begin(), a.end(), k);
}
```

> [!note]- Proof
>
> > [!info] Lemma
> > $$
> > \sum_{i=0}^{n-1}[a_i\le x]\ge\frac{3n}{10}
> > $$
> >
> > $$
> > \sum_{i=0}^{n-1}[a_i\ge x]\ge\frac{3n}{10}
> > $$
>
> Let $T(n)$ denote the worst-case running time of this algorithm on an array of length $n$, and let $N$ and $c$ be sufficiently large positive integers.
>
> Then, for any $n$ in $\{N,N+1,N+2,\dots,\}$, if $\forall m\in\{1,2,\dots,n-1\},T(m)\le10cm$,
> $$
> \begin{align}
> T(n)&\le T\left(\left\lfloor\frac{n}{5}\right\rfloor\right)+\max_{m=1}^{\left\lfloor\frac{7n}{10}\right\rfloor}T(m)+cn\\
> &\le2cn+7cn+cn\\
> &=10cn
> \end{align}
> $$
> By induction, it follows that
> $$
> T(n)\in\mathcal{O}(n)
> $$
