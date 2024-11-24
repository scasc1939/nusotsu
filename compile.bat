:: LuaTeX でコンパイル
latexmk -pdflua -r .latexmkrc
pause
:: 一時ファイルを消去
latexmk -c