:: LuaTeX でコンパイル
latexmk -pdflua -r .latexmkrc
pause
:: 一時ファイルを消去
latexmk -c

:: github からダウンロードしたときに、
:: 改行コードの関係で Windows Terminal がエラーを吐くようなので、
:: git の設定を直しました。
:: https://docs.github.com/ja/get-started/getting-started-with-git/configuring-git-to-handle-line-endings
:: うまくできているかな？
::（2024/12/01）