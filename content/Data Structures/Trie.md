---
tags: [Computer Science, Computer Science/Automata Theory, Computer Science/Stringology]
---

The [[Trie]] is a data structure that maintains a set $S$ of strings in $\Sigma^*$ by maintaining a deterministic finite automaton that accepts and only accepts strings in $S$.

Specifically, let $P$ be the set of the prefixes of the strings in $S$, $\delta$ be a function in $(P\cup\{\perp\})\times\Sigma\to P\cup\{\perp\}$ such that
$$
\forall s\in P,\forall\sigma\in\Sigma,\delta(s,\sigma)=\begin{cases}
s\sigma,&s\sigma\in P\\
\perp,&s\sigma\not\in P
\end{cases}\land\forall\sigma\in\Sigma,\delta(\perp,\sigma)=\perp
$$
Then it is easy to prove that $M=\langle P\cup\{\perp\},\Sigma,\delta,\varepsilon,S\rangle$ is a deterministic finite automaton that accepts and only accepts strings in $S$.

This requires $\mathcal{O}(\sum_{s\in S}|s|)$ space.

## Add

[[Trie#Add]] updates $S$ to $S\cup\{s\}$ in $\mathcal{O}(|s|)$ time and $\mathcal{O}(1)$ space.

### Algorithm

Updating the values in $\delta$ affected by $s$ yields an algorithm that solves the problem in $\mathcal{O}(|s|)$ time and $\mathcal{O}(1)$ space.

~~~c++
void add(const std::string &s) {
	int o = 0;
	for (char c : s) {
		if (!next[o].contains(c)) {
			next[o][c] = next.size();
			next.emplace_back();
			f.push_back(false);
		}
		o = next[o][c];
	}
	f[o] = true;
}
~~~

## Find

[[Trie#Find]] checks if $s\in S$ in $\mathcal{O}(|s|)$ time and $\mathcal{O}(1)$ space.

### Algorithm

Running $s$ on $M$ yields an algorithm that solves the problem in $\mathcal{O}(|s|)$ time and $\mathcal{O}(1)$ space.

~~~c++
bool find(const std::string &s) {
	int o = 0;
	for (char c : s) {
		if (!next[o].contains(c)) {
			return false;
		}
		o = next[o][c];
	}
	return f[o];
}
~~~
