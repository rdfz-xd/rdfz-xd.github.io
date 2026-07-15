---
tags: [Computer Science]
---

The [[Wavelet Tree]] is a data structure that maintains an array of $n$ integers $a_0,a_1,\dots,a_{n-1}\in\{0,1,\dots,2^m-1\}$ by maintaining the **Wavelet Matrix** of the array.

The **Wavelet Matrix** $W$ is an $m\times n$ matrix constructed in the following way:

1. Let $A_m=a$.
2. For $i=m-1,m-2,\dots,0$, $A_i$ is obtained by sorting $A_{i+1}$ using the $i$-th bit in the binary representation as the primary key and the original order in $A_{i+1}$ as the secondary key.
3. Set $W_{i,j}$ to $1$ if the $i$-th bit of $A_{i+1,j}$ is $0$, and $0$ otherwise.

In addition,
$$
S_i(j)=\sum_{k=0}^{j-1}W_{i,k}
$$
is also maintained.

This costs a space of $\mathcal{O}(nm)$.

> [!info] Lemma
>
> For any contiguous segment
> $$
> A_{i+1,l},A_{i+1,l+1},\dots,A_{i+1,r-1}
> $$
> the sequence formed by the values in this segment with the $i$-th bit equal to $0$ is
> $$
> A_{i,S_i(l)},A_{i,S_i(l)+1},\dots,A_{i,S_i(r)-1}
> $$
> and the sequence formed by the values with the $i$-th bit equal to $1$ is
> $$
> A_{i,S_i(n)+l-S_i(l)},A_{i,S_i(n)+l-S_i(l)+1},\dots,A_{i,S_i(n)+r-S_i(r)-1}
> $$

## Build

[[Wavelet Tree#Build]] builds a [[Wavelet Tree]] for $a_0,a_1,\dots,a_{n-1}$ in $\mathcal{O}(nm)$ time and $\mathcal{O}(n)$ space.

### Algorithm

Applying the definition to find $S$ yields an algorithm that solves the problem in $\mathcal{O}(nm)$ time and $\mathcal{O}(n)$ space.

```c++
void build(int n, int m, std::vector<int> a) {
	s.assign(m, std::vector(n + 1, 0));
	for (int i = m - 1; i >= 0; i--) {
		for (int j = 0; j < n; j++) {
			s[i][j + 1] = s[i][j] + !(a[j] >> i & 1);
		}
		std::ranges::stable_partition(a, [&](int x) -> bool {
			return !(x >> i & 1);
		});
	}
}
```

## Range Kth Query

[[Wavelet Tree#Range Kth Query]] finds the $k$-th smallest element among $a_l,a_{l+1},\dots,a_{r-1}$ in $\mathcal{O}(m)$ time and $\mathcal{O}(1)$ space.

### Algorithm

Consider finding the $k$-th smallest element among $A_{i+1,l},A_{i+1,l+1},\dots,A_{i+1,r-1}$, given that
$$
\left\lfloor\frac{A_{i+1,l}}{2^{i+1}}\right\rfloor=\left\lfloor\frac{A_{i+1,l+1}}{2^{i+1}}\right\rfloor=\dots=\left\lfloor\frac{A_{i+1,r-1}}{2^{i+1}}\right\rfloor
$$

- If $k<S_i(r)-S_i(l)$, the $i$-th bit of the $k$-th smallest element must be $0$. Therefore, applying the lemma yields that the $k$-th smallest element is equal to the $k$-th smallest element among $A_{i,S_i(l)},A_{i,S_i(l)+1},\dots,A_{i,S_i(r)-1}$. Solve for it recursively.
- Otherwise, the $i$-th bit of the $k$-th smallest element must be $1$. Therefore, applying the lemma yields that the $k$-th smallest element is equal to the $k-S_i(r)+S_i(l)$-th smallest element among $A_{i,S_i(n)+l-S_i(l)},A_{i,S_i(n)+l-S_i(l)+1},\dots,A_{i,S_i(n)+r-S_i(r)-1}$. Solve for it recursively.

This algorithm solves the problem in $\mathcal{O}(m)$ time and $\mathcal{O}(1)$ space.

```c++
int range_kth_query(int l, int r, int k) {
	int res = 0;
	for (int i = m - 1; i >= 0; i--) {
		if (k < s[i][r] - s[i][l]) {
			l = s[i][l];
			r = s[i][r];
		} else {
			res |= 1 << i;
			k -= s[i][r] - s[i][l];
			l += s[i][n] - s[i][l];
			r += s[i][n] - s[i][r];
		}
	}
	return res;
}
```

## Range Rank Query

[[Wavelet Tree#Range Rank Query]] counts the number of elements less than $x$ among $a_l,a_{l+1},\dots,a_{r-1}$ in $\mathcal{O}(m)$ time and $\mathcal{O}(1)$ space.

### Algorithm

Consider counting the number of elements less than $x$ among $A_{i+1,l},A_{i+1,l+1},\dots,A_{i+1,r-1}$, given that
$$
\forall j\in\{l,l+1,\dots,r-1\},\left\lfloor\frac{A_{i+1,j}}{2^{i+1}}\right\rfloor=\left\lfloor\frac{x}{2^{i+1}}\right\rfloor
$$

- If the $i$-th bit of $x$ is $0$, all the elements with the $i$-th bit equal to $1$ are greater than $x$. Therefore, applying the lemma yields that the number of elements less than $x$ is equal to the number of elements less than $x$ among $A_{i,S_i(l)},A_{i,S_i(l)+1},\dots,A_{i,S_i(r)-1}$. Solve for it recursively.
- Otherwise, all the elements with the $i$-th bit equal to $0$ are less than $x$. Therefore, applying the lemma yields that the number of elements less than $x$ is equal to the number of elements with the $i$-th bit equal to $0$ plus the number of elements less than $x$ among $A_{i,S_i(n)+l-S_i(l)},A_{i,S_i(n)+l-S_i(l)+1},\dots,A_{i,S_i(n)+r-S_i(r)-1}$. Solve for it recursively.

This algorithm solves the problem in $\mathcal{O}(m)$ time and $\mathcal{O}(1)$ space.

```c++
int range_rank_query(int l, int r, int x) {
	int res = 0;
	for (int i = m - 1; i >= 0; i--) {
		if (!(x >> i & 1)) {
			l = s[i][l];
			r = s[i][r];
		} else {
			res += s[i][r] - s[i][l];
			l += s[i][n] - s[i][l];
			r += s[i][n] - s[i][r];
		}
	}
	return res;
}
```

