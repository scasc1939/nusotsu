#set page(
  paper: "a5", 
  margin: (x: 1.5cm, y: 2.0cm),
	numbering: "1",
)

// 見出し
#show heading.where(level: 1): it => [
	#set text(
		16pt, 
		font: ("Source Han Sans JP"), 
		weight: "bold"
	)
	#set align(center)
	#block(
		it.body
	)
	#v(1em)
]

#show heading.where(level: 2): it => [
	#set text(
		14pt, 
		font: ("Source Han Sans JP"), 
		weight: "medium"
	)
	#block(it.body)
	#v(1em)
]

#show heading.where(level: 3): it => [
	#set text(
		12pt, 
		font: ("Source Han Sans JP"), 
		weight: "medium"
	)
	#block(it.body)
	#v(1em)
]

#show heading.where(level: 4): it => [
	#set text(
		font: ("Source Han Sans JP"), 
		weight: "medium"
	)  
  #block(it.body)
  #v(0.5em)
]

// テキスト全般
#set text(
	lang: "ja",
  font: ("New Computer Modern", "Source Han Serif JP"),
  size: 11pt
)
#set par(
	first-line-indent: 1em,
  justify: true,
  leading: 1.2em,
	spacing: 1.6em,
)

#show strong: set text(font: ("Source Han Sans JP"), weight: "medium")

#show emph: set text(font: ("New Computer Modern", "Source Han Sans JP"), style: "italic")

#set math.equation(numbering: "(1)")

#import "@preview/indenta:0.0.3": fix-indent
#show: fix-indent()


= ルベーグ積分

#outline()

- 伊藤清三「ルベーグ積分」裳華房（1963）

#pagebreak()



== ユークリッド空間$RR^N$にある立体の体積

ふつうの空間（ユークリッド空間）$RR^N$にある立体を考えてみる．

まず立体が
$ A := { (a_1, b_1] times dots.h.c times (a_N, b_N] mid(|) -oo <= a_nu < b_nu < +oo } $
<eq:cuboid>
という直方体である場合を考える
（ただし$(a_nu, b_nu]$は半開区間）．
この立体の体積$m(A)$は，
$ m(A) &:= (b_1 - a_1) dot dots.h.c dot (b_N - a_N) \ &= product_(nu=1)^N (b_nu - a_nu) $
<eq:volume-of-cuboid>
で与えられるはずである．

次に立体が，$n$個の直方体$A_1, ..., A_n$を組み合わせた形
$ B := A_1 union.sq dots.h.c union.sq A_n $
<eq:cuboids>
をしていたとしよう．
$union.sq$は非交和．
つまり直方体同士は離れていてもくっついていてもよいが，重なってはいけない．
$B$の体積は，$A_1, ..., A_n$の体積（@eq:volume-of-cuboid）の和
$ m(B) := sum_(i=1)^n m(A_i) $
<eq:volume-of-cuboids>
で与えられるはずである．


#pagebreak()


=== 有限加法的測度

$N$-次元ユークリッド空間内の立体$A, B subset RR^N$について，"体積"$m$が満たすべき性質は，以下のとおりである．

+ *非負性*　すべての$A subset RR^N$について，
  $ 0 <= m(A) <= oo $
  また，$m(emptyset) = 0$．
+ *有限加法性*　$A_1, ..., A_n subset RR^N$で，$A_i sect A_j = emptyset $（$i != j$）なら，
  $ m ( union.sq.big_(i=1)^n A_i ) = sum_(i=1)^n m(A_i) $
たったこれだけの条件を仮定すれば，
3. *単調性*　$A subset B$なら，$m(A) <= m(B)$
+  $A subset B$なら，$m(B without A) = m(B) - m(A)$
+  *有限劣加法性*　$A_1, ..., A_n subset RR^N$なら，
  $ m ( union.big_(i=1)^n A_i ) <= sum_(i=1)^n m(A_i) $
という重要な性質が出てくる．

これらの条件を満たす$m$のことを，*有限加法的測度* (*finitely additive measure*) という#footnote[写像$m colon frak(P)(RR^N) -> RR union {oo}$．ここで$frak(P) (RR^N)$はベキ集合であり，$frak(P)$は$P$のフラクトゥール．]．


#pagebreak()


有限加法的測度の公理を物理的（？）に解釈すると，

+ $0 <= m(A) <= oo$，$m(emptyset) = 0$\
  体積が負の値になってはいけないという当然のこと．
  また，何もない部分$emptyset$の体積はゼロのはず．
+ $m ( union.sq.big_i A_i ) = sum_i m(A_i)$\
  いくつかの立体を重ならないように組み合わせた立体の体積は，それぞれの立体の体積$m(A_n)$の和になる．
+ $A subset B ==> m(A) <= m(B)$\
  立体$A$が別の立体$B$に含まれるなら，$A$の体積は$B$以下である．
+ $A subset B ==> m(B without A) = m(B) - m(A)$\
  立体$B$の一部$A$を取り除いた立体$B without A$の体積は，$B$の体積マイナス$A$の体積．
+ $m ( union.big_i A_i ) <= sum_i m(A_i)$\
  $A_1, ..., A_n$の一部が重なっていれば，これらを合わせた立体の体積は，単純な和よりも重複分だけ小さくなる．


==== 完全加法性

今までは有限個の立体を組み合わせた場合を考えていた．
（互いに交わらない）加算無限個の立体$A_1, A_2, ...$を組み合わせた立体$A := union.sq.big_(n=1)^oo A_n$についても，
$
  m(A) = sum_(n=1)^oo m(A_n)
$
が成り立つとき，$m$を*完全加法的*な測度という．


#pagebreak()


=== ルベーグ外測度

直方体や，それを組み合わせた立体については，@eq:volume-of-cuboid や@eq:volume-of-cuboids によって体積$m(A)$が定義できる．
それ以外の立体については，どうやって体積を定義すればよいだろうか？

手順は以下のとおり．まず立体$A$を加算無限個の直方体${E_n}$でおおってやる．つまり，$A subset union.big_(n=1)^oo E_n$となるように$E_n$を適当に決める#footnote[例えば，$A subset RR^N$．]．
それぞれの直方体の体積$m(E_n)$は@eq:volume-of-cuboid であるから，
$ sum_(n=1)^oo m(E_n) $
<eq:outer-measure-1>
が定義できる．
このような${E_n}$の取り方をいろいろと考えて，その中で@eq:outer-measure-1 が最も小さくなる#footnote[厳密には下限$inf$．]ようなとき，それを$A$の体積とする．つまり，
$ Gamma (A) := inf ( sum_(n=1)^oo m(E_n) ) $
<eq:outer-measure-def>
を$A$の体積と定める．これを*ルベーグ外測度* (Lebesgue outer measure)という．


#pagebreak()


==== ルベーグ外測度$Gamma$の性質

ルベーグ外測度$Gamma$（@eq:outer-measure-def）は，次のような性質を満たす．

+ $ 0 <= Gamma (A) <= oo  quad \& quad  Gamma (emptyset) = 0 $
+ $ A subset B "ならば" Gamma (A) <= Gamma (B) $
+ $ Gamma ( union.big_(n=1)^oo A_n ) <= sum_(n=1)^oo Gamma (A_n) $

*証明*（特に重要ではない）

+ $Gamma (A) := inf ( sum_(n=1)^oo m(E_n) )$および$0 <= m(E_n) <= oo$であることから明らかである．
+ $A subset B$とする．$B$をおおう直方体の組${E_n}$は，$A$をもおおう．なぜなら，$A subset B subset union.big_(n=1)^oo E_n$であるから．$Gamma$の定義が$inf$であることに注意すると，$Gamma (A) <= Gamma (B)$である．
+ $epsilon > 0$を任意にとる．
  すると，各$A_n$に対して
  $
    A_n subset union.big_(n=1)^oo E_n^k
    quad "かつ" quad 
    sum_(k=1)^oo m(E_n^k) <= Gamma (A_n) + epsilon / 2^n
  $
  であるような$E_n^k$がとれる（$inf$なので）．
  ${E_n^k}_(n, k)$は$A$のおおい方のひとつなので，
  #math.equation(
    numbering: none,
    block: true,
  )[$
    Gamma ( union.big_(n=1)^oo A_n )
      &<= sum_(n=1)^oo sum_(k=1)^oo m(E_n^k)
      <= sum_(n=1)^oo {  Gamma(A_n) + epsilon / 2^n  }
      <= sum_(n=1)^oo Gamma (A_n) + epsilon
  $]
  ここで$epsilon > 0$は任意だから，示された．


#pagebreak()



=== ルベーグ測度

@eq:outer-measure-def により，すべての部分集合$A subset RR^N$に対してルベーグ外測度$Gamma (A)$が定義できる．
しかし，$Gamma (A)$が必ずしも"_体積らしい_"とは限らない．
そこで，$Gamma (E)$が"_体積らしく_"なる立体$E subset RR^N$の条件を考える．

天下り的に定義する．
#align(center)[
  $E subset RR^N$が*可測*であるとは，\

  任意の部分集合$A subset RR^N$に対して
  $
    Gamma (A) = Gamma (A sect E) + Gamma (A sect E^(upright(c)) )
  $
  が成り立つことをいう．
]

この条件を満たすような立体（部分集合）全体の集合を$frak(M)_Gamma$とかくことにする#footnote[$frak(M)$は$M$のフラクトゥール．]．

ルベーグ外測度$Gamma$（@eq:outer-measure-def）の定義域を，$frak(M)_Gamma$に属する集合に制限したものを$mu$と書き，これを*ルベーグ測度*という#footnote[写像$mu colon frak(M) -> RR union {oo}$．これが写像$Gamma colon frak(P) (RR^N) -> RR union {oo}$の，$frak(M)_Gamma subset frak(P) (RR^N)$における制限になっている．]．

つまり，
$ mu (E) := Gamma (E)  quad "where" E in frak(M)_Gamma $
<eq:measure-def>


#pagebreak()


==== ルベーグ可測な集合

たとえば空集合$emptyset$は，任意の$A subset RR^N$に対して
$ Gamma (A sect emptyset) + Gamma (A sect emptyset^(upright(c))) = Gamma (emptyset) + Gamma (A) = Gamma (A) $
であるから可測，$emptyset in frak(M)_Gamma$．

同様に，$RR^N$も可測．

直方体（@eq:cuboid）や，それを組み合わせた立体（@eq:cuboids）も可測である．




==== ルベーグ測度$mu$の性質

ルベーグ測度$mu$はルベーグ外測度$Gamma$を制限しただけのものだから，当然$Gamma$（@eq:outer-measure-def）と同じ性質を持つ．

+ *非負性*
  $ 0 <= mu (E) <= oo  quad \& quad  mu (emptyset) = 0 $
+ *単調性*
  $ A subset B "ならば" mu (A) <= mu (B) $
+ *劣加法性*
  $ mu ( union.big_(n=1)^oo A_n ) <= sum_(n=1)^oo mu (A_n) $



#pagebreak()


==== ルベーグ測度の例

1点のルベーグ測度はゼロである．
つまり，点$bold(x) = (x_1, ..., x_N) in RR^N$に対して，$mu ({bold(x)}) = 0$．

*証明*　任意の$epsilon > 0$に対して，1個の集合$E := (x_1 - epsilon, thick x_1] times dots.h.c times (x_N - epsilon, thick x_N]$によって，${bold(x)} subset E$と覆うことができる．
ゆえに
$ Gamma ({bold(x)}) <= m (E) = epsilon^N $
であるが，$epsilon -> 0$とすると，$Gamma ({bold(x)}) -> 0$である．よって$mu({bold(x)}) = 0$がいえる．#h(1fr)\u{220e}

信じられないことに，$RR^1$では，有理数全体$QQ$の測度はゼロである．

*証明*　有理数全体の集合$QQ$は可算#footnote[可算の定義については，集合論のテキストを参照．]であるから，有理数を$x_1, x_2, ...$と並べることができる．
すると，$QQ subset union.big_(n=1)^oo {x_n}$であり，
$Gamma$の劣加法性から
$ Gamma (QQ) <= sum_(n=1)^oo Gamma ({x_n}) $
一方，先ほど見たように，1点のルベーグ外測度はゼロなので，$Gamma ({x_n}) = 0$．よって$Gamma (QQ) = 0$．よって，$mu (QQ) = 0$．


