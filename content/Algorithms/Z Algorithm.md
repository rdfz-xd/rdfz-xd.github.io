---
tags: [Computer Science, Computer Science/Algorithm, Computer Science/String Theory]
---

The [[Z Algorithm]] is an algorithm that can find $z(0),z(1),\dots,z(n-1)$ for a string $s$ of length $n$ in $\mathcal{O}(n)$ time and $\mathcal{O}(n)$ memory, where
$$
z(i)=\operatorname{lcp}(s,s_is_{i+1}\dots s_{n-1})
$$

> [!Hint]
>
> The idea of the [[Z Algorithm]] is very similar to [[Manacher's Algorithm]].

### Algorithm 0

Applying the definition yields an algorithm that solves the problem in $\mathcal{O}(n^2)$ time and $\mathcal{O}(n)$ memory.

~~~c++
std::vector z(n, 0);
for (int i = 0; i < n; i++) {
	while (i + z[i] < n && s[z[i]] == s[i + z[i]]) {
		z[i]++;
	}
}
~~~

### Algorithm 1

> [!Lemma]
> $$
> j<i\implies z(i)\ge\min\{z(i-j),j+z(j)-i\}
> $$
>
> > [!Proof]-
> > $$
> > \begin{align}
> > s_0s_1\dots s_{z(j)-1}=s_js_{j+1}\dots s_{j+z(j)-1}&\implies s_{i-j}s_{i-j+1}\dots s_{z(j)-1}=s_is_{i+1}\dots s_{j+z(j)-1}\\
> > &\implies z(i)\ge\min\{z(i-j),j+z(j)-i\}
> > \end{align}
> > $$

Maintaining $\operatorname{argmax}_{j=1}^{i-1}(j+z(j))$ and applying the lemma yield an algorithm that solves the problem in $\mathcal{O}(n)$ time and $\mathcal{O}(n)$ memory.

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
~~~

> [!Proof]-
>
> It is easy to prove that the upper bound of the number of times `z[i]++;` is executed is
> $$
> \begin{align}
> \max_{i=1}^{n-1}(i+z(i))&\le n\\
> &\in\mathcal{O}(n)
> \end{align}
> $$

