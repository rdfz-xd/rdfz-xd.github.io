---
tags: [Computer Science, Computer Science/Automata Theory, Computer Science/Stringology]
---

The [[Subsequence Automaton]] is a data structure that maintains a string $s$ in $\Sigma^*$ by maintaining a deterministic finite automaton that accepts and only accepts subsequences of $s$.

Specifically, let $\delta$ be a function in $\{0,1,\dots,|s|,\perp\}\times\Sigma\to\{0,1,\dots,|s|,\perp\}$ such that
$$
\forall i\in\{0,1,\dots,|s|\},\forall\sigma\in\Sigma,\delta(i,\sigma)=\begin{cases}
\min\{j:j\in\{i,i+1,\dots,|s|-1\}\land s_j=\sigma\}+1,&\exists j\in\{i,i+1,\dots,|s|-1\},s_j=\sigma\\
\perp,&\nexists j\in\{i,i+1,\dots,|s|-1\},s_j=\sigma
\end{cases}\land\forall\sigma\in\Sigma,\delta(\perp,\sigma)=\perp
$$

> [!info] Lemma
>
> For any $t$ in $\Sigma^*$, $\delta(\dots\delta(\delta(0,t_0),t_1)\dots,t_{|t|-1})$ equals the minimum $i$ in $\{0,1,\dots,|s|\}$ such that $t$ is a subsequence of $s_0s_1\dots s_{i-1}$ if $t$ is a subsequence of $s$, or $\perp$ otherwise.

Applying the lemma yields that $M=(\{0,1,\dots,|s|,\perp\},\Sigma,\delta,0,\{0,1,\dots,|s|\})$ is a deterministic finite automaton that accepts and only accepts subsequences of $s$.

This requires $\mathcal{O}(|\Sigma||s|)$ space.

## Build

[[Subsequence Automaton#Build]] builds a [[Subsequence Automaton]] for $s$ in $\mathcal{O}(|\Sigma||s|)$ time and $\mathcal{O}(1)$ space.

### Algorithm

> [!info] Lemma
> $$
> \forall i\in\{0,1,\dots,|s|-1\},\forall\sigma\in\Sigma,\delta(i,\sigma)=\begin{cases}
> i+1,&\sigma=s_i\\
> \delta(i+1,\sigma),&\sigma\ne s_i
> \end{cases}
> $$

For $i=|s|-1,|s|-2,\dots,0$, apply the lemma to find $\delta(i,\sigma)$ for each $\sigma$ in $\Sigma$.

This algorithm solves the problem in $\mathcal{O}(|\Sigma||s|)$ time and $\mathcal{O}(1)$ space.

```c++
void build(const std::string &s) {
	n = s.length();

	next.assign(n + 1, {});
	for (char c : alphabet) {
		next[n][c] = -1;
	}
	for (int i = n - 1; i >= 0; i--) {
		for (char c : alphabet) {
			next[i][c] = c == s[i] ? i + 1 : next[i + 1][c];
		}
	}
}
```

## Find

[[Subsequence Automaton#Find]] checks if $t$ is a subsequence of $s$ in $\mathcal{O}(|t|)$ time and $\mathcal{O}(1)$ space.

### Algorithm

Running $t$ on $M$ yields an algorithm that solves the problem in $\mathcal{O}(|t|)$ time and $\mathcal{O}(1)$ space.

```c++
bool find(const std::string &t) {
	int o = 0;
	for (char c : t) {
		if (next[o][c] == -1) {
			return false;
		}
		o = next[o][c];
	}
	return true;
}
```

