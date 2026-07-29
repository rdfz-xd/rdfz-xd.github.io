---
tags: [Computer Science, Computer Science/String Theory]
---

[[Manacher's Algorithm]] is an algorithm that computes $d(0),d(1),\dots,d(n-1)$ for a string $s$ of length $n$, where
$$
d(i)=\max\{j:i-j\ge0\land i+j<n\land s_is_{i-1}\dots s_{i-j}=s_is_{i+1}\dots s_{i+j}\}
$$
in $\mathcal{O}(n)$ time and $\mathcal{O}(n)$ space.

### Algorithm 0

Applying the definition to find $d$ yields an algorithm that solves the problem in $\mathcal{O}(n^2)$ time and $\mathcal{O}(n)$ space.

~~~c++
std::vector<int> manacher(int n, const std::string &s) {
	std::vector d(n, 0);
	for (int i = 0; i < n; i++) {
		while (i - d[i] - 1 >= 0 && i + d[i] + 1 < n && s[i - d[i] - 1] == s[i + d[i] + 1]) {
			d[i]++;
		}
	}
	return d;
}
~~~

### Algorithm 1

> [!info] Lemma
> $$
> \forall i\in\{0,1,\dots,n-1\},\forall j\in\{0,1,\dots,i-1\},i<j+d(j)\Rightarrow d(i)\ge\min\{d(2j-i),j+d(j)-i\}
> $$
>
> > [!note]- Proof
> > $$
> > \begin{align}
> > s_js_{j-1}\dots s_{j-d(j)}=s_js_{j+1}\dots s_{j+d(j)}&\iff s_{j-d(j)}s_{j-d(j)+1}\dots s_{j+d(j)}=s_{j+d(j)}s_{j+d(j)-1}\dots s_{j-d(j)}\\
> > &\implies s_is_{i-1}\dots s_{2i-j-d(j)}=s_{2j-i}s_{2j-i+1}\dots s_{3j+d(j)-2i}\land s_is_{i+1}\dots s_{j+d(j)}=s_{2j-i}s_{2j-i-1}\dots s_{j-d(j)}\\
> > &\implies d(i)\ge\min\{d(2j-i),j+d(j)-i\}
> > \end{align}
> > $$

Based on [[Manacher's Algorithm#Algorithm 0]], maintaining $\arg\max_{j=0}^{i-1}(j+d(j))$ and applying the lemma to find a lower bound for $d(i)$ yield an algorithm that solves the problem in $\mathcal{O}(n)$ time and $\mathcal{O}(n)$ space.

~~~c++
std::vector<int> manacher(int n, const std::string &s) {
	std::vector<int> d(n);
	for (int i = 0, j = -1; i < n; i++) {
		d[i] = ~j && i < j + d[j] ? std::min(d[2 * j - i], j + d[j] - i) : 0;
		while (i - d[i] - 1 >= 0 && i + d[i] + 1 < n && s[i - d[i] - 1] == s[i + d[i] + 1]) {
			d[i]++;
		}
		if (j == -1 || j + d[j] < i + d[i]) {
			j = i;
		}
	}
	return d;
}
~~~

> [!note]- Proof
>
> It is easy to prove that the total number of executions of `d[i]++` is bounded by
> $$
> \max_{i=0}^{n-1}(i+d(i))
> $$
>
> $$
> \begin{align}
> \max_{i=0}^{n-1}(i+d(i))&\le n\\
> &\in\mathcal{O}(n)
> \end{align}
> $$