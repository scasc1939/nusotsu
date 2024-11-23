\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{feynman_d}

\LoadClass[
    % book,
    % twoside,
    paper=a4,
    fontsize=11pt,
    baselineskip=20pt,
    number_of_lines=34,
    ]{jlreq}


\ExplSyntaxOn

\ModifyHeading{section}{
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


\usepackage[deluxe]{luatexja-preset}

