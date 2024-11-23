$lualatex   = 'lualatex %O -synctex=1 -halt-on-error -file-line-error %S';
$bibtex     = 'upbibtex %O %B';
$biber      = 'biber %O --bblencoding=utf8 -u -U --output_safechars %B';

# makeindex（索引）
# 子ファイルをコンパイルするときは上（styleファイルを用いない）
# $makeindex  = 'upmendex %O -o %D %S -g';
$makeindex  = 'upmendex %O -o %D %S -s %R -g';

$do_cd = 1;