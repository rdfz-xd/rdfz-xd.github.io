---
tags: [Computer Science]
---

The [[Inverse Fast Walsh-Hadamard Transform]] is an algorithm that finds a vector $\mathbf{x}$ such that $\mathbf{H}_n\mathbf{x}=\mathbf{y}$ for a vector
$$
\mathbf{y}=\begin{pmatrix}
y_0\\
y_1\\
\vdots\\
y_{2^n-1}
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

### Algorithm

> [!info] Lemma
> $$
> \forall n\in\N,\mathbf{H}_n^{-1}=\frac{1}{2^n}\mathbf{H}_n
> $$
>
> > [!note]- Proof
> >
> > If each $n$ in $\mathbb{Z}_+$, if $\mathbf{H}_{n-1}^2=2^{n-1}\mathbf{I}_{n-1}$,
> > $$
> > \begin{align}
> > \mathbf{H}_n^2&=\begin{pmatrix}
> > \mathbf{H}_{n-1}&\mathbf{H}_{n-1}\\
> > \mathbf{H}_{n-1}&-\mathbf{H}_{n-1}\\
> > \end{pmatrix}^2\\
> > &=\begin{pmatrix}
> > 2\mathbf{H}_{n-1}^2&\mathbf{0}_{n-1}\\
> > \mathbf{0}_{n-1}&2\mathbf{H}_{n-1}^2\\
> > \end{pmatrix}\\
> > &=\begin{pmatrix}
> > 2^n\mathbf{I}_{n-1}&\mathbf{0}_{n-1}\\
> > \mathbf{0}_{n-1}&2^n\mathbf{I}_{n-1}\\
> > \end{pmatrix}\\
> > &=2^n\mathbf{I}_n
> > \end{align}
> > $$
> > By induction, it follows that
> > $$
> > \forall n\in\mathbb{N},\mathbf{H}_n^2=2^n\mathbf{I}_n
> > $$

> [!info] Lemma
> $$
> \mathbf{x}=\frac{1}{2^n}\mathbf{H}_n\mathbf{y}
> $$
> is a vector such that $\mathbf{H}_n\mathbf{x}=\mathbf{y}$.
>
> > [!note]- Proof
> > $$
> > \begin{align}
> > \mathbf{H}_n\mathbf{x}&=\mathbf{H}_n\left(\frac{1}{2^n}\mathbf{H}_n\right)\mathbf{y}\\
> > &=\mathbf{H}_n\mathbf{H}_n^{-1}\mathbf{y}\\
> > &=\mathbf{y}
> > \end{align}
> > $$

0. Apply the [[Fast Walsh-Hadamard Transform]] to find $\mathbf{H}_n\mathbf{y}$.
1. Apply the lemma to find $\mathbf{x}$.

This algorithm solves the problem in $\mathcal{O}(n2^n)$ time and $\mathcal{O}(1)$ space.

```c++
void ifwht(int n, std::vector<int> &a) {
	fwht(n, a);
	for (int i = 0; i < 1 << n; i++) {
		a[i] >>= n;
	}
}
```

