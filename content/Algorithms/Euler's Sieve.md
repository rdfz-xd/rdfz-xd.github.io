---
tags: [Computer Science]
---

[[Euler's Sieve]] is an algorithm that finds all the primes in $2,3,\dots,n$ in $\mathcal{O}(n)$ time and $\mathcal{O}(n)$ space.

> [!tip] Hint
>
> This problem can also be solved by the [[Sieve of Eratosthenes]] in $\mathcal{O}(n\log(\log(n)))$ time and $\mathcal{O}(n)$ space.

### Algorithm

> [!info] Lemma
> $$
> \forall m\in\Z_+\setminus\{1\},m\in\mathbb{P}\Leftrightarrow\operatorname{lpf}(m)=m
> $$

For $m=2,3,\dots,n$, mark all $k$ such that $\frac{k}{\operatorname{lpf}(k)}=m$. Applying the lemma yields that $m$ is prime iff $m$ is unmarked.

~~~c++
std::vector f(n + 1, true);
std::vector<int> primes;

for (int i = 2; i <= n; i++) {
	if (f[i]) {
		primes.push_back(i);
	}
	for (int j : primes) {
		if (i * j > n) {
			break;
		}
		f[i * j] = false;
		if (i % j == 0) {
			break;
		}
	}
}

return primes;
~~~

> [!note]- Proof
>
> It is easy to prove that each integer is marked at most once.