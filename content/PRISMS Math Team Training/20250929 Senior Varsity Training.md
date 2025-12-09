---
tags: [Geometry]
---

### Problem 1

Equilateral $\triangle ABC$ with side length $14$ is rotated about its center by angle $\theta$, where $0<\theta<60\degree$, to form $\triangle DEF$. See figure. The area of hexagon $ADBECF$ is $91\sqrt3$. What is $\tan(\theta)$?

![diagram](https://files.catbox.moe/oyhii5.png)

> [!Solution]-
>
> Let $O$ be the center of $\triangle ABC$, then it is easy to prove that
> $$
> \begin{align}
> |OA|&=\frac{\sqrt3}{3}|AB|\\
> &=\frac{14\sqrt3}{3}
> \end{align}
> $$
> It is easy to prove that
> $$
> \begin{align}
> [ADBECF]&=3[\triangle OAD]+3[\triangle OAF]\\
> &=\frac{3}{2}|OA|^2\sin(\theta)+\frac{3}{2}|OA|^2\sin(120\degree-\theta)\\
> &=98\sin(\theta)+98\sin(120\degree-\theta)
> \end{align}
> $$
> Therefore,
> $$
> \begin{align}
> [ADBECF]=91\sqrt3&\Longleftrightarrow\sin(\theta)+\sin(120\degree-\theta)=\frac{91\sqrt3}{98}\\
> &\Longleftrightarrow\frac{1}{2}\cos(\theta)+\frac{\sqrt3}{2}\sin(\theta)=\frac{91}{98}\\
> &\Longleftrightarrow\sin(\theta+30\degree)=\frac{91}{98}\\
> &\Longleftrightarrow\tan(\theta+30\degree)=\frac{13\sqrt3}{9}\\
> &\Longleftrightarrow\tan(\theta)=\frac{5\sqrt3}{11}\\
> \end{align}
> $$
>

### Problem 2

Suppose $A$, $B$ and $C$ are points in the plane with $|AB|=40$ and $|AC|=42$, and let $x$ be the length of the line segment from $A$ to the midpoint of $\overline{BC}$. Define a function $f$ by letting $f(x)$ be the area of $\triangle ABC$. Then the domain of $f$ is an open interval $(p,q)$, and the maximum value $r$ of $f(x)$ occurs at $x=s$. What is $p+q+r+s$?

> [!Solution]-
>
> Applying the **Triangle Inequality** yields that $A$, $B$ and $C$ forms a triangle iff
> $$
> ||AB|-|AC||<|BC|<|AB|+|AC|\Longleftrightarrow2<|BC|<82
> $$
> Applying **Apollonius's Theorem** yields
> $$
> \begin{align}
> x&=\frac{1}{2}\sqrt{2|AB|^2+2|AC|^2-|BC|^2}\\
> &=\frac{1}{2}\sqrt{6728-|BC|^2}\\
> \end{align}
> $$
> Therefore, $A$, $B$ and $C$ forms a triangle iff
> $$
> 1<x<41
> $$
> Therefore, $p=1,q=41$.
> $$
> \begin{align}
> f(x)&=[\triangle ABC]\\
> &=\frac{1}{2}|AB||AC|\sin(\angle BAC)\\
> &=840\sin(\angle BAC)
> \end{align}
> $$
>
> Applying the **Pythagorean Theorem** yields
> $$
> \begin{align}
> \angle BAC=90\degree&\Longleftrightarrow|AB|^2+|AC|^2=|BC|^2\\
> &\Longleftrightarrow|BC|=58\\
> &\Longleftrightarrow x=29\\
> \end{align}
> $$
>
> Therefore, it is easy to prove that $r=840,s=29$. Therefore, $p+q+r+s=911$.

### Problem 3

The measures of the smallest angles of three different right triangles sum to $90\degree$. All three triangles have side lengths that are primitive Pythagorean triples. Two of them are $3-4-5$ and $5-12-13$. What is the perimeter of the third triangle?

> [!Solution]-
>
> Let the smallest angles of these triangles be $\alpha$, $\beta$ and $\gamma$, respectively. Then
>
> $$
> \begin{align}
> \tan(\gamma)&=\tan(90\degree-\alpha-\beta)\\
> &=\cot(\alpha+\beta)\\
> &=\frac{\cot(\alpha)\cot(\beta)-1}{\cot(\alpha)+\cot(\beta)}\\
> &=\frac{33}{56}
> \end{align}
> $$
> Therefore, it is easy to prove that the third triangle is a $33-56-65$ triangle. Therefore, the perimeter of the third triangle is $33+56+65=154$.

### Problem 4

Let $\triangle ABC$ be a triangle with integer side lengths and the property that $\angle B=2\angle A$. What is the least possible perimeter of such a triangle?

> [!Solution]-
>
> Applying the **Law of Sines** yields
> $$
> \frac{|AC|}{|BC|}=\frac{\sin(\angle B)}{\sin(\angle A)}
> $$
> Therefore,
> $$
> \begin{align}
> \angle B=2\angle A&\Longrightarrow\sin(\angle B)=\sin(2\angle A)\\
> &\Longleftrightarrow\frac{|AC|}{|BC|}=\frac{\sin(2\angle A)}{\sin(\angle A)}\\
> &\Longleftrightarrow\frac{|AC|}{|BC|}=2\cos(\angle A)
> \end{align}
> $$
> Applying the **Law of Cosines** yields
> $$
> \cos(\angle A)=\frac{|AB|^2+|AC|^2-|BC|^2}{2|AB||AC|}
> $$
> Therefore,
> $$
> \begin{align}
> \angle B=2\angle A&\Longrightarrow\frac{|AC|}{|BC|}=\frac{|AB|^2+|AC|^2-|BC|^2}{|AB||AC|}\\
> &\Longleftrightarrow|AB|=|BC|\lor|AC|^2=|BC|(|AB|+|BC|)
> \end{align}
> $$
> Therefore, it is easy to prove that if $|AC|<7$, the only triangle with integer side lengths and the property that $\angle B=2\angle A$ is the triangle such that $|AB|=5\land|AC|=6\land|BC|=4$. The perimeter of this triangle is $5+6+4=15$.
>
> Applying the **Triangle Inequality** yields
> $$
> |AB|+|BC|>|AC|
> $$
> Therefore, if $|AC|\ge7$,
> $$
> \begin{align}
> |AB|+|BC|>|AC|&\Longleftrightarrow|AB|+|AC|+|BC|>2|AC|\\
> &\Longrightarrow|AB|+|AC|+|BC|\ge15
> \end{align}
> $$
> Therefore, the least perimeter is $15$.

### Problem 5

A right pyramid has regular octagon $ABCDEFGH$ with side length $1$ as its base and apex $V$. Segments $\overline{AV}$ and $\overline{DV}$ are perpendicular. What is the square of the height of the pyramid?

> [!Solution]-
>
> Let $O$ be the center of the octagon, $X$ be a point on $\overline{BC}$ such that $\overline{OX}\perp\overline{BC}$, $Y$ be a point on $DE$ such that $\overline{OY}\perp\overline{DE}$. Set up a coordinate system by taking $O$ as the origin, $\overrightarrow{OX}$ as the $x$-axis, $\overrightarrow{OY}$ as the $y$-axis, and $\overrightarrow{OV}$ as the $z$-axis. Then it is easy to prove that
> $$
> \overrightarrow{OA}=\left(\frac{1}{2},-\frac{1+\sqrt2}{2},0\right),\overrightarrow{OD}=\left(\frac{1}{2},-\frac{1+\sqrt2}{2},0\right),\overrightarrow{OV}=(0,0,|OV|)
> $$
> Therefore,
> $$
> \begin{align}
> \overrightarrow{AV}&=\overrightarrow{OV}-\overrightarrow{OA}\\
> &=\left(-\frac{1}{2},\frac{1+\sqrt2}{2},|OV|\right)
> \end{align}
> $$
>
> $$
> \begin{align}
> \overrightarrow{DV}&=\overrightarrow{OV}-\overrightarrow{OD}\\
> &=\left(-\frac{1}{2},-\frac{1+\sqrt2}{2},|OV|\right)
> \end{align}
> $$
>
> Therefore,
> $$
> \begin{align}
> AV\perp DV&\Longleftrightarrow\overrightarrow{AV}\cdot\overrightarrow{DV}=0\\
> &\Longleftrightarrow-\frac{1+\sqrt2}{2}+|OV|^2=0\\
> &\Longleftrightarrow|OV|^2=\frac{1+\sqrt2}{2}
> \end{align}
> $$
> Therefore, the square of the height is $\frac{1+\sqrt2}{2}$.

### Problem 6

What is the number of ordered triples $\langle a,b,c\rangle$ of positive integers, with $a\le b\le c\le9$, such that there exists a (non-degenerate) triangle $\triangle ABC$ with an integer inradius for which $a$, $b$ and $c$ are the lengths of the altitudes from $A$ to $\overline{BC}$, $B$ to $\overline{AC}$, and $C$ to $\overline{AB}$, respectively?

> [!Solution]-
>
> Let $O$ be the incenter of $\triangle ABC$, $r$ be the length of the inradius of $\triangle ABC$. Then
> $$
> \begin{align}
> [\triangle ABC]&=[\triangle AOB]+[\triangle AOC]+[\triangle BOC]\\
> &=\frac{1}{2}(|AB|+|AC|+|BC|)r
> \end{align}
> $$
> Since $[\triangle ABC]=\frac{1}{2}|AB|c$, it follows that
> $$
> \frac{r}{c}=\frac{|AB|}{|AB|+|AC|+|BC|}
> $$
> Since $[\triangle ABC]=\frac{1}{2}|AC|b$, it follows that
> $$
> \frac{r}{b}=\frac{|AC|}{|AB|+|AC|+|BC|}
> $$
> Since $[\triangle ABC]=\frac{1}{2}|BC|a$, it follows that
> $$
> \frac{r}{a}=\frac{|BC|}{|AB|+|AC|+|BC|}
> $$
> Therefore,
> $$
> \frac{1}{a}+\frac{1}{b}+\frac{1}{c}=\frac{1}{r}
> $$
> Therefore,
> $$
> r\in\Z\Longleftrightarrow\frac{1}{\frac{1}{a}+\frac{1}{b}+\frac{1}{c}}\in\Z
> $$
> Therefore, it is easy to prove that all ordered triples are $\langle3,3,3\rangle$, $\langle6,6,6\rangle$, and $\langle9,9,9\rangle$. Therefore, the number of ordered triples is $3$.

### Problem 7

Cyclic quadrilateral $ABCD$ has lengths $|BC|=|CD|=3$ and $|AD|=5$ with $\angle ADC=120\degree$. What is the length of the shorter diagonal of $ABCD$?

> [!Solution]-
>
> Applying the **Law of Cosines** yields
> $$
> |AC|^2=|AD|^2+|CD|^2-2|AD||CD|\cos(\angle ADC)
> $$
>
> $$
> |AC|^2=|AD|^2+|CD|^2-2|AD||CD|\cos(\angle ADC)\Longleftrightarrow|AC|=7
> $$
>
> Applying the **Law of Cosines** yields
> $$
> |AC|^2=|AB|^2+|BC|^2-2|AB||BC|\cos(\angle ABC)
> $$
> Since
> $$
> \begin{align}
> \angle ABC&=180\degree-\angle ADC\\
> &=60\degree
> \end{align}
> $$
> it follows that
> $$
> |AC|^2=|AB|^2+|BC|^2-2|AB||BC|\cos(\angle ABC)\Longleftrightarrow|AB|=8
> $$
> Applying **Ptolemy's Theorem** yields
> $$
> |AC||BD|=|AB||CD|+|AD||BC|
> $$
>
> $$
> |AC||BD|=|AB||CD|+|AD||BC|\Longleftrightarrow|BD|=\frac{39}{7}
> $$
>
> Therefore, the length of the shorter diagonal is $\min\{|AC|,|BD|\}=\frac{39}{7}$.

### Problem 8

On top of a rectangular card with sides of length $1$ and $2+\sqrt3$, an identical card is placed so that two of their diagonals line up, as shown ($\overline{AC}$, in this case). Continue the process, adding a third card to the second, and so on, lining up successive diagonals after rotating clockwise. In total, how many cards must be used until a vertex of a new card lands exactly on the vertex $B$ in the figure?

![diagram](https://files.catbox.moe/cjzqi4.png)

> [!Solution]-
>
> Applying the **Pythagorean Theorem** yields
> $$
> \begin{align}
> |AC|&=\sqrt{|AB|^2+|BC|^2}\\
> &=2\sqrt{2+\sqrt3}
> \end{align}
> $$
> Let $D$ be the midpoint of $\overline{AC}$, then
> $$
> \begin{align}
> |AD|&=\frac{1}{2}|AC|\\
> &=\sqrt{2+\sqrt3}
> \end{align}
> $$
>
> $$
> \begin{align}
> |BD|&=|AD|\\
> &=\sqrt{2+\sqrt3}
> \end{align}
> $$
>
> Applying the **Law of Cosines** yields
> $$
> |AB|^2=|AD|^2+|BD|^2-2|AD||BD|\cos(\angle ADB)
> $$
>
> $$
> \begin{align}
> |AB|^2=|AD|^2+|BD|^2-2|AD||BD|\cos(\angle ADB)&\Longleftrightarrow\cos(\angle ADB)=\frac{\sqrt3}{2}\\
> &\Longleftrightarrow\angle ADB=30\degree
> \end{align}
> $$
>
> Therefore, it is easy to prove that $6$ cards must be used.

### Problem 9

Triangle $\triangle ABC$ has side lengths in arithmetic progression, and the smallest side has length $6$. If the triangle has an angle of $120\degree$, what is the area of $\triangle ABC$?

> [!Solution]-
>
> Wlog, assume $|AB|\le|AC|\le|BC|$, then it is easy to prove that $|AB|=6$ and $\angle A=120\degree$.
>
> Applying the **Law of Cosines** yields
> $$
> |BC|^2=|AB|^2+|AC|^2-2|AB||AC|\cos(\angle A)
> $$
> Let $d$ be common difference of the arithmetic progression, then
> $$
> |BC|^2=|AB|^2+|AC|^2-2|AB||AC|\cos(\angle A)\Longleftrightarrow d=4
> $$
> Therefore, $|AC|=10$.
>
> Therefore,
> $$
> \begin{align}
> [\triangle ABC]&=\frac{1}{2}\sin(\angle A)|AB||AC|\\
> &=15\sqrt3
> \end{align}
> $$
>

### Problem 10

A regular pentagon with area $1+\sqrt5$ is printed on paper and cut out. The five vertices of the pentagon are folded into the center of the pentagon, creating a smaller pentagon. What is the area of the new pentagon?

> [!Solution]-
>
> Let $ABCDE$ be the pentagon, $O$ be the center of $ABCDE$, $M$ be the midpoint of $\overline{OA}$, $N$ be a point on $\overline{AB}$ such that $\overline{ON}\perp\overline{AB}$, $x$ be area of the new pentagon. Then it is easy to prove that
> $$
> \begin{align}
> \frac{[ABCDE]}{x}&=\left(\frac{|ON|}{|OM|}\right)^2\\
> &=\left(\frac{2|ON|}{|OA|}\right)^2\\
> &=(2\sin(\angle AON))^2\\
> &=4\sin(54\degree)^2
> \end{align}
> $$
>
> Since
> $$
> \begin{align}
> \cos(54\degree)=\sin(36\degree)&\Longleftrightarrow\cos(18\degree)^3-3\sin(18\degree)^2\cos(18\degree)=2\sin(18\degree)\cos(18\degree)\\
> &\Longleftrightarrow4\sin(18\degree)^2+2\sin(18\degree)-1=0\\
> &\Longleftrightarrow\sin(18\degree)=\frac{-1+\sqrt5}{4}
> \end{align}
> $$
>
> it follows that
> $$
> \begin{align}
> \sin(54\degree)&=\cos(36\degree)\\
> &=1-2\sin(18\degree)^2\\
> &=\frac{1+\sqrt5}{4}
> \end{align}
> $$
> Therefore,
> $$
> \begin{align}
> x&=\frac{[ABCDE]}{4\sin(54\degree)^2}\\
> &=-1+\sqrt5
> \end{align}
> $$
>

### Problem 11

Let $\triangle PQR$ be a triangle with $\angle P=75\degree$ and $\angle Q=60\degree$. A regular hexagon $ABCDEF$ with side length $1$ is drawn inside $\triangle PQR$ so that side $\overline{AB}$ lies on $\overline{PQ}$, side $\overline{CD}$ lies on $\overline{QR}$, and one of the remaining vertices lies on $\overline{PR}$. There are positive integers $a$, $b$, $c$, and $d$ such that the area of $\triangle PQR$ can be expressed in the form $\frac{a+b\sqrt{c}}{d}$, where $a$ and $d$ are relatively prime, and $c$ is not divisible by the square of any prime. Find $a+b+c+d$.

> [!Solution]-
>
> Applying the **Law of Sines** yields
> $$
> \begin{align}
> \frac{|PA|}{|PF|}&=\frac{\sin(\angle PFA)}{\sin(\angle APF)}\\
> &=\frac{\sin(45\degree)}{\sin(75\degree)}\\
> \end{align}
> $$
> Since
> $$
> \begin{align}
> \sin(75\degree)&=\cos(15\degree)\\
> &=\sqrt{\frac{1+\cos(30\degree)}{2}}\\
> &=\frac{\sqrt2+\sqrt6}{4}
> \end{align}
> $$
> it follows that
> $$
> |PA|=-1+\sqrt3
> $$
> Therefore,
> $$
> \begin{align}
> |PQ|&=|PA|+|AB|+|BQ|\\
> &=1+\sqrt3
> \end{align}
> $$
> Since
> $$
> \angle PAF=\angle Q\Longleftrightarrow\triangle PAF\sim\triangle PQR
> $$
> it follows that
> $$
> \begin{align}
> \frac{[\triangle PQR]}{[\triangle PAF]}&=\left(\frac{|PQ|}{|PA|}\right)^2\\
> &=7+4\sqrt3
> \end{align}
> $$
> Since
> $$
> \begin{align}
> [\triangle PAF]&=\frac{1}{2}\sin(\angle PAF)|PA||AF|\\
> &=\frac{3-\sqrt3}{4}
> \end{align}
> $$
> it follows that
> $$
> [\triangle PQR]=\frac{9+5\sqrt3}{4}
> $$
> Therefore, $a+b+c+d=21$.

### Problem 12

In the figure below, semicircles with centers at $A$ and $B$ and with radii $2$ and $1$, respectively, are drawn in the interior of, and sharing bases with, a semicircle with diameter $\overline{JK}$. The two smaller semicircles are externally tangent to each other and internally tangent to the largest semicircle. A circle centered at $P$ is drawn externally tangent to the two smaller semicircles and internally tangent to the largest semicircle. What is the radius of the circle centered at $P$?

![diagram](https://files.catbox.moe/8okvek.png)

> [!Solution]-
>
> Let $O$ be the center of the largest semicircle, $r$ be the length of the radius of $\odot P$, then it is easy to prove that $|AB|=3,|OA|=1,|OB|=2,|AP|=2+r,|BP|=1+r,|OP|=3-r$.
>
> Applying **Steward's Theorem** yields
> $$
> |AP|^2|OB|+|BP|^2|OA|=|OP|^2|AB|+|OA||OB||AB|
> $$
>
> $$
> |AP|^2|OB|+|BP|^2|OA|=(|OP|^2+|OA||OB|)|AB|\Longleftrightarrow r=\frac{6}{7}
> $$
>

### Problem 13

Point $B$ is on $\overline{AC}$ with $|AB|=9$ and $|BC|=21$. Point $D$ is not on $\overline{AC}$ so that $|AD|=|CD|$, and $|AD|$ and $|BD|$ are integers. Let $s$ be the sum of all possible perimeters of $\triangle ACD$. Find $s$.

> [!Solution]-
>
> Let $E$ be the midpoint of $\overline{AC}$, then applying the **Pythagorean Theorem** yields
> $$
> |AD|^2-|AE|^2=|DE|^2,|BD|^2-|BE|^2=|DE|^2
> $$
> Therefore,
> $$
> (|AD|-|BD|)(|AD|+|BD|)=189
> $$
> Therefore, it is easy to prove that
> $$
> |AD|\in\Z\land|BD|\in\Z\Longleftrightarrow|AD|=95\lor|AD|=33\lor|AD|=17
> $$
> Therefore, $s=380$.

### Problem 14

In $\triangle ABC$, $|AB|=13$, $|AC|=14$, and $|BC|=15$. Point $D$ is on $\overline{BC}$ with $|CD|=6$. Point $E$ is on $\overline{BC}$ such that $\angle BAE=\angle CAD$. Given that $|BE|=\frac{p}{q}$ where $p$ and $q$ are relatively prime positive integers, find $q$.

> [!Solution]-
>
> 
> $$
> \begin{align}
> \frac{|BE|}{|CE|}&=\frac{[\triangle ABE]}{[\triangle ACE]}\\
> &=\frac{\frac{1}{2}\sin(\angle BAE)|AB||AE|}{\frac{1}{2}\sin(\angle CAE)|AC||AE|}\\
> &=\frac{13\sin(\angle BAE)}{14\sin(\angle CAE)}
> \end{align}
> $$
>
> Since
> $$
> \begin{align}
> \frac{|BD|}{|CD|}&=\frac{[\triangle ABD]}{[\triangle ACD]}\\
> &=\frac{\frac{1}{2}\sin(\angle BAD)|AB||AD|}{\frac{1}{2}\sin(\angle CAD)|AC||AD|}\\
> &=\frac{13\sin(\angle BAD)}{14\sin(\angle CAD)}
> \end{align}
> $$
> it follows that
> $$
> \begin{align}
> \frac{\sin(\angle BAE)}{\sin(\angle CAE)}&=\frac{\sin(\angle CAD)}{\sin(\angle BAD)}\\
> &=\frac{13|CD|}{14|BD|}\\
> &=\frac{13}{21}
> \end{align}
> $$
> Therefore,
> $$
> \frac{|BE|}{|CE|}=\frac{169}{294}
> $$
>
> $$
> \begin{align}
> \frac{|BE|}{|CE|}=\frac{169}{294}&\Longleftrightarrow|BE|=\frac{169}{463}|BC|\\
> &\Longleftrightarrow|BE|=\frac{2535}{463}
> \end{align}
> $$
>
> Therefore, $q=463$.

### Problem 15

A paper equilateral triangle $\triangle ABC$ has side length $12$. The paper triangle is folded so that vertex $A$ touches a point on side $\overline{BC}$ a distance $9$ from point $B$. The length of the line segment along which the triangle is folded can be written as $\frac{m\sqrt p}{n}$, where $m$, $n$, and $p$ are positive integers, $m$ and $n$ are relatively prime, and $p$ is not divisible by the square of any prime. Find $m+n+p$.

> [!Solution]-
>
> Let $D$ be the point on $\overline{BC}$, $M$ be the point on $\overline{AB}$. Then applying the **Law of Cosines** yields
> $$
> |MD|^2=|MB|^2+|BD|^2+2|MB||BD|\cos(\angle B)
> $$
>
> $$
> |MD|^2=|MB|^2+|BD|^2+2|MB||BD|\cos(\angle B)\Longleftrightarrow|AM|=\frac{39}{5}
> $$
>
> Let $N$ be the point on $\overline{AC}$, then applying the **Law of Cosines** yields
> $$
> |ND|^2=|NC|^2+|CD|^2+2|NC||CD|\cos(\angle C)
> $$
>
> $$
> |ND|^2=|NC|^2+|CD|^2+2|NC||CD|\cos(\angle C)\Longleftrightarrow|AN|=\frac{39}{7}
> $$
>
> Applying the **Law of Cosines** yields
> $$
> \begin{align}
> |MN|&=\sqrt{|AM|^2+|AN|^2+2|AM||AN|\cos(\angle A)}\\
> &=\frac{39\sqrt{39}}{35}
> \end{align}
> $$
> Therefore, $m+n+p=113$.

### Problem 16

Let $\triangle ABC$ be an acute triangle with circumcenter $O$ and centroid $G$. Let $X$ be the intersection of the line tangent to the circumcircle of $\triangle ABC$ at $A$ and the line perpendicular to $\overline{GO}$ at $G$. Let $Y$ be the intersection of lines $\overleftrightarrow{XG}$ and $\overleftrightarrow{BC}$. Given that the measures of $\angle ABC$, $\angle ACB$, and $\angle XOY$ are in the ratio $13:2:17$, the degree measure of $\angle BAC$ can be written as $\frac{m}{n}$, where $m$ and $n$ are relatively prime positive integers. Find $m+n$.

> [!Solution]-
>
> Since $\angle XGO=\angle XAO$, it follows that $XOGA$ is cyclic. Since $XOGA$ is cyclic, it follows that $\angle GAO=\angle GXO$.
>
> Let $M$ be the midpoint of $\overline{BC}$, then since $\angle YMO+\angle YGO=180\degree$, it follows that $MOGY$ is cyclic. Since $MOGY$ is cyclic, it follows that $\angle GMO=\angle GYO$.
> $$
> \begin{align}
> \angle GAO=\angle GXO\land\angle GMO=\angle GYO&\Longleftrightarrow\triangle AOM\sim\triangle XOY\\
> &\Longrightarrow\angle AOM=\angle XOY
> \end{align}
> $$
> Therefore,
> $$
> \begin{align}
> \angle BAC&=\frac{1}{2}\angle BOC\\
> &=\angle BOM\\
> &=\angle AOM-\angle AOB\\
> &=\angle XOY-2\angle ACB
> \end{align}
> $$
> Therefore,
> $$
> \begin{align}
> \angle ABC:\angle ACB:\angle XOY=13:2:17&\Longleftrightarrow\angle BAC:\angle ABC:\angle ACB=13:13:2\\
> &\Longrightarrow\angle BAC=\frac{585}{7}\degree
> \end{align}
> $$
> Therefore, $m+n=592$.

### Problem 17

In $\triangle ABC$ we have $|AB|=7,|AC|=8,|BC|=9$. Point $D$ is on the circumscribed circle of the triangle so that $\overline{AD}$ bisects $\angle BAC$. What is the value of $\frac{|AD|}{|CD|}$?

> [!Solution]-
> $$
> \begin{align}
> \angle BAD=\angle CAD&\Longleftrightarrow\angle BCD=\angle CBD\\
> &\Longleftrightarrow|BD|=|CD|
> \end{align}
> $$
>
> Therefore, applying **Ptolemy's Theorem** yields
> $$
> |AB||CD|+|AC||BD|=|AD||BC|\Longleftrightarrow\frac{|AD|}{|CD|}=\frac{5}{3}
> $$
>

### Problem 18

Two externally tangent circles $\omega_1$ and $\omega_2$ have centers $O_1$ and $O_2$, respectively. A third circle $\Omega$ passing through $O_1$ and $O_2$ intersects $\omega_1$ at $B$ and $C$ and $\omega_2$ at $A$ and $D$, as shown. Suppose that $|AB|=2,|O_1O_2|=15,|CD|=16$, and $ABO_1CDO_2$ is a convex hexagon. Find the area of this hexagon.

![diagram](https://files.catbox.moe/d5ti9o.png)

> [!Solution]-
>
> Let $A'$ and $B'$ be the reflections of $A$ and $B$, respectively, about the perpendicular bisector of $\overline{O_1O_2}$. Then it is easy to prove that $A'$ and $B'$ are on $\Omega$ and $O_1O_2AB\cong O_2O_1A'B'$.
> $$
> \begin{align}
> |O_1A'|&=|O_2A|\\
> &=|O_2D|
> \end{align}
> $$
> Since
> $$
> \begin{align}
> |O_1A'|=|O_2D|&\Longleftrightarrow\widehat{O_1A'}=\widehat{O_2D}\\
> &\Longleftrightarrow\angle O_1O_2A'=\angle O_2O_1D\\
> &\Longleftrightarrow\overline{O_2A'}\parallel\overline{O_1D}
> \end{align}
> $$
> it follows that $O_1A'O_2D$ is an isosceles trapezoid.
>
> Therefore,
> $$
> \begin{align}
> |A'D|&=|O_1O_2|\\
> &=15
> \end{align}
> $$
>
> $$
> \begin{align}
> |O_2B'|&=|O_1B|\\
> &=|O_1C|
> \end{align}
> $$
>
> Since
> $$
> \begin{align}
> |O_2B'|=|O_1C|&\Longleftrightarrow\widehat{O_2B'}=\widehat{O_1C}\\
> &\Longleftrightarrow\angle O_1B'C=\angle O_2CB'\\
> &\Longleftrightarrow\overline{O_1B'}\parallel\overline{O_2C}
> \end{align}
> $$
> it follows that $O_1B'O_2C$ is an isosceles trapezoid.
>
> Therefore,
> $$
> \begin{align}
> |B'C|&=|O_1O_2|\\
> &=15
> \end{align}
> $$
>
> $$
> \widehat{O_1A'}=\widehat{O_2D}\Longleftrightarrow\angle O_1CA'=\angle O_2B'D
> $$
>
> $$
> \widehat{O_1C}=\widehat{O_2B'}\Longleftrightarrow\angle O_1A'C=\angle O_2DB'
> $$
>
> Since
> $$
> \begin{align}
> \angle O_1CA'=\angle O_2B'D\land\angle O_1A'C=\angle O_2DB'\land|O_1A'|=|O_2D|&\Longleftrightarrow\triangle O_1A'C\cong\triangle O_2DB'\\
> &\Longrightarrow|A'C|=|B'D|\\
> &\Longleftrightarrow\widehat{A'C}=\widehat{B'D}\\
> &\Longleftrightarrow\angle A'B'C=\angle B'CD\\
> &\Longleftrightarrow\overline{A'B'}\parallel\overline{CD}
> \end{align}
> $$
> it follows that $A'B'DC$ is an isosceles trapezoid.
>
> Therefore, applying **Ptolemy's Theorem** yields
> $$
> |A'B'||CD|+|A'C||B'D|=|A'D||B'C|
> $$
>
> $$
> |A'B'||CD|+|A'C||B'D|=|A'D||B'C|\Longleftrightarrow|A'C|=\sqrt{193}
> $$
>
> Therefore, applying the **Law of Cosines** yields
> $$
> \begin{align}
> \cos(\angle A'B'C)&=\frac{|A'B'|^2+|B'C|^2-|A'C|^2}{2|A'B'||B'C|}\\
> &=\frac{3}{5}
> \end{align}
> $$
>
> $$
> \cos(\angle A'B'C)=\frac{3}{5}\Longleftrightarrow\sin(\angle A'B'C)=\frac{4}{5}
> $$
>
> Let $E$ be perpendicular foot from $C$ to $\overleftrightarrow{A'B'}$, then it follows that
> $$
> \begin{align}
> |CE|&=|B'C|\sin(\angle A'B'C)\\
> &=12
> \end{align}
> $$
> Therefore,
> $$
> \begin{align}
> [A'B'DC]&=\frac{1}{2}(|A'B'|+|CD|)|CE|\\
> &=108
> \end{align}
> $$
> Let $r_1$ and $r_2$ be the radius of $\omega_1$ and $\omega_2$, respectively. Then it follows that
> $$
> \begin{align}
> r_1+r_2&=|O_1O_2|\\
> &=15
> \end{align}
> $$
> Applying the **Law of Cosines** yields
> $$
> |A'C|^2=|O_1A'|^2+|O_1C|^2-2|O_1A'||O_1C|\cos(\angle A'O_1C)
> $$
> Since
> $$
> \begin{align}
> \cos(\angle A'O_1C)&=\cos(180\degree-\angle A'B'C)\\
> &=-\cos(\angle A'B'C)\\
> &=-\frac{3}{5}
> \end{align}
> $$
> it follows that
> $$
> r_1r_2=40
> $$
> Since
> $$
> \begin{align}
> \sin(\angle A'O_1C)&=\cos(180\degree-\angle A'B'C)\\
> &=\sin(\angle A'B'C)\\
> &=\frac{4}{5}
> \end{align}
> $$
> it follows that
> $$
> \begin{align}
> [\triangle O_1A'C]&=\frac{1}{2}\sin(\angle A'O_1C)|O_1A'||O_1C|\\
> &=\frac{2}{5}r_1r_2\\
> &=16
> \end{align}
> $$
> Therefore,
> $$
> \begin{align}
> [\triangle O_2DB']&=[\triangle O_1A'C]\\
> &=16
> \end{align}
> $$
> Therefore,
> $$
> \begin{align}
> [ABO_1CDO_2]&=[O_1O_2AB]+[O_1O_2CD]\\
> &=[O_2O_1A'B']+[O_1O_2CD]\\
> &=[O_1A'B'O_2DC]\\
> &=[A'B'DC]+[\triangle O_1A'C]+[\triangle O_2DB']\\
> &=140
> \end{align}
> $$
>

### Problem 19

Quadrilateral $ABCD$ is inscribed in $\odot O$ and has side lengths $|AB|=3$, $|BC|=2$, $|CD|=6$, and $|AD|=8$. Let $X$ and $Y$ be points on $\overline{BD}$ such that $\frac{|DX|}{|BD|}=\frac{1}{4}$ and $\frac{|BY|}{|BD|}=\frac{11}{36}$. Let $E$ be the intersection of line $\overleftrightarrow{AX}$ and the line through $Y$ parallel to $\overline{AD}$. Let $F$ be the intersection of the line $\overleftrightarrow{CX}$ and the line through $E$ parallel to $\overleftrightarrow{AC}$. Let $G$ be the point on $\odot O$ other than $C$ that lies on line $\overleftrightarrow{CX}$. What is $|FX||GX|$?

> [!Solution]-
>
> 
> $$
> \begin{align}
> \overline{EY}\parallel\overline{AG}&\Longleftrightarrow\triangle ADX\sim\triangle EYX\\
> &\Longrightarrow\frac{|AX|}{|EX|}=\frac{DX}{XY}\\
> &\Longleftrightarrow\frac{|AX|}{|EX|}=\frac{9}{16}
> \end{align}
> $$
>
>  Therefore,
> $$
> \begin{align}
> \overline{AC}\parallel\overline{EF}&\Longleftrightarrow\triangle ACX\sim\triangle EFX\\
> &\Longrightarrow\frac{|CX|}{|FX|}=\frac{|AX|}{|EX|}\\
> &\Longleftrightarrow\frac{|CX|}{|FX|}=\frac{9}{16}
> \end{align}
> $$
> Applying the **Law of Cosines** yields
> $$
> \begin{align}
> |BD|^2&=|AB|^2+|AD|^2-2|AB||AD|\cos(\angle BAD)\\
> &=73-48\cos(\angle BAD)
> \end{align}
> $$
> Applying the **Law of Cosines** yields
> $$
> \begin{align}
> |BD|^2&=|BC|^2+|CD|^2-2|BC||CD|\cos(\angle BCD)\\
> &=40-24\cos(\angle BCD)\\
> &=40+24\cos(\angle BAD)
> \end{align}
> $$
> Therefore,
> $$
> |BD|=\sqrt{51}
> $$
> Therefore,
> $$
> \begin{align}
> |DX|&=\frac{1}{4}|BD|\\
> &=\frac{\sqrt{51}}{4}
> \end{align}
> $$
> Therefore,
> $$
> \begin{align}
> |BX|&=|BD|-|DX|\\
> &=\frac{3\sqrt{51}}{4}
> \end{align}
> $$
> Applying the **Power of a Point Theorem** yields
> $$
> \begin{align}
> |CX||GX|&=|BX||DX|\\
> &=\frac{153}{16}
> \end{align}
> $$
> Therefore,
> $$
> \begin{align}
> |FX||GX|&=\frac{|FX|}{|CX|}|CX||GX|\\
> &=17
> \end{align}
> $$
>

### Problem 20

In $\triangle ABC$, $\angle A=40\degree$, $|AB|=10$, and $|AC|=6$. Points $D$ and $E$ lie on $\overline{AB}$ and $\overline{AC}$ respectively. What is the minimum possible value of $|BE|+|DE|+|CD|$?

> [!Solution]-
>
> Let $B'$ be the reflection of $B$ about $\overleftrightarrow{AC}$, then $|B'E|=|BE|$. Let $C'$ be the reflection of $C$ about $\overleftrightarrow{AB}$, then $|C'D|=|CD|$.
>
> Since applying the **Law of Cosines** yields
> $$
> \begin{align}
> |B'C'|&=\sqrt{|AB'|^2+|AC'|^2-2|AB'||AC'|\cos(\angle B'AC')}\\
> &=14
> \end{align}
> $$
> it follows that
> $$
> \begin{align}
> \min(|BE|+|DE|+|CD|)&=\min(|B'E|+|DE|+|C'D|)\\
> &=|B'C'|\\
> &=14
> \end{align}
> $$
>

### Problem 21

Cube $ABCDEFGH$, labeled as shown below, has edge length of $1$ and is cut by a plane passing through vertex $D$ and the midpoints $M$ and $N$ of $\overline{AB}$ and $\overline{CG}$ respectively. The plane divides the cube into two solids. The volume of the larger of the two solids can be written in the form $\frac{p}{q}$, where $p$ and $q$ are relatively prime positive integers. Find $p+q$.

![diagram](https://files.catbox.moe/tny4dm.png)

> [!Solution]-
>
> Set up a coordinate system by taking $D$ as the origin, $\overrightarrow{DA}$ as the $x$-axis, $\overrightarrow{DC}$ as the $y$-axis, and $\overrightarrow{DH}$ as the $z$-axis, then $M=(1,\frac{1}{2},0),N=(0,1,\frac{1}{2})$. Therefore, the plane is $z=-\frac{1}{4}x+\frac{1}{2}y$.
>
> Therefore, the volume of one of the solids is
> $$
> \int_0^1\int_{\frac{1}{2}x}^1\left(-\frac{1}{4}x+\frac{1}{2}y\right)\,\mathrm{d}y\,\mathrm{d}x=\frac{7}{48}
> $$
> Therefore, the volume of the larger solid is $1-\frac{7}{48}=\frac{41}{48}$. Therefore, $p+q=89$.

### Problem 22

Tetrahedron $ABCD$ has $|AB|=5$, $|AC|=3$, $|BC|=4$, $|AD|=3$, $|BD|=4$, and $|CD|=\frac{12\sqrt2}{5}$. What is the volume of the tetrahedron?

> [!Solution]-
>
> Applying the **Pythagorean Theorem** yields
> $$
> |AB|^2=|AC|^2+|BC|^2\Longleftrightarrow\angle ACB=90\degree
> $$
> Let $E$ be the perpendicular foot from $C$ to $\overline{AB}$, then
> $$
> \begin{align}
> |CE|&=\frac{|AC||BC|}{|AB|}\\
> &=\frac{12}{5}
> \end{align}
> $$
> Similarly, it follows that $|DE|=\frac{12}{5}$.
>
> Applying the **Pythagorean Theorem** yields
> $$
> |CD|^2=|CE|^2+|DE|^2\Longleftrightarrow\angle CED=90\degree
> $$
> Therefore,
> $$
> \begin{align}
> [ABCD]&=\frac{1}{3}[\triangle ABC]|DE|\\
> &=\frac{1}{6}|AC||BC||DE|\\
> &=\frac{24}{5}
> \end{align}
> $$
>

### Problem 23

Inside a right circular cone with base radius $5$ and height $12$ are three congruent spheres with radius $r$. Each sphere is tangent to the other two spheres and also tangent to the base and side of the cone. What is $r$?

> [!Solution]-
>
> Let $O$ be the center of one of the spheres, $D$ be the point where that sphere is tangent to the base, $E$ be the point where that sphere is tangent to the side, $B$ be the center of the base, $A$ be the point such that $\overline{AB}$ is a radius of the base containing $D$, $C$ be the vertex of the cone. Then applying the **Pythagorean Theorem** yields
> $$
> \begin{align}
> |AC|&=\sqrt{|AB|^2+|BC|^2}\\
> &=13
> \end{align}
> $$
>
> $$
> \overline{OD}\perp\overline{AB}\land\overline{OE}\perp\overline{AC}\land|OD|=|OE|\Longrightarrow\angle OAB=\angle OAC
> $$
>
> Therefore, let $F$ be the intersection of $\overleftrightarrow{OA}$ and $\overline{BC}$, then applying the **Angle Bisector Theorem** yields
> $$
> \frac{|BF|}{|CF|}=\frac{|AB|}{|AC|}
> $$
>
> $$
> \frac{|BF|}{|CF|}=\frac{|AB|}{|AC|}\Longleftrightarrow|BF|=\frac{10}{3}
> $$
>
> Therefore,
> $$
> \begin{align}
> \overline{OD}\parallel\overline{BF}&\Longleftrightarrow\triangle OAD\sim\triangle FAB\\
> &\Longrightarrow\frac{|AD|}{|AB|}=\frac{|OD|}{|BF|}\\
> &\Longleftrightarrow|AD|=\frac{3}{2}r
> \end{align}
> $$
> Let $X,Y$ be the center of the other spheres, respectively, then it is easy to prove that $\triangle OXY$ is an equilateral triangle with center $B$ and side length $2r$.
>
> Therefore, it is easy to prove that $|BD|=\frac{2\sqrt3}{3}r$.
>
> Therefore,
> $$
> |AD|+|BD|=|AB|\Longleftrightarrow r=\frac{90-40\sqrt3}{11}
> $$
>

### Problem 24

Three numbers in the interval $[0,1]$ are chosen independently and at random. What is the probability that the chosen numbers are the side lengths of a triangle with positive area?

> [!Solution]-
>
> Let the numbers be $x$, $y$, and $z$, respectively, then applying the **Triangle Inequality** yields $x$, $y$, and $z$ form a triangle iff
> $$
> y+z>x\land x+z>y\land x+y>z
> $$
> Therefore, the probability that $x$, $y$, and $z$ form a triangle is
> $$
> \Pr[y+z>x\land x+z>y\land x+y>z]
> $$
> Applying the **Law of Total Probability** yields
> $$
> \begin{align}
> \Pr[y+z>x\land x+z>y\land x+y>z]&=\Pr[y+z>x\mid x>y\land x>z]\\
> &=\frac{\Pr[y+z>x\land x>y\land x>z]}{\Pr[x>y\land x>z]}\\
> &=3\int_0^1\int_0^1\int_0^1[y+z>x\land x>y\land x>z]\,\mathrm{d}z\,\mathrm{d}y\,\mathrm{d}x\\
> &=3\int_0^1\int_0^x\int_{x-y}^x\,\mathrm{d}z\,\mathrm{d}y\,\mathrm{d}x\\
> &=\frac{1}{2}
> \end{align}
> $$
>

### Problem 25

Real numbers $x$, $y$, and $z$ are chosen independently and at random from the interval $[0,n]$ for some positive integer $n$. The probability that no two of $x$, $y$, and $z$ are within $1$ unit of each other is greater than $\frac{1}{2}$. What is the smallest possible value of $n$?

> [!Solution]-
>
> Since it is easy to prove that the probability is $0$ when $n=1$, it follows that $n\ge2$.
>
> Assume $n\ge2$.
>
> Applying the **Law of Total Probability** yields
> $$
> \begin{align}
> \Pr[|x-y|>1\land|x-z|>1\land|y-z|>1]&=\Pr[x-y>1\land y-z>1\mid x>y>z]\\
> &=\frac{\Pr[x-y>1\land y-z>1]}{\Pr[x>y>z]}\\
> &=\frac{6}{n^3}\int_0^n\int_0^n\int_0^n[x-y>1\land y-z>1]\,\mathrm{d}z\,\mathrm{d}y\,\mathrm{d}x\\
> &=\frac{6}{n^3}\int_2^n\int_1^{x-1}\int_0^{y-1}\,\mathrm{d}z\,\mathrm{d}y\,\mathrm{d}x\\
> &=\frac{(n-2)^3}{n^3}
> \end{align}
> $$
> Since
> $$
> \frac{(n-2)^3}{n^3}>\frac{1}{2}\Longleftrightarrow n\ge10
> $$
> it follows that the smallest possible value of $n$ is $10$.

### Problem 26

Equilateral $\triangle ABC$ has side length $600$. Points $P$ and $Q$ lie outside the plane of $\triangle ABC$ and are on opposite sides of the plane. Furthermore, $|PA|=|PB|=|PC|$, and $|QA|=|QB|=|QC|$, and the planes of $\triangle PAB$ and $\triangle QAB$ form a $120\degree$ diheral angle. There is a point $O$ whose distance from each of $A,B,C,P,Q$ is $d$. Find $d$.

> [!Solution]-
>
> Let $D$ be the center of $\triangle ABC$, then it is easy to prove that $\overline{PQ}\perp\triangle ABC$ and the perpendicular foot is $D$.
>
> Since $|OA|=|OB|=|OC|$ and $|OP|=|OQ|$, it follows that $O$ is on $\overline{PQ}$.
>
> Therefore, applying the **Pythagorean Theorem** yields
> $$
> |OA|^2=|OD|^2+|AD|^2
> $$
> Let $x=|PD|,y=|QD|$, then
> $$
> \begin{align}
> |OA|^2=|OD|^2+|AD|^2&\Longleftrightarrow\left(\frac{x+y}{2}\right)^2=\left(\frac{x-y}{2}\right)^2+(200\sqrt3)^2\\
> &\Longleftrightarrow xy=120000
> \end{align}
> $$
> Let $E$ be the perpendicular foot from $D$ to $\overline{AB}$, then
> $$
> \begin{align}
> \angle PEQ=120\degree&\Longleftrightarrow\angle PED+\angle QED=120\degree\\
> &\Longleftrightarrow\tan(\angle PED+\angle QED)=-\sqrt3\\
> &\Longleftrightarrow\frac{\tan(\angle PED)+\tan(\angle QED)}{1-\tan(\angle PED)\tan(\angle QED)}=-\sqrt3\\
> &\Longleftrightarrow\frac{\frac{x}{100\sqrt3}+\frac{y}{100\sqrt3}}{1-\frac{x}{100\sqrt3}\frac{y}{100\sqrt3}}=-\sqrt3\\
> &\Longleftrightarrow x+y=\frac{xy}{100}-300\\
> &\Longleftrightarrow x+y=900
> \end{align}
> $$
> Therefore,
> $$
> \begin{align}
> d&=|OP|\\
> &=\frac{x+y}{2}\\
> &=450
> \end{align}
> $$
>

### Problem 27

A $4\times4\times h$ rectangular box contains a sphere of radius $2$ and eight smaller spheres of radius $1$. The smaller spheres are each tangent to three sides of the box, and the larger sphere is tangent to each of the smaller spheres. What is $h$?

![diagram](https://files.catbox.moe/hpdpyh.png)

> [!Solution]-
>
> Let $A$ be the center of the larger sphere, $B,C,D,E$ be the centers of the smaller spheres below the larger sphere, respectively. Then it is easy to prove that $|BC|=|CD|=|DE|=|BE|=2$ and $|AB|=|AC|=|AD|=|AE|=3$.
>
> Therefore, let $O$ be the center of $BCDE$, then it is easy to prove that $\overline{OA}\perp BCDE$.
>
> Therefore, applying the **Pythagorean Theorem** yields
> $$
> \begin{align}
> |OA|&=\sqrt{|AB|^2-|OB|^2}\\
> &=\sqrt7
> \end{align}
> $$
> Therefore, it is easy to prove that $h=2+2\sqrt7$.

### Problem 28

A sphere is inscribed in a truncated right circular cone as shown. The volume of the truncated cone is twice that of the sphere. What is the ratio of the radius of the bottom base of the truncated cone to the radius of the top base of the truncated cone?

![diagram](https://files.catbox.moe/6g03ko.png)

> [!Solution]-
>
> Let $r$ be the radius of the top base of the truncated cone, $R$ be the radius of the bottom base of the truncated cone, $s$ be the radius of the sphere. Then applying the **Pythagorean Theorem** yields
> $$
> (R+r)^2=(R-r)^2+(2s)^2
> $$
>
> $$
> (R+r)^2=(R-r)^2+(2s)^2\Longleftrightarrow s^2=Rr
> $$
>
> Since the volume of the truncated cone is twice the volume of the sphere, it follows that
> $$
> 2\cdot\frac{4}{3}\pi s^3=\frac{1}{3}\pi(2s)(R^2+Rr+r^2)
> $$
>
> $$
> \begin{align}
> 2\cdot\frac{4}{3}\pi s^3=\frac{1}{3}\pi(2s)(R^2+Rr+r^2)&\Longleftrightarrow4s^2=R^2+Rr+r^2\\
> &\Longleftrightarrow4Rr=R^2+Rr+r^2\\
> &\Longleftrightarrow\frac{R}{r}=\frac{3+\sqrt5}{2}
> \end{align}
> $$
>

### Problem 29

Suppose that $\triangle ABC$ is an equilateral triangle of side length $s$, with property that there is a unique point $P$ inside the triangle such that $|AP|=1$, $|BP|=\sqrt3$, and $|CP|=2$. What is $s$?

> [!Solution]-
>
> Let $Q$ be the point obtained by rotating $P$ $60\degree$ counterclockwise about $A$. Then
> $$
> \begin{align}
> \angle PAQ&=\angle CAP+\angle CAQ\\
> &=\angle CAP+\angle BAP\\
> &=\angle BAC\\
> &=60\degree
> \end{align}
> $$
>
> $$
> |AP|=|AQ|\land\angle PAQ=60\degree\Longleftrightarrow|PQ|=1
> $$
>
> Therefore, applying the **Pythagorean Theorem** yields
> $$
> |CP|^2=|CQ|^2+|PQ|^2\Longleftrightarrow\angle CQP=90\degree
> $$
> Since
> $$
> \begin{align}
> \angle CPQ&=\arccos\left(\frac{|PQ|}{|CP|}\right)\\
> &=60\degree
> \end{align}
> $$
> it follows that
> $$
> \begin{align}
> \angle APC&=\angle APQ+\angle CPQ\\
> &=120\degree
> \end{align}
> $$
> Therefore, applying the **Law of Cosines** yields
> $$
> \begin{align}
> s&=|AC|\\
> &=\sqrt{|AP|^2+|CP|^2-2|AP||CP|\cos(\angle APC)}\\
> &=\sqrt7
> \end{align}
> $$
