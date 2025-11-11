### Problem 1

Equilateral $\triangle ABC$ with side length $14$ is rotated about its center by angle $\theta$, where $0<\theta<60\degree$, to form $\triangle DEF$. The area of hexagon $ADBECF$ is $91\sqrt3$. What is $\tan(\theta)$?

### Solution 1

Let $O$ be the center of $\triangle ABC$, then it is easy to prove that
$$
\begin{align}
|OA|&=\frac{\sqrt3}{3}|AB|\\
&=\frac{14\sqrt3}{3}
\end{align}
$$
It is easy to prove that
$$
\begin{align}
[ADBECF]&=3[\triangle OAD]+3[\triangle OAF]\\
&=\frac{3}{2}|OA|^2\sin(\theta)+\frac{3}{2}|OA|^2\sin(120\degree-\theta)\\
&=98\sin(\theta)+98\sin(120\degree-\theta)
\end{align}
$$
Therefore,
$$
\begin{align}
[ADBECF]=91\sqrt3&\Longleftrightarrow\sin(\theta)+\sin(120\degree-\theta)=\frac{91\sqrt3}{98}\\
&\Longleftrightarrow\frac{1}{2}\cos(\theta)+\frac{\sqrt3}{2}\sin(\theta)=\frac{91}{98}\\
&\Longleftrightarrow\sin(\theta+30\degree)=\frac{91}{98}\\
&\Longleftrightarrow\tan(\theta+30\degree)=\frac{13\sqrt3}{9}\\
&\Longleftrightarrow\tan(\theta)=\frac{5\sqrt3}{11}\\
\end{align}
$$

### Problem 2

Suppose $A$, $B$ and $C$ are points in the plane with $|AB|=40$ and $|AC|=42$, and let $x$ be the length of the line segment from $A$ to the midpoint of $\overline{BC}$. Define a function $f$ by letting $f(x)$ be the area of $\triangle ABC$. Then the domain of $f$ is an open interval $(p,q)$, and the maximum value $r$ of $f(x)$ occurs at $x=s$. What is $p+q+r+s$?

### Solution 2

Applying the Triangle Inequality yields that $A$, $B$ and $C$ forms a triangle iff
$$
||AB|-|AC||<|BC|<|AB|+|AC|\Longleftrightarrow2<|BC|<82
$$
Applying Apollonius's Theorem yields
$$
\begin{align}
x&=\frac{1}{2}\sqrt{2|AB|^2+2|AC|^2-|BC|^2}\\
&=\frac{1}{2}\sqrt{6728-|BC|^2}\\
\end{align}
$$
Therefore, $A$, $B$ and $C$ forms a triangle iff
$$
1<x<41
$$
Therefore, $p=1,q=41$.
$$
\begin{align}
f(x)&=[\triangle ABC]\\
&=\frac{1}{2}|AB||AC|\sin(\angle BAC)\\
&=840\sin(\angle BAC)
\end{align}
$$

Applying the Pythagorean Theorem yields
$$
\begin{align}
\angle BAC=90\degree&\Longleftrightarrow|AB|^2+|AC|^2=|BC|^2\\
&\Longleftrightarrow|BC|=58\\
&\Longleftrightarrow x=29\\
\end{align}
$$

Therefore, it is easy to prove that $r=840,s=29$. Therefore, $p+q+r+s=911$.

### Problem 3

The measures of the smallest angles of three different right triangles sum to $90\degree$. All three triangles have side lengths that are primitive Pythagorean triples. Two of them are $3-4-5$ and $5-12-13$. What is the perimeter of the third triangle?

### Solution 3

Let the smallest angles of these triangles be $\alpha$, $\beta$ and $\gamma$, respectively. Then

$$
\begin{align}
\tan(\gamma)&=\tan(90\degree-\alpha-\beta)\\
&=\cot(\alpha+\beta)\\
&=\frac{\cot(\alpha)\cot(\beta)-1}{\cot(\alpha)+\cot(\beta)}\\
&=\frac{33}{56}
\end{align}
$$
Therefore, it is easy to prove that the third triangle is a $33-56-65$ triangle. Therefore, the perimeter of the third triangle is $33+56+65=154$.

### Problem 4

Let $\triangle ABC$ be a triangle with integer side lengths and the property that $\angle B=2\angle A$. What is the least possible perimeter of such a triangle?

### Solution 4

Applying the Law of Sines yields
$$
\frac{|AC|}{|BC|}=\frac{\sin(\angle B)}{\sin(\angle A)}
$$
Therefore,
$$
\begin{align}
\angle B=2\angle A&\Longrightarrow\sin(\angle B)=\sin(2\angle A)\\
&\Longleftrightarrow\frac{|AC|}{|BC|}=\frac{\sin(2\angle A)}{\sin(\angle A)}\\
&\Longleftrightarrow\frac{|AC|}{|BC|}=2\cos(\angle A)
\end{align}
$$
Applying the Law of Cosines yields
$$
\cos(\angle A)=\frac{|AB|^2+|AC|^2-|BC|^2}{2|AB||AC|}
$$
Therefore,
$$
\begin{align}
\angle B=2\angle A&\Longrightarrow\frac{|AC|}{|BC|}=\frac{|AB|^2+|AC|^2-|BC|^2}{|AB||AC|}\\
&\Longleftrightarrow|AB|=|BC|\lor|AC|^2=|BC|(|AB|+|BC|)
\end{align}
$$
Therefore, it is easy to prove that if $|AC|<7$, the only triangle with integer side lengths and the property that $\angle B=2\angle A$ is the triangle such that $|AB|=5\land|AC|=6\land|BC|=4$. The perimeter of this triangle is $5+6+4=15$.

Applying the Triangle Inequality yields
$$
|AB|+|BC|>|AC|
$$
Therefore, if $|AC|\ge7$,
$$
\begin{align}
|AB|+|BC|>|AC|&\Longleftrightarrow|AB|+|AC|+|BC|>2|AC|\\
&\Longrightarrow|AB|+|AC|+|BC|\ge15
\end{align}
$$
Therefore, the least perimeter is $15$.

### Problem 5

A right pyramid has regular octagon $ABCDEFGH$ with side length $1$ as its base and apex $V$. Segments $\overline{AV}$ and $\overline{DV}$ are perpendicular. What is the square of the height of the pyramid.

### Solution 5

Let $O$ be the center of the octagon, $X$ be a point on $\overline{BC}$ such that $\overline{OX}\perp\overline{BC}$, $Y$ be a point on $DE$ such that $\overline{OY}\perp\overline{DE}$. Set up a coordinate system by taking $O$ as the origin, $\overrightarrow{OX}$ as the $x$-axis, $\overrightarrow{OY}$ as the $y$-axis, and $\overrightarrow{OV}$ as the $z$-axis. Then it is easy to prove that
$$
\overrightarrow{OA}=\left(\frac{1}{2},-\frac{1+\sqrt2}{2},0\right),\overrightarrow{OD}=\left(\frac{1}{2},-\frac{1+\sqrt2}{2},0\right),\overrightarrow{OV}=(0,0,|OV|)
$$
Therefore,
$$
\begin{align}
\overrightarrow{AV}&=\overrightarrow{OV}-\overrightarrow{OA}\\
&=\left(-\frac{1}{2},\frac{1+\sqrt2}{2},|OV|\right)
\end{align}
$$

$$
\begin{align}
\overrightarrow{DV}&=\overrightarrow{OV}-\overrightarrow{OD}\\
&=\left(-\frac{1}{2},-\frac{1+\sqrt2}{2},|OV|\right)
\end{align}
$$

Therefore,
$$
\begin{align}
AV\perp DV&\Longleftrightarrow\overrightarrow{AV}\cdot\overrightarrow{DV}=0\\
&\Longleftrightarrow-\frac{1+\sqrt2}{2}+|OV|^2=0\\
&\Longleftrightarrow|OV|^2=\frac{1+\sqrt2}{2}
\end{align}
$$
Therefore, the square of the height is $\frac{1+\sqrt2}{2}$.

### Problem 6

What is the number of ordered triples $\langle a,b,c\rangle$ of positive integers, with $a\le b\le c\le9$, such that there exists a (non-degenerate) triangle $\triangle ABC$ with an integer inradius for which $a$, $b$ and $c$ are the lengths of the altitudes from $A$ to $\overline{BC}$, $B$ to $\overline{AC}$, and $C$ to $\overline{AB}$, respectively?

### Solution 6

Let $O$ be the incenter of $\triangle ABC$, $r$ be the length of the inradius of $\triangle ABC$. Then
$$
\begin{align}
[\triangle ABC]&=[\triangle AOB]+[\triangle AOC]+[\triangle BOC]\\
&=\frac{1}{2}(|AB|+|AC|+|BC|)r
\end{align}
$$
Since $[\triangle ABC]=\frac{1}{2}|AB|c$, it follows that
$$
\frac{r}{c}=\frac{|AB|}{|AB|+|AC|+|BC|}
$$
Since $[\triangle ABC]=\frac{1}{2}|AC|b$, it follows that
$$
\frac{r}{b}=\frac{|AC|}{|AB|+|AC|+|BC|}
$$
Since $[\triangle ABC]=\frac{1}{2}|BC|a$, it follows that
$$
\frac{r}{a}=\frac{|BC|}{|AB|+|AC|+|BC|}
$$
Therefore,
$$
\frac{1}{a}+\frac{1}{b}+\frac{1}{c}=\frac{1}{r}
$$
Therefore,
$$
r\in\Z\Longleftrightarrow\frac{1}{\frac{1}{a}+\frac{1}{b}+\frac{1}{c}}\in\Z
$$
Therefore, it is easy to prove that all ordered triples are $\langle3,3,3\rangle$, $\langle6,6,6\rangle$, and $\langle9,9,9\rangle$. Therefore, the number of ordered triples is $3$.

### Problem 7

Cyclic quadrilateral $ABCD$ has lengths $|BC|=|CD|=3$ and $|AD|=5$ with $\angle ADC=120\degree$. What is the length of the shorter diagonal of $ABCD$?

### Solution 7

Applying the Law of Cosines yields
$$
|AC|^2=|AD|^2+|CD|^2-2|AD||CD|\cos(\angle ADC)
$$

$$
|AC|^2=|AD|^2+|CD|^2-2|AD||CD|\cos(\angle ADC)\Longleftrightarrow|AC|=7
$$

Applying the Law of Cosines yields
$$
|AC|^2=|AB|^2+|BC|^2-2|AB||BC|\cos(\angle ABC)
$$
Since
$$
\begin{align}
\angle ABC&=180\degree-\angle ADC\\
&=60\degree
\end{align}
$$
it follows that
$$
|AC|^2=|AB|^2+|BC|^2-2|AB||BC|\cos(\angle ABC)\Longleftrightarrow|AB|=8
$$
Applying Ptolemy's Theorem yields
$$
|AC||BD|=|AB||CD|+|AD||BC|
$$

$$
|AC||BD|=|AB||CD|+|AD||BC|\Longleftrightarrow|BD|=\frac{39}{7}
$$

Therefore, the length of the shorter diagonal is $\min\{|AC|,|BD|\}=\frac{39}{7}$.

### Problem 8

On top of a rectangular card with sides of length $1$ and $2+\sqrt3$, an identical card is placed so that two of their diagonals line up, as shown ($\overline{AC}$, in this case). Continue the process, adding a third card to the second, and so on, lining up successive diagonals after rotating clockwise. In total, how many cards must be used until a vertex of a new card lands exactly on the vertex $B$ in the figure?

![](https://cdn.luogu.com.cn/upload/image_hosting/lkg7x9pz.png)

### Solution 8

Applying the Pythagorean Theorem yields
$$
\begin{align}
|AC|&=\sqrt{|AB|^2+|BC|^2}\\
&=2\sqrt{2+\sqrt3}
\end{align}
$$
Let $D$ be the midpoint of $\overline{AC}$, then
$$
\begin{align}
|AD|&=\frac{1}{2}|AC|\\
&=\sqrt{2+\sqrt3}
\end{align}
$$

$$
\begin{align}
|BD|&=|AD|\\
&=\sqrt{2+\sqrt3}
\end{align}
$$

Applying the Law of Cosines yields
$$
|AB|^2=|AD|^2+|BD|^2-2|AD||BD|\cos(\angle ADB)
$$

$$
\begin{align}
|AB|^2=|AD|^2+|BD|^2-2|AD||BD|\cos(\angle ADB)&\Longleftrightarrow\cos(\angle ADB)=\frac{\sqrt3}{2}\\
&\Longleftrightarrow\angle ADB=30\degree
\end{align}
$$

Therefore, it is easy to prove that $6$ cards must be used.

### Problem 9

$\triangle ABC$ has side lengths in arithmetic progression, and the smallest side has length $6$. If the triangle has an angle of $120\degree$, what is the area of $\triangle ABC$?

### Solution 9

Wlog, assume $|AB|\le|AC|\le|BC|$, then it is easy to prove that $|AB|=6$ and $\angle A=120\degree$.

Applying the Law of Cosines yields
$$
|BC|^2=|AB|^2+|AC|^2-2|AB||AC|\cos(\angle A)
$$
Let $d$ be common difference of the arithmetic progression, then
$$
|BC|^2=|AB|^2+|AC|^2-2|AB||AC|\cos(\angle A)\Longleftrightarrow d=4
$$
Therefore, $|AC|=10$.

Therefore,
$$
\begin{align}
[\triangle ABC]&=\frac{1}{2}\sin(\angle A)|AB||AC|\\
&=15\sqrt3
\end{align}
$$

### Problem 10

A regular pentagon with area $1+\sqrt5$ is printed on paper and cut out. The five vertices of the pentagon are folded into the center of the pentagon, creating a smaller pentagon. What is the area of the new pentagon?

### Solution 10

Let $ABCDE$ be the pentagon, $O$ be the center of $ABCDE$, $M$ be the midpoint of $\overline{OA}$, $N$ be a point on $\overline{AB}$ such that $\overline{ON}\perp\overline{AB}$, $x$ be area of the new pentagon. Then it is easy to prove that
$$
\begin{align}
\frac{[ABCDE]}{x}&=\left(\frac{|ON|}{|OM|}\right)^2\\
&=\left(\frac{2|ON|}{|OA|}\right)^2\\
&=(2\sin(\angle AON))^2\\
&=4\sin(54\degree)^2
\end{align}
$$

Since
$$
\begin{align}
\cos(54\degree)=\sin(36\degree)&\Longleftrightarrow\cos(18\degree)^3-3\sin(18\degree)^2\cos(18\degree)=2\sin(18\degree)\cos(18\degree)\\
&\Longleftrightarrow4\sin(18\degree)^2+2\sin(18\degree)-1=0\\
&\Longleftrightarrow\sin(18\degree)=\frac{-1+\sqrt5}{4}
\end{align}
$$

it follows that
$$
\begin{align}
\sin(54\degree)&=\cos(36\degree)\\
&=1-2\sin(18\degree)^2\\
&=\frac{1+\sqrt5}{4}
\end{align}
$$
Therefore,
$$
\begin{align}
x&=\frac{[ABCDE]}{4\sin(54\degree)^2}\\
&=-1+\sqrt5
\end{align}
$$

### Problem 11

Let $\triangle PQR$ be a triangle with $\angle P=75\degree$ and $\angle Q=60\degree$. A regular hexagon $ABCDEF$ with side length $1$ is drawn inside $\triangle PQR$ so that side $\overline{AB}$ lies on $\overline{PQ}$, side $\overline{CD}$ lies on $\overline{QR}$, and one of the remaining vertices lies on $\overline{PR}$. There are positive integers $a$, $b$, $c$, and $d$ such that the area of $\triangle PQR$ can be expressed in the form $\frac{a+b\sqrt{c}}{d}$, where $a$ and $d$ are relatively prime, and $c$ is not divisible by the square of any prime. Find $a+b+c+d$.

### Solution 11

Applying the Law of Sines yields
$$
\begin{align}
\frac{|PA|}{|PF|}&=\frac{\sin(\angle PFA)}{\sin(\angle APF)}\\
&=\frac{\sin(45\degree)}{\sin(75\degree)}\\
\end{align}
$$
Since
$$
\begin{align}
\sin(75\degree)&=\cos(15\degree)\\
&=\sqrt{\frac{1+\cos(30\degree)}{2}}\\
&=\frac{\sqrt2+\sqrt6}{4}
\end{align}
$$
it follows that
$$
|PA|=-1+\sqrt3
$$
Therefore,
$$
\begin{align}
|PQ|&=|PA|+|AB|+|BQ|\\
&=1+\sqrt3
\end{align}
$$
Since
$$
\angle PAF=\angle Q\Longleftrightarrow\triangle PAF\sim\triangle PQR
$$
it follows that
$$
\begin{align}
\frac{[\triangle PQR]}{[\triangle PAF]}&=\left(\frac{|PQ|}{|PA|}\right)^2\\
&=7+4\sqrt3
\end{align}
$$
Since
$$
\begin{align}
[\triangle PAF]&=\frac{1}{2}\sin(\angle PAF)|PA||AF|\\
&=\frac{3-\sqrt3}{4}
\end{align}
$$
it follows that
$$
[\triangle PQR]=\frac{9+5\sqrt3}{4}
$$
Therefore, $a+b+c+d=21$.

### Problem 12

In the figure below, semicircles with centers at $A$ and $B$ and with radii $2$ and $1$, respectively, are drawn in the interior of, and sharing bases with, a semicircle with diameter $\overline{JK}$. The two smaller semicircles are externally tangent to each other and internally tangent to the largest semicircle. A circle centered at $P$ is drawn externally tangent to the two smaller semicircles and internally tangent to the largest semicircle. What is the radius of the circle centered at $P$?

![](https://cdn.luogu.com.cn/upload/image_hosting/bzyvd5hm.png)

### Solution 12

Let $O$ be the center of the largest semicircle, $r$ be the length of the radius of $\odot P$, then it is easy to prove that $|AB|=3,|OA|=1,|OB|=2,|AP|=2+r,|BP|=1+r,|OP|=3-r$.

Applying Steward's Theorem yields
$$
|AP|^2|OB|+|BP|^2|OA|=|OP|^2|AB|+|OA||OB||AB|
$$

$$
|AP|^2|OB|+|BP|^2|OA|=(|OP|^2+|OA||OB|)|AB|\Longleftrightarrow r=\frac{6}{7}
$$

### Problem 13

Point $B$ is on $\overline{AC}$ with $|AB|=9$ and $|BC|=21$. Point $D$ is not on $\overline{AC}$ so that $|AD|=|CD|$, and $|AD|$ and $|BD|$ are integers. Let $s$ be the sum of all possible perimeters of $\triangle ACD$. Find $s$.

### Solution 13

Let $E$ be the midpoint of $\overline{AC}$, then applying the Pythagorean Theorem yields
$$
|AD|^2-|AE|^2=|DE|^2,|BD|^2-|BE|^2=|DE|^2
$$
Therefore,
$$
(|AD|-|BD|)(|AD|+|BD|)=189
$$
Therefore, it is easy to prove that
$$
|AD|\in\Z\land|BD|\in\Z\Longleftrightarrow|AD|=95\lor|AD|=33\lor|AD|=17
$$
Therefore, $s=380$.

### Problem 14

In $\triangle ABC$, $|AB|=13$, $|AC|=14$, and $|BC|=15$. Point $D$ is on $\overline{BC}$ with $|CD|=6$. Point $E$ is on $\overline{BC}$ such that $\angle BAE=\angle CAD$. Given that $|BE|=\frac{p}{q}$ where $p$ and $q$ are relatively prime positive integers, find $q$.

### Solution 14

$$
\begin{align}
\frac{|BE|}{|CE|}&=\frac{[\triangle ABE]}{[\triangle ACE]}\\
&=\frac{\frac{1}{2}\sin(\angle BAE)|AB||AE|}{\frac{1}{2}\sin(\angle CAE)|AC||AE|}\\
&=\frac{13\sin(\angle BAE)}{14\sin(\angle CAE)}
\end{align}
$$

Since
$$
\begin{align}
\frac{|BD|}{|CD|}&=\frac{[\triangle ABD]}{[\triangle ACD]}\\
&=\frac{\frac{1}{2}\sin(\angle BAD)|AB||AD|}{\frac{1}{2}\sin(\angle CAD)|AC||AD|}\\
&=\frac{13\sin(\angle BAD)}{14\sin(\angle CAD)}
\end{align}
$$
it follows that
$$
\begin{align}
\frac{\sin(\angle BAE)}{\sin(\angle CAE)}&=\frac{\sin(\angle CAD)}{\sin(\angle BAD)}\\
&=\frac{13|CD|}{14|BD|}\\
&=\frac{13}{21}
\end{align}
$$
Therefore,
$$
\frac{|BE|}{|CE|}=\frac{169}{294}
$$

$$
\begin{align}
\frac{|BE|}{|CE|}=\frac{169}{294}&\Longleftrightarrow|BE|=\frac{169}{463}|BC|\\
&\Longleftrightarrow|BE|=\frac{2535}{463}
\end{align}
$$

Therefore, $q=463$.
