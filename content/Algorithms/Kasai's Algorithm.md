---
tags: [Computer Science, Computer Science/String Theory]
---

[[Kasai's Algorithm]] is an algorithm that computes $h(0),h(1),\dots,h(n-2)$ for a string of length $n$, where
$$
h(i)=\left|\operatorname{lcp}\{s_{a_i}s_{a_i+1}\dots s_{n-1},s_{a_{i+1}}s_{a_{i+1}+1}\dots s_{n-1}\}\right|
$$
where $a_i$ denotes the starting index of the $i$-th lexicographically smallest suffix of $s$, in $\mathcal{O}(n\log n)$ time and $\mathcal{O}(n)$ space.

### Algorithm 0

0. Apply the [[Manber-Myers Algorithm]] to find $a_0,a_1,\dots,a_{n-1}$.
1. Apply the definition to find $h$.

This algorithm solves the problem in $\mathcal{O}(n^2)$ time and $\mathcal{O}(n)$ space.

```c++
std::vector<int> kasai(int n, const std::string &s) {
	auto sa = manber_myers(n, s);

	std::vector h(n - 1, 0);
	for (int i = 0; i < n - 1; i++) {
		while (sa[i] + h[i] < n && sa[i + 1] + h[i] < n && s[sa[i] + h[i]] == s[sa[i + 1] + h[i]]) {
			h[i]++;
		}
	}
	return h;
}
```

### Algorithm 1

> [!info] Lemma
>
> Let $r(i)$ denote the lexicographical rank of $s_is_{i+1}\dots s_{n-1}$ among all the suffixes of $s$, and let $h(n-1)=0$, then
> $$
> \forall i\in\{1,2,\dots,n-1\},h(r(i))\ge h(r(i-1))-1
> $$
>
> > [!note]- Proof
> >
> > Let $t_i=s_is_{i+1}\dots s_{n-1}$.
> >
> > If $h(r(i-1))>0$,
> > $$
> > \left|\operatorname{lcp}\{t_{i-1},t_{a_{r(i-1)+1}}\}\right|=h(r(i-1))\implies\left|\operatorname{lcp}\{t_i,t_{a_{r(i-1)+1}+1}\}\right|=h(r(i-1))-1
> > $$
> >
> > $$
> > \begin{align}
> > t_{i-1}<t_{a_{r(i-1)+1}}\land s_{i-1}=s_{a_{r(i-1)+1}}&\implies t_i<t_{a_{r(i-1)+1}+1}\\
> > &\iff t_i<t_{a_{r(i)+1}}\le t_{a_{r(i-1)+1}+1}\\
> > &\implies\left|\operatorname{lcp}\{t_i,t_{a_{r(i)+1}}\}\right|\ge\left|\operatorname{lcp}\{t_i,t_{a_{r(i-1)+1}+1}\}\right|\\
> > &\iff h(r(i))\ge h(r(i-1))-1
> > \end{align}
> > $$
> >

Based on [[Kasai's Algorithm#Algorithm 0]], applying the lemma to find a lower bound for $h(i)$ yields an algorithm that solves the problem in $\mathcal{O}(n\log n)$ time and $\mathcal{O}(n)$ space.

```c++
std::vector<int> kasai(int n, const std::string &s) {
	auto sa = manber_myers(n, s);

	std::vector<int> rk(n);
	for (int i = 0; i < n; i++) {
		rk[sa[i]] = i;
	}

	std::vector<int> h(n - 1);
	for (int i = 0, j = 0; i < n; i++) {
		if (rk[i] == n - 1) {
			continue;
		}

		j -= j > 0;
		while (i + j < n && sa[rk[i] + 1] + j < n && s[i + j] == s[sa[rk[i] + 1] + j]) {
			j++;
		}
		h[rk[i]] = j;
	}
	return h;
}
```

> [!note]- Proof
>
> The total number of executions of `j++` is
> $$
> h(r(0))+\sum_{i=1}^{n-1}(h(r(i))-h(r(i-1))+[h(r(i-1))>0])
> $$
>
> $$
> \begin{align}
> h(r(0))+\sum_{i=1}^{n-1}(h(r(i))-h(r(i-1))+[h(r(i-1))>0])&\le h(r(n-1))+n-1\\
> &\le2n\\
> &\in\mathcal{O}(n)
> \end{align}
> $$