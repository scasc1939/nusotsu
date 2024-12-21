## DISCLAIMER

このノートは更新中であり、現時点での内容の正確性については一切の責任を持ちません。



## History

#### 2024/12/21

- 数式のナンバリングを修正（chapterごと→sectionごと）。
  - なぜ今まで気づかなかったのか・・・。
- `fontspec` パッケージを導入、$\mathrm{Re}$，$\mathrm{d}x$ などのフォントが異なっていたのを修正。
  ```tex
  \setmathrm{New Computer Modern Math}
  ```
  - もしかして変わっていない？
- 数式の太字フォントを変更。
  ```tex
  \setmathfont[range={\symbfup,\symbfit}]{XITS Math}
  ```
- `\Re`, `\Im` がなぜか $\mathfrak{R}$, $\mathfrak{I}$ になった（戻った）ので、`\Real`，`\Imaginary` に変更した。なぜ？

#### 2024/12/18

- 参考文献関係
  - `sotsu.bib`を修正。seriesとnumberを分けた。
  - `sotsu.bbx`を更新。
  - `sotsu.cbx`を追加。


#### 2024/12/10

- ソースコード
  - コマンドを使って`\symbf{v}`，`\symbb{R}`のようにかいていたのを，ユニコードのベタ打ち（𝒗，ℝ）にした．
- 内積の表記を $(v, u)$ から $\langle v, u \rangle$ に変えた．
  - ソースコードでは，`(v, u)`と書いていたのを改めて，`\iparen{v, u}`のように書くことにした．
  - 半手動で置換したので，漏れがあるかもしれない．

#### 2024/12/01

- `compile.bat`が改行コード（CRLF/LF）の関係で正常に実行できていなかったので、修正（できているかな？）
- `biblatex`関係のところを修正。
  - `sotsu.bib`の姓・名を修正。
  - `sotsu.bbx`を追加し、参考文献リスト（Bibliography）のスタイルを設定。
