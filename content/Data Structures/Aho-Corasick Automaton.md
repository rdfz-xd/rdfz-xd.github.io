---
tags: [Computer Science, Computer Science/String Theory]
---

The [[Aho-Corasick Automaton]] is a data structure that maintains a set $S$ of strings in $\Sigma^*$ by maintaining a deterministic finite automaton that accepts and only accepts strings containing a string from $S$ as a suffix.

Specifically, let $P$ be the set of the prefixes of the strings in $S$, and let
$$
E(s)=\{t:t\in P\land t=s_{|s|-|t|}s_{|s|-|t|+1}\dots s_{|s|-1}\}
$$
and let $\delta$ be a function in $P\times\Sigma\to P$ satisfying
$$
\forall s\in P,\forall\sigma\in\Sigma,\delta(s,\sigma)\in\arg\max_{t\in E(s\sigma)}|t|
$$

> [!info] Lemma
> $$
> \forall s\in\Sigma^*,\arg\max_{t\in E(s)}|t|=\{\delta(\dots\delta(\delta(\varepsilon,s_0),s_1)\dots,s_{|s|-1})\}
> $$

Let $F=\{s:s\in P\land\exist t\in S,t=s_{|s|-|t|}s_{|s|-|t|+1}\dots s_{|s|-1}\}$, then applying the lemma yields that $M=(P,\Sigma,\delta,\varepsilon,F)$ is a deterministic finite automaton that accepts and only accepts strings containing a string from $S$ as a suffix.

This costs a space of $\mathcal{O}(|\Sigma|\sum_{s\in S}|s|)$.

## Build

[[Aho-Corasick Automaton#Build]] builds an [[Aho-Corasick Automaton]] for $S$ in $\mathcal{O}(|\Sigma|\sum_{s\in S}|s|)$ time and $\mathcal{O}(\sum_{s\in S}|s|)$ space.

### Algorithm

> [!info] Lemma
>
> Let
> $$
> \phi(s)\in\arg\max_{t\in E(s)\setminus\{s\}}|t|
> $$
> Then
> $$
> \forall s\in P\setminus\{\varepsilon\},\forall \sigma\in\Sigma,\delta(s,\sigma)=\begin{cases}
> s\sigma,&s\sigma\in P\\
> \delta(\phi(s),\sigma),&s\sigma\notin P
> \end{cases}
> $$

> [!info] Lemma
> $$
> \forall s\in P\setminus\{\varepsilon\},\forall\sigma\in\Sigma,s\sigma\in P\Rightarrow \phi(s\sigma)=\delta(\phi(s),\sigma)
> $$

1. Build a [[Trie]] for $S$.
2. For each prefix $s$ in increasing order of length, apply the lemmas to find the $\delta$ and $\phi$ for $s$.

This algorithm solves the problem in $\mathcal{O}(|\Sigma|\sum_{s\in S}|s|)$ time and $\mathcal{O}(\sum_{s\in S}|s|)$ space.

```c++
void build(int n, const std::vector<std::string> &s) {
	next.assign(2, {});
	next[0].fill(1);
	f.assign(2, false);

	for (int i = 0; i < n; i++) {
		int o = 1;
		for (char c : s[i]) {
			if (!next[o][c]) {
				next[o][c] = next.size();
				next.emplace_back();
				f.push_back(false);
			}
			o = next[o][c];
		}
		f[o] = true;
	}

	std::vector fail(next.size(), 0);

	std::queue<int> q;
	q.push(1);
	while (!q.empty()) {
		int o = q.front();
		q.pop();

		f[o] = f[o] || f[fail[o]];
		for (char c : alphabet) {
			if (next[o][c]) {
				fail[next[o][c]] = next[fail[o]][c];
				q.push(next[o][c]);
			} else {
				next[o][c] = next[fail[o]][c];
			}
		}
	}
}
```

## Find

[[Find]] checks if $\exist t\in S,t=s_{|s|-|t|}s_{|s|-|t|+1}\dots s_{|s|-1}$ in $\mathcal{O}(|s|)$ time and $\mathcal{O}(1)$ space.

### Algorithm

Running $s$ on $M$ yields an algorithm that solves the problem in $\mathcal{O}(|s|)$ time and $\mathcal{O}(1)$ space.

```c++
bool find(const std::string &s) {
	int o = 1;
	for (char c : s) {
		o = next[o][c];
	}
	return f[o];
}
```

