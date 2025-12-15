---
tags: [Computer Science, Computer Science/Algorithm, Computer Science/String Theory]
---

[[Manacher's Algorithm]] is an algorithm that can find $d(0),d(1),\dots,d(n-1)$ for a string $s$ of length $n$ in $\mathcal{O}(n)$ time and $\mathcal{O}(n)$ memory, where
$$
d(i)=\max\{j:i-j\ge0\land i+j<n\land s_is_{i-1}\dots s_{i-j}=s_is_{i+1}\dots s_{i+j}\}
$$

> [!Hint]
>
> The idea of [[Manacher's Algorithm]] is very similar to the [[Z Algorithm]].

### Algorithm 0

Applying the definition yields an algorithm that solves the problem in $\mathcal{O}(n^2)$ time and $\mathcal{O}(n)$ memory.

~~~c++
std::vector d(n, 0);
for (int i = 0; i < n; i++) {
	while (i - d[i] - 1 >= 0 && i + d[i] + 1 < n && s[i - d[i] - 1] == s[i + d[i] + 1]) {
		d[i]++;
	}
}
~~~

### Algorithm 1

> [!Lemma]
> $$
> j<i\implies d(i)\ge\min\{d(2j-i),j+d(j)-i\}
> $$
>
> > [!Proof]-
> > $$
> > \begin{align}
> > s_js_{j-1}\dots s_{j-d(j)}=s_js_{j+1}\dots s_{j+d(j)}&\iff s_{j-d(j)}s_{j-d(j)+1}\dots s_{j+d(j)}=s_{j+d(j)}s_{j+d(j)-1}\dots s_{j-d(j)}\\
> > &\implies s_is_{i-1}\dots s_{2i-j-d(j)}=s_{2j-i}s_{2j-i+1}\dots s_{3j+d(j)-2i}\land s_is_{i+1}\dots s_{j+d(j)}=s_{2j-i}s_{2j-i-1}\dots s_{j-d(j)}\\
> > &\implies d(i)\ge\min\{d(2j-i),j+d(j)-i\}
> > \end{align}
> > $$

Maintaining $\operatorname{argmax}_{j=0}^{i-1}(j+d(j))$ and applying the lemma yield an algorithm that solves the problem in $\mathcal{O}(n)$ time and $\mathcal{O}(n)$ memory.

~~~c++
std::vector<int> d(n);
for (int i = 0, l = 0, r = 0; i < n; i++) {
	d[i] = i < r ? std::min(d[l + r - i - 1], r - i - 1) : 0;
	while (i - d[i] - 1 >= 0 && i + d[i] + 1 < n && s[i - d[i] - 1] == s[i + d[i] + 1]) {
		d[i]++;
	}
	if (i + d[i] + 1 > r) {
		l = i - d[i], r = i + d[i] + 1;
	}
}
~~~

> [!Proof]-
>
> It is easy to prove that the upper bound of the number of times `d[i]++;` is executed is
> $$
> \begin{align}
> \max_{i=0}^{n-1}(i+d(i))&\le n\\
> &\in\mathcal{O}(n)
> \end{align}
> $$