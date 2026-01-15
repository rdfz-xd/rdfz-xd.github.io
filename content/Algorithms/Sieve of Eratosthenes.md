---
tags: [Computer Science]
---

The [[Sieve of Eratosthenes]] is an algorithm that finds all the primes in $2,3,\dots,n$ in $\mathcal{O}(n\log(\log(n)))$ time and $\mathcal{O}(n)$ memory.

### Algorithm

> [!info] Lemma
> $$
> \forall m\in\Z_+\setminus\{1\},m\in\mathbb{P}\Leftrightarrow\forall p\in\{p:p\in\mathbb{P}\land p<m\},p\nmid m
> $$

For $m=2,3,\dots,n$, if $m$ is not marked, mark all the multiples of $m$ greater than $m$. Applying the lemma yields that $m$ is prime iff $m$ is not marked.

This algorithm solves the problem in $\mathcal{O}(n\log(\log(n)))$ time and $\mathcal{O}(n)$ memory.

~~~c++
std::vector f(n + 1, true);
std::vector<int> primes;

for (int i = 2; i <= n; i++) {
	if (f[i]) {
		primes.push_back(i);
		for (int j = 2 * i; j <= n; j += i) {
			f[j] = false;
		}
	}
}

return primes;
~~~

> [!note]- Proof
>
> Let $p_i$ be the $i$-th smallest prime, then
> $$
> \begin{align}
> \mathcal{O}\left(\sum_{i=1}^{\pi(n)}\frac{n}{p_i}\right)&=\mathcal{O}\left(n\sum_{i=2}^{\pi(n)}\frac{1}{i\log(i)}\right)\\
> &=\mathcal{O}\left(n\int_{2}^{\pi(n)}\frac{\mathrm{d}x}{x\log(x)}\right)\\
> &=\mathcal{O}(n\log(\log(n)))
> \end{align}
> $$