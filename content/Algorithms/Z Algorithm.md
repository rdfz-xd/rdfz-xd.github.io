---
tags: [Computer Science, Computer Science/Algorithm, Computer Science/String Theory]
---

The [[Z Algorithm]] is an algorithm that computes $z(0),z(1),\dots,z(n-1)$ for a string $s$ of length $n$ in $\mathcal{O}(n)$ time and $\mathcal{O}(n)$ space, where
$$
z(i)=\operatorname{lcp}(s,s_is_{i+1}\dots s_{n-1})
$$

### Algorithm 0

Applying the definition yields an algorithm that solves the problem in $\mathcal{O}(n^2)$ time and $\mathcal{O}(n)$ space.

~~~c++
std::vector z(n, 0);
for (int i = 0; i < n; i++) {
	while (i + z[i] < n && s[z[i]] == s[i + z[i]]) {
		z[i]++;
	}
}
return z;
~~~

### Algorithm 1

> [!info] Lemma
> $$
> \forall j\in\{0,1,\dots,n-1\},\forall i\in\{j,j+1,\dots,n-1\},z(i)\ge\min\{z(i-j),j+z(j)-i\}
> $$
>
> > [!note]- Proof
> > $$
> > \begin{align}
> > s_0s_1\dots s_{z(j)-1}=s_js_{j+1}\dots s_{j+z(j)-1}&\implies s_{i-j}s_{i-j+1}\dots s_{z(j)-1}=s_is_{i+1}\dots s_{j+z(j)-1}\\
> > &\implies z(i)\ge\min\{z(i-j),j+z(j)-i\}
> > \end{align}
> > $$

Based on [[Z Algorithm#Algorithm 0]], maintaining $\operatorname{arg max}_{j=1}^{i-1}(j+z(j))$ and applying the lemma yield an algorithm that solves the problem in $\mathcal{O}(n)$ time and $\mathcal{O}(n)$ space.

~~~c++
std::vector<int> z(n);
z[0] = n;
for (int i = 1, l = 0, r = 0; i < n; i++) {
	z[i] = i < r ? std::min(z[i - l], r - i) : 0;
	while (i + z[i] < n && s[z[i]] == s[i + z[i]]) {
		z[i]++;
	}
	if (i + z[i] > r) {
		l = i, r = i + z[i];
	}
}
return z;
~~~

> [!note]- Proof
>
> It is easy to prove that the upper bound of the total number of executions of `z[i]++;` is
> $$
> \begin{align}
> \max_{i=1}^{n-1}(i+z(i))&\le n\\
> &\in\mathcal{O}(n)
> \end{align}
> $$

