---
tags: [Computer Science]
---

The [[Fast Walsh-Hadamard Transform]] is an algorithm that computes $\mathbf{y}=\mathbf{H}_n\mathbf{x}$ for a vector
$$
\mathbf{x}=\begin{pmatrix}
x_0\\
x_1\\
\vdots\\
x_{2^n-1}
\end{pmatrix}
$$
in $\mathcal{O}(n2^n)$ time and $\mathcal{O}(1)$ space, where $\mathbf{H}_n$ is a matrix satisfying
$$
\mathbf{H}_0=\begin{pmatrix}
1
\end{pmatrix}\land\forall n\in\N,\mathbf{H}_{n+1}=\begin{pmatrix}
\mathbf{H}_n&\mathbf{H}_n\\
\mathbf{H}_n&-\mathbf{H}_n
\end{pmatrix}
$$

### Algorithm 0

> [!info] Lemma
>
> Let
> $$
> \mathbf{x}_0=\begin{pmatrix}
> x_0\\
> x_1\\
> \vdots\\
> x_{2^{n-1}-1}
> \end{pmatrix},\mathbf{x}_1=\begin{pmatrix}
> x_{2^{n-1}}\\
> x_{2^{n-1}+1}\\
> \vdots\\
> x_{2^n-1}
> \end{pmatrix}
> $$
> then
> $$
> \mathbf{y}=\begin{pmatrix}
> \mathbf{H}_{n-1}\mathbf{x}_0+\mathbf{H}_{n-1}\mathbf{x}_1\\
> \mathbf{H}_{n-1}\mathbf{x}_0-\mathbf{H}_{n-1}\mathbf{x}_1
> \end{pmatrix}
> $$
>
> > [!note]- Proof
> > $$
> > \begin{align}
> > \mathbf{y}&=\mathbf{H_n}\mathbf{x}\\
> > &=\begin{pmatrix}
> > \mathbf{H}_{n-1}&\mathbf{H}_{n-1}\\
> > \mathbf{H}_{n-1}&-\mathbf{H}_{n-1}
> > \end{pmatrix}\begin{pmatrix}
> > \mathbf{x}_0\\
> > \mathbf{x}_1
> > \end{pmatrix}\\
> > &=\begin{pmatrix}
> > \mathbf{H}_{n-1}\mathbf{x}_0+\mathbf{H}_{n-1}\mathbf{x}_1\\
> > \mathbf{H}_{n-1}\mathbf{x}_0-\mathbf{H}_{n-1}\mathbf{x}_1
> > \end{pmatrix}
> > \end{align}
> > $$

0. Find $\mathbf{H}_{n-1}\mathbf{x}_0$ and $\mathbf{H}_{n-1}\mathbf{x}_1$ recursively.
1. Apply the lemma to find $\mathbf{y}$.

This algorithm solves the problem in $\mathcal{O}(n2^n)$ time and $\mathcal{O}(n)$ space.

```c++
void fwht(int n, std::vector<int> &a) {
	y_combinator([&](auto &&self, std::vector<int>::iterator l, std::vector<int>::iterator r) -> void {
		if (l + 1 == r) {
			return;
		}

		auto mid = l + (r - l) / 2;
		self(l, mid), self(mid, r);
		for (int i = 0; i < (r - l) / 2; i++) {
			int u = l[i], v = mid[i];
			l[i] = u + v;
			mid[i] = u - v;
		}
	})(a.begin(), a.end());
}
```

### Algorithm 1

Based on [[Fast Walsh-Hadamard Transform#Algorithm 0]], converting the recursion into a bottom-up iterative approach yields an algorithm that solves the problem in $\mathcal{O}(n2^n)$ time and $\mathcal{O}(1)$ space.

```c++
void fwht(int n, std::vector<int> &a) {
	for (int k = 1; k < 1 << n; k *= 2) {
		for (int i = 0; i < 1 << n; i += 2 * k) {
			for (int j = 0; j < k; j++) {
				int u = a[i + j], v = a[i + j + k];
				a[i + j] = u + v;
				a[i + j + k] = u - v;
			}
		}
	}
}
```
