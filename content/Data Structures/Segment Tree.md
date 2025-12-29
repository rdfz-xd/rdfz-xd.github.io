---
tags: [Computer Science, Computer Science/Data Structure]
---

A [[Segment Tree]] maintains an array of $n=2^k$ numbers $a_0,a_1,\dots,a_{n-1}$ by maintaining $s(0,2^k),s(0,2^{k-1}),s(2^{k-1},2^k),\dots,s(0,1),s(1,2),\dots,s(2^k-1,2^k)$, where
$$
s(l,r)=\sum_{i=l}^{r-1}a_i
$$
which costs a space of $\mathcal{O}(n)$.

> [!note]- Proof
> $$
> \begin{align}
> \sum_{i=0}^k2^i&=2^{k+1}-1\\
> &=2n-1\\
> &\in\mathcal{O}(n)
> \end{align}
> $$

## Modify

This is an algorithm that updates $a_i$ to $x$ in $\mathcal{O}(\log(n))$ time and $\mathcal{O}(\log(n))$ space.

Updating all the maintained segments that contain the given element yields an algorithm that solves the problem in $\mathcal{O}(\log(n))$ time and $\mathcal{O}(\log(n))$ space.

> [!note]- Proof
>
> It is easy to prove that exactly $1$ segment is visited in each layer.

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

## Range Sum Query

This is an algorithm that computes $\sum_{i=l}^{r-1}a_i$ in $\mathcal{O}(\log(n))$ time and $\mathcal{O}(\log(n))$ space.

Decomposing the query interval into maintained segments yields an algorithm that solves the problem in $\mathcal{O}(\log(n))$ time and $\mathcal{O}(\log(n))$ space.

> [!note]- Proof
>
> It is easy to prove that at most $4$ segments are visited in each layer.

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

