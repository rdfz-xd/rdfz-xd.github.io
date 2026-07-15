---
tags: [Computer Science]
---

The [[Boyer-Moore Majority Vote Algorithm]] is an algorithm that finds the majority of an array of $n$ numbers $a_0,a_1,\dots,a_{n-1}$, if the majority exists, in $\mathcal{O}(n)$ time and $\mathcal{O}(1)$ space.

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

> [!tip]
>
> This problem can also be solved by [[Quickselect]] in $\mathcal{O}(n)$ time and $\mathcal{O}(n)$ space.

### Algorithm

0. Arbitrarily remove two distinct elements, until all the remaining elements have the same value.

> [!info] Lemma
>
> The value of the remaining elements is the majority of $a_0,a_1,\dots,a_{n-1}$.
>
> > [!note]- Proof
> >
> > Let $c$ denote the number of occurrences of the majority in $a_0,a_1,\dots,a_{n-1}$.
> >
> > - If all the majority elements are removed, at least $c$ removes must have been performed, which implies that at least $2c$ elements are removed.
> >
> >   Since
> >   $$
> >   c>\frac{n}{2}\iff2c>n
> >   $$
> >   it follows that more than $n$ elements are removed.
> >
> > By contradiction, it follows that the value of the remaining elements is the majority of $a_0,a_1,\dots,a_{n-1}$.

1. Apply the lemma to find the majority.

This algorithm solves the problem in $\mathcal{O}(n)$ time and $\mathcal{O}(1)$ space.

```c++
int boyer_moore(int n, const std::vector<int> &a) {
	int x = 0, c = 0;
	for (int i = 0; i < n; i++) {
		if (c) {
			c += x == a[i] ? 1 : -1;
		} else {
			x = a[i], c = 1;
		}
	}
	return x;
}
```
