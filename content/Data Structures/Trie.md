---
tags: [Computer Science, Computer Science/String Theory]
---

A [[Trie]] maintains a set $S$ of strings in $\Sigma^*$ by maintaining a deterministic finite automaton that accepts and only accepts strings in $S$. Specifically, let $P$ be the set of all the prefixes of all the strings in $S$, $\delta$ be a function in $(P\cup\{q_\perp\})\times\Sigma\to P\cup\{q_\perp\}$ satisfying
$$
\forall s\in P\cup\{q_\perp\},\forall\sigma\in\Sigma,\delta(s,\sigma)=\begin{cases}
s\sigma,&s\sigma\in P\\
q_\perp,&s\sigma\not\in P
\end{cases}
$$
Then it is easy to prove that $M=(P\cup\{q_\perp\},\Sigma,\delta,\varepsilon,S)$ is a deterministic finite automaton that accepts and only accepts strings in $S$. This costs a space of $\mathcal{O}(|\Sigma|\sum_{s\in S}|s|)$.

## Add

[[Trie#Add]] updates $S$ to $S\cup\{s\}$ in $\mathcal{O}(|s|)$ time and $\mathcal{O}(1)$ space.

Updating the values in $\delta$ that are changed by $s$ yields an algorithm that solves the problem in $\mathcal{O}(|s|)$ time and $\mathcal{O}(1)$ space.

~~~c++
int o = 1;
for (char c : s) {
	if (!next[o][c]) {
		next[o][c] = next.size();
		next.emplace_back();
		f.push_back(false);
	}
	o = next[o][c];
}
f[o] = true;
~~~

## Find

[[Trie#Find]] checks if $s\in S$ in $\mathcal{O}(|s|)$ time and $\mathcal{O}(1)$ space.

Running $s$ on $M$ yields an algorithm that solves the problem in $\mathcal{O}(|s|)$ time and $\mathcal{O}(1)$ space.

~~~c++
int o = 1;
for (char c : s) {
	o = next[o][c];
}
return f[o];
~~~

