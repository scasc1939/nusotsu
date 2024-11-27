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



\usepackage[deluxe]{luatexja-preset}

