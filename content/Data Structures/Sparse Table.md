---
tags: [Computer Science]
---

The [[Sparse Table]] is a data structure that maintains an array of $n$ numbers $a_0,a_1,\dots,a_{n-1}$ by maintaining
$$
f(i,j)=\max_{k=j}^{j+2^i-1}a_k
$$
which costs a space of $\mathcal{O}(n\log n)$.

## Build

[[Sparse Table#Build]] builds a [[Sparse Table]] for $a_0,a_1,\dots,a_{n-1}$ in $\mathcal{O}(n\log n)$ time and $\mathcal{O}(1)$ space.

### Algorithm

> [!info] Lemma
> $$
> \forall i\in\Z_+,\forall j\in\{0,1,\dots,n-2^i\},f(i,j)=\max\{f(i-1,j),f(i-1,j+2^{i-1})\}
> $$

Applying the lemma yields to find $f$ an algorithm that solves the problem in $\mathcal{O}(n\log n)$ time and $\mathcal{O}(1)$ space.

~~~c++
f[0] = a;
for (int i = 1; i <= std::__lg(n); i++) {
	for (int j = 0; j + (1 << i) <= n; j++) {
		f[i][j] = std::max(f[i - 1][j], f[i - 1][j + (1 << (i - 1))]);
	}
}
~~~

## Range Maximum Query

[[Sparse Table#Range Maximum Query]] computes $\max_{i=l}^{r-1}a_i$ in $\mathcal{O}(1)$ time and $\mathcal{O}(1)$ space.

### Algorithm

> [!info] Lemma
> $$
> \forall l\in\{0,1,\dots,n-1\},\forall r\in\{l+1,l+2,\dots,n\},\max_{i=l}^{r-1}a_i=\max\{f(\lfloor\log_2(r-l)\rfloor,l),f(\lfloor\log_2(r-l)\rfloor,r-2^{\lfloor\log_2(r-l)\rfloor})\}
> $$

Applying the lemma to find $\max_{i=l}^{r-1}a_i$ yields an algorithm that solves the problem in $\mathcal{O}(1)$ time and $\mathcal{O}(1)$ space.

~~~c++
int i = std::__lg(r - l);
return std::max(f[i][l], f[i][r - (1 << i)]);
~~~

