## DISCLAIMER

このノートは更新中であり、現時点での内容の正確性については一切の責任を持ちません。



## History


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
