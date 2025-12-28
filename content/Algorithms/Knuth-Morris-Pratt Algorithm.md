---
tags: [Computer Science, Computer Science/Algorithm, Computer Science/String Theory]
---

The [[Knuth-Morris-Pratt Algorithm]] is an algorithm that computes $\pi(1),\pi(2),\dots,\pi(n)$ for a string $s$ of length $n$ in $\mathcal{O}(n)$ time and $\mathcal{O}(n)$ space, where
$$
\pi(i)=\max\{j:j<i\land s_0s_1\dots s_{j-1}=s_{i-j}s_{i-j+1}\dots s_{i-1}\}
$$

### Algorithm 0

Applying the definition yields an algorithm that solves the problem in $\mathcal{O}(n^3)$ time and $\mathcal{O}(n)$ space.

~~~c++
std::vector pi(n + 1, 0);
for (int i = 2; i <= n; i++) {
	for (int j = i - 1; j > 0; j--) {
		if (s.substr(0, j) == s.substr(i - j, j)) {
			pi[i] = j;
			break;
		}
	}
}
return pi;
~~~

### Algorithm 1

> [!info] Lemma
> $$
> \forall i\in\{2,3,\dots,n\},\pi(i)\le\pi(i-1)+1
> $$
>
> > [!node]- Proof
> > $$
> > \begin{align}
> > \pi(i)=j&\implies s_0s_1\dots s_{j-1}=s_{i-j}s_{i-j+1}\dots s_{i-1}\\
> > &\implies s_0s_1\dots s_{j-2}=s_{i-j}s_{i-j+1}\dots s_{i-2}\\
> > &\implies\pi(i-1)\ge j-1
> > \end{align}
> > $$

Based on [[Knuth-Morris-Pratt-Algorithm#Algorithm 0]], applying the lemma yields an algorithm that solves the problem in $\mathcal{O}(n^2)$ time and $\mathcal{O}(n)$ space.

~~~c++
std::vector pi(n + 1, 0);
for (int i = 2; i <= n; i++) {
	for (int j = pi[i - 1] + 1; j > 0; j--) {
		if (s.substr(0, j) == s.substr(i - j, j)) {
			pi[i] = j;
			break;
		}
	}
}
return pi;
~~~

> [!note]- Proof
>
> The total number of executions of  `s.substr(0, j) == s.substr(i - j, j)` is
> $$
> \begin{align}
> \sum_{i=2}^n(\pi(i-1)+1-\pi(i)+1)&=\pi(1)-\pi(n)+2(n-1)\\
> &\le2n\\
> &\in\mathcal{O}(n)
> \end{align}
> $$

### Algorithm 2

> [!info] Lemma
>
> Let $\pi(0)=0$, then
> $$
> \{j:j<i\land s_0s_1\dots s_{j-1}=s_{i-j}s_{i-j+1}\dots s_{i-1}\}=\{\pi(i),\pi(\pi(i)),\pi(\pi(\pi(i))),\dots\}
> $$
>
> > [!note]- Proof
> >
> > Let $S=$ $\{\{j:j<i\land s_0s_1\dots s_{j-1}=s_{i-j}s_{i-j+1}\dots s_{i-1}\}\}$, $a_j$ denote the $j$-th largest element in $S$. Then for $j\in\{1,2,\dots,|S|-1\}$, since
> > $$
> > s_0s_1\dots s_{a_j-1}=s_{i-a_j}s_{i-a_j+1}\dots s_{i-1}\implies\forall k\in\{0,1,\dots,a_j-1\},s_{a_j-k}s_{a_j-k+1}\dots s_{a_j-1}=s_{i-k}s_{i-k+1}\dots s_{i-1}
> > $$
> > it follows that
> > $$
> > \begin{align}
> > a_{j+1}&=\max\{k:k<a_j\land s_0s_1\dots s_{k-1}=s_{i-k}s_{i-k+1}\dots s_{i-1}\}\\
> > &=\max\{k:k<a_j\land s_0s_1\dots s_{k-1}=s_{a_j-k}s_{a_j-k+1}\dots s_{a_j-1}\}\\
> > &=\pi(a_j)
> > \end{align}
> > $$

Based on [[Knuth-Morris-Pratt-Algorithm#Algorithm 1]], applying the lemma yields an algorithm that solves the problem in $\mathcal{O}(n)$ time and $\mathcal{O}(n)$ space.

~~~c++
std::vector<int> pi(n + 1);
pi[0] = pi[1] = 0;
for (int i = 1, j = 0; i < n; i++) {
	while (j && s[j] != s[i]) {
		j = pi[j];
	}
	j += s[j] == s[i];
	pi[i + 1] = j;
}
return pi;
~~~