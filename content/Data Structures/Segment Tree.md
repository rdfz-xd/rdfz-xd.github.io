---
tags: [Computer Science, Computer Science/Data Structure]
---

A [[Segment Tree]] maintains an array of $n=2^k$ numbers $a_0,a_1,\dots,a_{n-1}$ by maintaining $s(0,2^k),s(0,2^{k-1}),s(2^{k-1},2^k),\dots,s(0,1),s(1,2),\dots,s(2^k-1,2^k)$, where
$$
s(l,r)=\sum_{i=l}^{r-1}a_i
$$
which costs $\mathcal{O}(n)$ space.

> [!Proof]-
> $$
> \begin{align}
> \sum_{i=0}^k2^i&=2^{k+1}-1\\
> &=2n-1\\
> &\in\mathcal{O}(n)
> \end{align}
> $$

### Modify an Element

> [!Lemma]
>
> Each element is contained in $k+1$ segments.

According to the lemma, updating all the segments containing the given element yields an algorithm that solves the problem in $\mathcal{O}(\log(n))$ time.

~~~c++
y_combinator([&](auto &&self, int o, int s, int t) -> void {
	if (s + 1 == t) {
		sum[o] = x;
		return;
	}

	int mid = std::midpoint(s, t);
	if (i < mid) {
		self(o << 1, s, mid);
	} else {
		self(o << 1 | 1, mid, t);
	}
	sum[o] = sum[o << 1] + sum[o << 1 | 1];
})(1, 0, n);
~~~

### Find the Sum of Elements in a Segment

> [!Lemma]
>
> Any query segment can be decomposed into $\mathcal{O}(\log(n))$ maintained segments.

According to the lemma, summing of the sums of the maintained segments yields an algorithm that solves the problem in $\mathcal{O}(\log(n))$ time.

~~~c++
return y_combinator([&](auto &&self, int o, int s, int t) -> int {
	if (s >= r || t <= l) {
		return 0;
	}
	if (l <= s && t <= r) {
		return sum[o];
	}

	int mid = std::midpoint(s, t);
	return self(o << 1, s, mid) + self(o << 1 | 1, mid, t);
})(1, 0, n);
~~~

