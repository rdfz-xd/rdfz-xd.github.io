---
tags: [Computer Science]
---

A [[Fenwick Tree]] maintains an array of $n$ integers $a_0,a_1,\dots,a_{n-1}$ by maintaining
$$
s(i)=\sum_{j=i-\operatorname{lsb}(i)}^{i-1}a_i
$$
which costs a space of $\mathcal{O}(n)$.

## Add

[[Fenwick Tree#Add]] is an algorithm that updates $a_i$ to $a_i+x$ in $\mathcal{O}(\log(n))$ time and $\mathcal{O}(1)$ space.

> [!info] Lemma
> 
> Let $S_i=\{i-\operatorname{lsb}(i),i-\operatorname{lsb}(i)+1,\dots,i-1\}$, then
> $$
>\forall i\in\N,S_i\subseteq S_{i+\operatorname{lsb}(i)}
> $$
> 
> > [!note]- Proof
> >
> > Let $i=2^{k+1}s+2^k$, then $\operatorname{lsb}(i)=2^k,i+\operatorname{lsb}(i)=2^{k+1}(s+1)$.
> >$$
> > \begin{align}
> > i+\operatorname{lsb}(i)=2^{k+1}(s+1)&\implies\operatorname{lsb}(i+\operatorname{lsb}(i))\ge2^{k+1}\\
> > &\iff i+\operatorname{lsb}(i)-\operatorname{lsb}(i+\operatorname{lsb}(i))\le2^{k+1}s\\
> > &\iff i+\operatorname{lsb}(i)-\operatorname{lsb}(i+\operatorname{lsb}(i))\le i-\operatorname{lsb}(i)\\
> > \end{align}
> > $$

> [!info] Lemma
> $$
> \forall i\in\N,\forall j\in\{i+1,i+2,\dots,i+\operatorname{lsb}(i)-1\},S_i\cap S_j=\empty
> $$
>
> > [!note]- Proof
> >
> > Let $i=2^{k+1}s+2^k,j=2^{k+1}s+2^k+t$, then $\operatorname{lsb}(j)=\operatorname{lsb}(t)$.
> >
> > $$
> > \begin{align}
> > j-\operatorname{lsb}(j)&=2^{k+1}s+2^k+t-\operatorname{lsb}(t)\\
> > &\ge2^{k+1}s+2^k\\
> > &=i
> > \end{align}
> > $$

Applying the lemmas yields an algorithm that solves the problem in $\mathcal{O}(\log(n))$ time and $\mathcal{O}(1)$ space.

~~~c++
for (int j = i + 1; j <= n; j += j & -j) {
	s[j] += x;
}
~~~

## Sum

[[Fenwick Tree#Sum]] is an algorithm that computes $\sum_{j=0}^{i-1}a_j$ in $\mathcal{O}(\log(n))$ time and $\mathcal{O}(1)$ space.

> [!info] Lemma
> $$
> \forall i\in\{1,2,\dots,n\},\sum_{j=0}^{i-1}a_j=s(i)+\sum_{j=0}^{i-\operatorname{lsb}(i)-1}a_j
> $$

Applying the lemma yields an algorithm that solves the problem in $\mathcal{O}(\log(n))$ time and $\mathcal{O}(1)$ space.

~~~c++
int res = 0;
for (int j = i; j > 0; j -= j & -j) {
	res += s[j];
}
return res;
~~~