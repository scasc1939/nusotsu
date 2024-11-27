\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{sotsu}

\LoadClass[
    % book,
    % twoside,
    report,
    paper=a4,
    fontsize=11pt,
    baselineskip=20pt,
    number_of_lines=34,
    ]{jlreq}


\ExplSyntaxOn

\ModifyHeading{section}{
    label_format={\S\thesection},
    format={
        \null
        \hfill
        % 見出しラベル（§123）部分
        \jlreqHeadingLabel{
            \rmfamily\mcfamily\bfseries % フォント
            \S\thesection
            \quad
        }
        #2 % 見出し文字列（○○ニツイテ）部分
        \hfill
        \null
        \\
        \noindent
        \hrulefill
    },
    pagebreak=clearpage,
}

\ExplSyntaxOff

\counterwithout{section}{chapter}


% 目次
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\usepackage{tocloft}

% タイトル（「目次」）
\renewcommand{\cfttoctitlefont}{\huge\bfseries\gtfamily\sffamily}

% 章タイトル（「○○」など）のフォント
\renewcommand{\cftchapfont}{\large\bfseries\gtfamily\sffamily}
\renewcommand{\cftsecfont}{\bfseries\mcfamily\rmfamily}
\renewcommand{\cftsubsecfont}{\mdseries}

% ページ番号のフォント
\renewcommand{\cftchappagefont}{\cftchapfont}
\renewcommand{\cftsecpagefont}{\cftsecfont}
\renewcommand{\cftsubsecpagefont}{\cftsubsecfont}

% ラベル（1.1 など）の幅
\setlength{\cftchapnumwidth}{5\zw}
\setlength{\cftsecnumwidth}{4\zw}
\setlength{\cftsubsecnumwidth}{3\zw}

% ラベル（1.1 など）のインデント
\setlength{\cftchapindent}{0pt}
\setlength{\cftsecindent}{1\zw}
\setlength{\cftsubsecindent}{2\zw}

% ドット
\renewcommand{\cftchapdotsep}{\cftnodots}
\renewcommand{\cftsecdotsep}{\cftnodots}
\renewcommand{\cftsubsecdotsep}{3.3}
\renewcommand{\cftsubsecleader}{\cftdotfill{\cftsubsecdotsep}}



% 索引
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% jlreq クラス（ https://github.com/abenori/jlreq/blob/master/jlreq.cls ）に定義
% \indexname = `索引'

\renewenvironment{theindex}{%
    \jlreq@oldfontcommand@enable
    \jlreq@iftdir{\clearpage\yoko\jlreq@resttatetrue}{\jlreq@resttatefalse}% 常に横書きにする
    \if@twocolumn\@restonecolfalse\else\@restonecoltrue\fi % 2段組みかどうか保存
    \columnseprule\z@ \columnsep 2\jlreq@mol % ？
    \twocolumn[\chapter*{\indexname}]% !!! 章を追加
    \phantomsection % !!! ハイパーリンク用（ hyperref パッケージ）
    \addcontentsline{toc}{chapter}{\indexname}% !!! 章を目次に追加
    \@mkboth{\indexname}{\indexname}% ヘッダーを更新
    \jlreq@theindex@pagestyle % ページスタイルを索引のものに変更
    \parindent\z@ % インデントなし
    \parskip\z@ \@plus .03\jlreq@gol\relax % 段落の間？
    \let\item\@idxitem
}{%
    \ifx\jlreq@theindex@savedpagestyle\@undefined\else\expandafter\pagestyle\expandafter{\jlreq@theindex@savedpagestyle}\fi % ページスタイルを元に戻す
    \let\jlreq@theindex@savedpagestyle\@undefined % 保存したページスタイルを消去
    \if@restonecol\onecolumn\else\clearpage\fi % 1段組みに戻す
    \ifjlreq@resttate\tate\fi % 縦書きに戻す
    \jlreq@oldfontcommand@disable % ？
}

\renewcommand{\indexspace}{\par\vspace{-2.0ex}}



\usepackage[deluxe]{luatexja-preset}

