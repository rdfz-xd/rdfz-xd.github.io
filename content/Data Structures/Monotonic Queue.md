---
tags: [Computer Science]
---

The [[Monotonic Queue]] is a data structure that maintains an array of $n$ numbers $a_0,a_1,\dots,a_{n-1}$ by maintaining
$$
S=\{i:i\in\{0,1,\dots,n-1\}\land\forall j\in\{i+1,i+2,\dots,n-1\},a_i\ge a_j\}
$$
This requires $\mathcal{O}(n)$ space.

> [!info] Lemma
> $$
> \forall i,j\in S,i<j\Rightarrow a_i\ge a_j
> $$

Let $\Phi=|S|$.

## Push

[[Monotonic Queue#Push]] updates $a_0,a_1,\dots,a_{n-1}$ to $a_0,a_1,\dots,a_n$ in **amortized** $\mathcal{O}(1)$ time and $\mathcal{O}(1)$ space.

### Algorithm

> [!info] Lemma
>
> Let $S'=\{i:i\in\{0,1,\dots,n\}\land\forall j\in\{i+1,i+2,\dots,n\},a_i\ge a_j\}$, then
> $$
> S'=\{i:i\in S\land a_i\ge a_n\}\cup\{n\}
> $$

Applying the lemma to find $S'$ yields an algorithm that solves the problem in **amortized** $\mathcal{O}(1)$ time and $\mathcal{O}(1)$ space.

```c++
void push(int x) {
	while (!q.empty() && q.back().second < x) {
		q.pop_back();
	}
	q.emplace_back(r++, x);
}
```

> [!note]- Proof
> $$
> \mathcal{O}(|S|-|S'|+\Delta\Phi)=\mathcal{O}(1)
> $$

## Pop

[[Monotonic Queue#Pop]] updates $a_0,a_1,\dots,a_{n-1}$ to $a_1,a_2,\dots,a_{n-1}$ in **amortized** $\mathcal{O}(1)$ time and $\mathcal{O}(1)$ space.

### Algorithm

> [!info] Lemma
>
> Let $S'=\{i:i\in\{1,2,\dots,n-1\}\land\forall j\in\{i+1,i+2,\dots,n-1\},a_i\ge a_j\}$, then
> $$
> S'=S\setminus\{0\}
> $$

Applying the lemma to find $S'$ yields an algorithm that solves the problem in **amortized** $\mathcal{O}(1)$ time and $\mathcal{O}(1)$ space.

```c++
void pop() {
	if (q.front().first == l++) {
		q.pop_front();
	}
}
```

> [!note]- Proof
> $$
> \mathcal{O}(\Delta\Phi)=\mathcal{O}(1)
> $$

## Top

[[Monotonic Queue#Top]] finds $\max_{i=0}^{n-1}a_i$ in **amortized** $\mathcal{O}(1)$ time and $\mathcal{O}(1)$ space.

### Algorithm

> [!info] Lemma
> $$
> \max_{i=0}^{n-1}a_i=a_{\min S}
> $$

Applying the lemma to find $\max_{i=0}^{n-1}a_i$ yields an algorithm that solves the problem in **amortized** $\mathcal{O}(1)$ time and $\mathcal{O}(1)$ space.

```c++
int top() {
	return q.front().second;
}
```

> [!note]- Proof
> $$
> \mathcal{O}(\Delta\Phi)=\mathcal{O}(1)
> $$