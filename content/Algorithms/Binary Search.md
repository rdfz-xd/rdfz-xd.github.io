---
tags: [Computer Science]
---

[[Binary Search]] is an algorithm that counts the number of true values in an array of $n$ booleans $f_0,f_1,\dots,f_{n-1}$ satisfying $\forall i\in\{1,2,\dots,n-1\},f_i\Rightarrow f_{i-1}$ in $\mathcal{O}(\log n)$ time and $\mathcal{O}(1)$ space.

### Algorithm

Consider solving the problem after the number of true values $k$ has been determined to satisfy $l<k\le r$.

Let $m=\left\lfloor\frac{l+r}{2}\right\rfloor$.

- If $f_m$ is true, $f_0,f_1,\dots,f_m$ must all be true, which implies $m<k\le r$. Solve for the problem with $l'=m$ and $r'=r$ recursively.
- Otherwise, $f_m,f_{m+1},\dots,f_{n-1}$ must all be false, which implies $l<k\le m$. Solve for the problem with $l'=l$ and $r'=m$ recursively.

This algorithm solves the problem in $\mathcal{O}(\log n)$ time and $\mathcal{O}(1)$ space.

```c++
int binary_search(int n, const std::vector<bool> &f) {
	if (!f[0]) {
		return 0;
	}

	int l = 0, r = n;
	while (l + 1 < r) {
		int mid = std::midpoint(l, r);
		if (f[mid]) {
			l = mid;
		} else {
			r = mid;
		}
	}
	return r;
}
```

