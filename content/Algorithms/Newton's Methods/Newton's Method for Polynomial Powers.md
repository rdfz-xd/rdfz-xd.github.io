---
tags: [Computer Science]
---

[[Newton's Method for Polynomial Powers]] is an algorithm that computes $f(x)^z\bmod x^n$ for a formal power series $f(x)$ such that $f(0)\ne0$ in $\mathcal{O}(n\log n)$ time and $\mathcal{O}(n)$ space.

### Algorithm

> [!info] Lemma
> $$
> f(x)^z=f(0)^ze^{z\log_e\frac{f(x)}{f(0)}}
> $$
>
> > [!note]- Proof
> > $$
> > \begin{align}
> > f(x)^z&=f(0)^z\left(\frac{f(x)}{f(0)}\right)^z\\
> > &=f(0)^ze^{z\log_e\frac{f(x)}{f(0)}}
> > \end{align}
> > $$

0. Apply [[Newton's Method for Polynomial Logarithms]] to find $\log_e\frac{f(x)}{f(0)}\bmod x^n$.
1. Apply [[Newton's Method for Polynomial Exponentiation]] to find $e^{z\log_e\frac{f(x)}{f(0)}}\bmod x^n$.
2. Apply the lemma to find $f(x)^z\bmod x^n$.

This algorithm solves the problem in $\mathcal{O}(n\log n)$ time and $\mathcal{O}(n)$ space.

```c++
std::vector<std::complex<double>> newton_pow(const std::vector<std::complex<double>> &a, std::complex<double> z, int n) {
	auto c = a[0];

	std::vector x(n, std::complex(0.));
	for (int i = 0; i < std::min(n, int(a.size())); i++) {
		x[i] = a[i] / c;
	}
	x = newton_log(x, n);
	for (int i = 0; i < n; i++) {
		x[i] *= z;
	}
	x = newton_exp(x, n);
	for (int i = 0; i < n; i++) {
		x[i] *= std::pow(c, z);
	}
	return x;
}
```
