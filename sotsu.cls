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
    lines=4,
    label_format={\S\thesection},
    format={
        \null
        \hfill
        % 見出しラベル（§123）部分
        {
        \jlreqHeadingLabel{
            \rmfamily\mcfamily\bfseries % フォント
            \S
            \raisebox{-1ex}{
                \Huge
                \thesection
            }
            \quad\quad
        }
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

\ModifyHeading{subsection}{
    label_format={\thesubsection},
    lines=3,
    font={\Large\sffamily\gtfamily\bfseries},
    format={
        % 見出しラベル（§123）部分
        {
        \jlreqHeadingLabel{
            \rmfamily\mcfamily\bfseries % フォント
            \thesubsection
            \quad
        }
        }
        #2 % 見出し文字列（○○ニツイテ）部分
    },
}

\ModifyHeading{subsubsection}{
    label_format={\S\thesection},
    lines=2,
    font={\Large\sffamily\gtfamily\bfseries},
    format={
        % 見出しラベル（§123）部分
        % 現状ラベルは使わない
        % {
        % \jlreqHeadingLabel{
        %     \rmfamily\mcfamily\bfseries % フォント
        %     \thesubsection
        %     \quad
        % }
        % }
        #2 % 見出し文字列（○○ニツイテ）部分
    },
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



% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% 数式まわり
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 参考・・・ latex.ltx のデフォルト
% \abovedisplayskip=12pt plus 3pt minus 9pt
% \abovedisplayshortskip=0pt plus 3pt
% \belowdisplayskip=12pt plus 3pt minus 9pt
% \belowdisplayshortskip=7pt plus 3pt minus 4pt

\AtBeginDocument{
    \abovedisplayskip=6pt plus 3pt minus 0pt
    \abovedisplayshortskip=0pt plus 3pt
    \belowdisplayskip=6pt plus 3pt minus 0pt
    \belowdisplayshortskip=3pt plus 3pt
}



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

