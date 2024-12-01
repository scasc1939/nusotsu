:: LuaTeX でコンパイル
latexmk -pdflua -r .latexmkrc
:: 入力待ち
pause
:: 一時ファイルを消去
latexmk -c