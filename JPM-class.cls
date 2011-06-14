%# -*- coding:utf-8 -*-
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{JPM-class}
    [2011/06/07 v1.0 JinPingMei document class]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ProcessOptions\relax

\PassOptionsToPackage{fallback,CJKchecksingle}{xeCJK}

\LoadClass[c5size,openany,nofonts]{ctexbook}

\RequirePackage[xetex]{geometry}
\RequirePackage[pagestyles]{titlesec}
\RequirePackage[titles]{tocloft}
\RequirePackage[xetex, bookmarksnumbered, pdfstartview={XYZ null null 1}, pdfborder=001,
                pdfpagemode=UseNone, pdfprintscaling=None]{hyperref}

\hypersetup{
  pdfinfo={
    Title   = {金瓶梅词话},
    Author  = {兰陵笑笑生},
    Creator = {XeLaTeX + xeCJK + CTeX}
  }
}

\def\HyPsd@Warning#1{\relax}

\geometry{papersize={145mm,210mm}, textwidth=110mm, lines=30, inner=15mm,
          top=20mm, bindingoffset=5mm, headheight=10mm, headsep=6mm, foot=5mm}

\setmainfont[BoldFont={PalatinoLTStd-Medium}]{PalatinoLTStd-Roman}

\def\xeCJK@fallback@testsymbol#1{%
  \iffontchar\font`#1%
    #1%
  \else{%
    \@nameuse{xeCJK@fallback@\xeCJK@family}%
      \iffontchar\font`#1%
        #1%
      \else\@nameuse{xeCJK@fallback@fallback@\xeCJK@family}%
        #1%
      \fi}%
  \fi}

\setCJKmainfont[BoldFont={FZHei-B01},ItalicFont={FZJKai-Z03S}]          {FZJSong-Z01S}
\setCJKsansfont[BoldFont={FZLanTingHei-M-GBK},ItalicFont={FZJKai-Z03S}] {FZLanTingHei-R-GBK}
\setCJKmonofont[BoldFont={FZHei-B01},ItalicFont={FZJKai-Z03S}]          {FZFangSong-Z02}

\setCJKfallbackfamilyfont{\CJKrmdefault}
  [BoldFont={FZHei-B01_GB18030},ItalicFont={FZKai-Z03_GB18030}]{FZShuSong_GB18030-Z01}
\setCJKfallbackfamilyfont{\CJKsfdefault}
  [BoldFont={FZHei-B01_GB18030},ItalicFont={FZKai-Z03_GB18030}]{FZLanTingHei-R-GB18030-YS}
\setCJKfallbackfamilyfont{\CJKttdefault}
  [BoldFont={FZHei-B01_GB18030},ItalicFont={FZKai-Z03_GB18030}]{FZFangSong-Z02_GB18030}

\setCJKfallbackfamilyfont{fallback@\CJKrmdefault}[ItalicFont={FZKaiS-Extended(SIP)}]{Sun-ExtB}

\newCJKfontfamily{\fzwkai}     [BoldFont=*] {FZBeiWeiKaiShu_GB18030}    % 方正北魏楷书
\newCJKfontfamily{\fzzhdxian}  [BoldFont=*] {FZZhongDengXian_GB18030}   % 方正中等线
\newCJKfontfamily{\fzltheib}   [BoldFont=*] {FZLanTingHei-RC-GBK}       % 方正兰亭黑扁
\newCJKfontfamily{\fzydzhhei}  [BoldFont=*] {FZYunDongHei-M-GBK}        % 方正韵动中黑
\newCJKfontfamily{\fzzhysong}  [BoldFont=*] {FZYaSong-DB-GBK}           % 方正中雅宋
\newCJKfontfamily{\fzqiti}     [BoldFont=*] {FZQiTi-S14}                % 方正启体
\newCJKfontfamily{\fzliukai}   [BoldFont=*] {FZSuXinShiLiuKaiS-R-GB}    % 方正苏新诗柳楷简体
\setCJKfallbackfamilyfont{fzliukai}[BoldFont=*]{FZQiTi-S14}

\def\textuni#1{\char"#1}

\@namedef{xeCJK@kaiming：}{}
\@namedef{xeCJK@kaiming；}{}

\punctstyle{mixedwidth}

\CJKsetecglue{}

\parskip           \z@
\clubpenalty      -\@m
\widowpenalty      \z@
\interlinepenalty -\@m

\raggedbottom

\def\cleardoublepage{\clearpage
  \if@twoside
    \ifodd\c@page\else
      \hbox{}\thispagestyle{empty}\newpage
      \if@twocolumn
        \hbox{}\newpage
      \fi
    \fi
  \fi}
\newcommand\titlematter{%
  \cleardoublepage
  \@mainmatterfalse
  \pagestyle{empty}%
  \pagenumbering{Alph}}
\renewcommand\frontmatter{%
  \cleardoublepage
  \@mainmatterfalse
  \pagestyle{main}%
  \pagenumbering{Roman}}
\renewcommand\mainmatter{%
  \cleardoublepage
  \@mainmattertrue
  \pagestyle{main}%
  \pagenumbering{arabic}}
\renewcommand\backmatter{%
  \clearpage
  \@mainmatterfalse}
\newcommand\fillinner{%
  \if@twoside
    \ifodd\c@page\raggedleft\else\raggedright\fi
  \else
    \raggedleft
  \fi}
\newcommand\fillouter{%
  \if@twoside
    \ifodd\c@page\raggedright\else\raggedleft\fi
  \else
    \raggedright
  \fi}

\DeclareRobustCommand*\KG{\kern\ccwd}
\DeclareRobustCommand*\@cdot{\raisebox{.5ex}{.}}

\def\CTEX@postchapter{回}
\renewcommand\contentsname{目\KG 录}

\newdimen\ruleheight
\ruleheight=.8\p@
\renewcommand\setheadrule[2][2mm]{%
  \ifdim#1=\z@
    \let\makeheadrule\@empty
  \else
    \def\makeheadrule{\rule[-#1]{\linewidth}{#2}}%
  \fi}

\newpagestyle{main}[\sffamily\boldmath\small]{%
  \sethead[\rmfamily\bfseries\@cdot\enskip\thepage\enskip\@cdot]
          [金瓶梅词话]
          [\ifthechapter{\CTEXthechapter}{}]
          {\chaptertitle}
          {}
          {\rmfamily\bfseries\@cdot\enskip\thepage\enskip\@cdot}%
  \setheadrule\ruleheight}

\renewpagestyle{plain}{}

\def\@chapter[#1]#2{%
  \ifnum \c@secnumdepth >\m@ne
    \if@mainmatter
      \refstepcounter{chapter}%
      \typeout{\CTEXthechapter}%
      \addcontentsline{toc}{chapter}
        {\protect\numberline{\CTEXthechapter}#1}%
    \else
      \addcontentsline{toc}{chapter}{#1}%
    \fi
  \else
    \addcontentsline{toc}{chapter}{#1}%
  \fi
  \chaptermark{#1}%
  \addtocontents{lof}{\protect\addvspace{10\p@}}%
  \addtocontents{lot}{\protect\addvspace{10\p@}}%
  \if@twocolumn
    \@topnewpage[\@makechapterhead{#2}]%
  \else
    \@makechapterhead{#2}%
  \@afterheading
  \fi}

\titleformat{\chapter}[display]
            {\zihao{4}\fzzhysong\ifthechapter{\fillinner}{\filcenter}}
            {\fzltheib\fillouter\zihao{-4}\CTEXthechapter\\[-2\p@] \titlerule[\ruleheight]\addvspace{-\baselineskip}}
            {\z@}
            {}

\titlespacing*{name=\chapter,numberless}
              {\z@}{-10\p@}{2\baselineskip-\ccwd}
\titlespacing*{\chapter}
              {\z@}{-13\p@}{2\baselineskip-\ccwd}

\newcommand\raisetext[2][.5\baselineskip]{\raisebox{#1}[\z@][\z@]{#2}}

\newcount\toc@cnt@
\chardef\toc@num@=20
\newdimen\toc@num@wid
\toc@num@wid=5\ccwd
\renewcommand{\numberline}[1]{\CTEXsetfont
  \settowidth\@tempdima{#1}%
  \global\advance\toc@cnt@ \@ne\relax
  \ifnum \toc@cnt@ >\toc@num@\relax
    \def\toc@cmd@{\let\CJKglue\hfill}%
    \@tempdima=\toc@num@wid
  \else
    \let\toc@cmd@\relax
  \fi
  \raisetext[-.5\baselineskip]{\hb@xt@\@tempdima{\toc@cmd@\@cftbsnum #1\@cftasnum}}%
  \advance\@tempdima\ccwd
  \@cftasnumb}
\cftsetindents{chapter}{\z@}{\z@}
\setlength\cftbeforechapskip{\z@}
\renewcommand\cftdot{\raisetext{\@cdot}}
\renewcommand\cftdotsep{3.5}
\renewcommand\cftchapfont{\fzwkai}
\renewcommand\cftchappresnum{\fzzhdxian}
\renewcommand\cftchapaftersnumb{\kern\ccwd\def\KG{\\*}\global\hangindent=\@tempdima}
\renewcommand\cftchapleader{\cftsecleader}
\renewcommand\cftchappagefont{\rmfamily}
\renewcommand\cftchapfillnum[1]{\enspace\cftchapleader
  \nobreak\raisetext{\cftchappagefont #1}\cftchapafterpnum\par}

\renewenvironment{quote}{\CTEXindent
    \@beginparpenalty\@m\relax
    \list{}{%
      \labelwidth\z@
      \labelsep\z@
      \leftmargin\parindent
      \parsep\parskip
      \itemsep\z@
      \topsep\z@
      \partopsep\parskip
      \listparindent\parindent
      \itemindent\listparindent
      \advance\itemindent\labelsep}%
    \item\relax\itshape}
  {\endlist\ignorespacesafterend}

\DeclareRobustCommand{\[}{\begin{quote}\obeylines}
\DeclareRobustCommand{\]}{\end{quote}}

\newcommand\named[1]{{\unskip\nobreak\hfil\penalty50\quad\hbox{}\nobreak\hfill
  \normalfont ——\,#1\parfillskip\z@ \finalhyphendemerits\z@ \par}}

\newcommand\cipaim[1]{{\upshape\fzzhdxian 【#1】}\enspace\ignorespaces}

\endinput
%%
%% End of file `JPM-class.cls'.