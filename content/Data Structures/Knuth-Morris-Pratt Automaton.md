---
tags: [Computer Science, Computer Science/Automata Theory, Computer Science/Stringology]
---

The [[Knuth-Morris-Pratt Automaton]] is a data structure that maintains a string $s$ in $\Sigma^*$ by maintaining a deterministic finite automaton that accepts and only accepts strings containing $s$ as a suffix.

Specifically, let
$$
E(t)=\{i:i\in\{0,1,\dots,\min\{|s|,|t|\}\}\land s_0s_1\dots s_{i-1}=t_{|t|-i}t_{|t|-i+1}\dots t_{|t|-1}\}
$$
and let $\delta$ be a function in $\{0,1,\dots,|s|\}\times\Sigma\to\{0,1,\dots,|s|\}$ such that
$$
\forall i\in\{0,1,\dots,|s|\},\forall\sigma\in\Sigma,\delta(i,\sigma)=\max E(s_0s_1\dots s_{i-1}\sigma)
$$

> [!info] Lemma
> $$
> \forall t\in\Sigma^*,\delta(\dots\delta(\delta(0,t_0),t_1)\dots,t_{|t|-1})=\max E(t)
> $$

Applying the lemma yields that $M=\langle\{0,1,\dots,|s|\},\Sigma,\delta,0,\{|s|\}\rangle$ is a deterministic finite automaton that accepts and only accepts strings containing $s$ as a suffix.

This requires $\mathcal{O}(|\Sigma||s|)$ space.

## Build

[[Knuth-Morris-Pratt Automaton#Build]] builds a [[Knuth-Morris-Pratt Automaton]] for $s$ in $\mathcal{O}(|\Sigma||s|)$ time and $\mathcal{O}(|s|)$ space.

### Algorithm

0. Let $\pi(i)=\max(E(s_0s_1,\dots s_{i-1})\setminus\{i\})$. Apply the [[Knuth-Morris-Pratt Algorithm]] to find $\pi(1),\pi(2),\dots,\pi(|s|)$.

> [!info] Lemma
> $$
> \forall i\in\{1,2,\dots,|s|\},\forall\sigma\in\Sigma,\delta(i,\sigma)=\begin{cases}
> i+1,&i<|s|\land\sigma=s_i\\
> \delta(\pi(i),\sigma),&\neg(i<|s|\land\sigma=s_i)
> \end{cases}
> $$

1. For $i=1,2\dots,|s|$, apply the lemma to find $\delta(i,\sigma)$ for each $\sigma$ in $\Sigma$.

This algorithm solves the problem in $\mathcal{O}(|\Sigma||s|)$ time and $\mathcal{O}(|s|)$ space.

```c++
void build(const std::string &s) {
	n = s.length();
	auto pi = knuth_morris_pratt(n, s);

	next.assign(n + 1, {});
	for (int i = 0; i <= n; i++) {
		for (char c : alphabet) {
			next[i][c] = i < n && c == s[i] ? i + 1 : next[pi[i]][c];
		}
	}
}
```

## Find

[[Knuth-Morris-Pratt Automaton#Find]] checks if $t$ contains $s$ as a suffix in $\mathcal{O}(|t|)$ time and $\mathcal{O}(1)$ space.

### Algorithm

Running $t$ on $M$ yields an algorithm that solves the problem in $\mathcal{O}(|t|)$ time and $\mathcal{O}(1)$ space.

```c++
bool find(const std::string &t) {
	int o = 0;
	for (char c : t) {
		o = next[o][c];
	}
	return o == n;
}
```
