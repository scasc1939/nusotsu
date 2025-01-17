\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{sotsu-beamer}

\LoadClass[unicode,10pt]{beamer}

% 日本語フォント
\RequirePackage[deluxe]{luatexja-preset}
\renewcommand{\kanjifamilydefault}{\gtdefault}


% 色
\RequirePackage{xcolor}
% ``nugreen''という名前の色を定義する
\definecolor{nugreen}{RGB}{  0, 110,  79}
% \definecolor{nualert}{RGB}{255, 145, 176}
\definecolor{nualert}{RGB}{255, 145, 0}


% 数式フォント
\RequirePackage{unicode-math}

\setmainfont{STIX Two Text}[
    Extension=.otf,
    UprightFont=*-Regular,
    BoldFont=*-Bold,
    ItalicFont=*-Italic,
    BoldItalicFont=*-BoldItalic]
\setmathfont{STIX Two Math}
\setmathfont{XCharterMath}[range=\symscr]


% 画像
\RequirePackage{graphicx}


% beamer
%%%%%%%%%%%%%%%%%%%%

% テーマ
\usetheme{Metropolis}

% 行間
\renewcommand{\baselinestretch}{1.25}

% allowframebreaks での2ページ目以降のタイトル
\setbeamertemplate{frametitle continuation}[from second][（つづき）]


% metripolis テーマの設定
\metroset{
    sectionpage=progressbar,
    subsectionpage=progressbar,
}


\setbeamercolor
    {structure}
        {fg = nugreen,
         bg = white}
\setbeamerfont
    {structure}
        {series=\bfseries}


\setbeamercolor
    {palette primary}
        {use = structure,
         fg = structure.bg, 
         bg = structure.fg}


% ページ番号
\setbeamerfont
    {page number in head/foot}
        {size=\normalsize, series=\bfseries}



% block 環境
% beamerのドキュメント
%     12.3 Block Environment
\setbeamercolor
    {block title}
        {use=structure, fg=structure.bg, bg=structure.fg!80!black}
\setbeamerfont 
    {block title}
        {size=\normalsize, series=\bfseries}
\setbeamercolor
    {block body}
        {use={structure, normal text}, 
         fg = normal text.fg, 
         bg = structure.fg!10!white}


\setbeamercolor
    {alerted text}
        {use = structure, 
         fg = nualert, 
         bg = structure.bg}

\setbeamercolor
    {block title alerted}
        {use={alerted text},
         fg = alerted text.bg, 
         bg = alerted text.fg}

\setbeamercolor
    {block body alerted}
        {use = {alerted text, normal text}, 
         fg = normal text.fg, 
         bg = alerted text.fg!10!white}

\setbeamercolor{block title example}
        {fg = white,
         bg = nugreen!70!yellow}







