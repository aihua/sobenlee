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
\RequirePackage[pagestyles,clearempty]{titlesec}
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

\let\HyPsd@Warning\@gobble\relax

\geometry{papersize={145mm,210mm}, textwidth=110mm, lines=30, inner=15mm,
          top=20mm, bindingoffset=5mm, headheight=10mm, headsep=6mm, foot=5mm}

\setmainfont{TeX Gyre Pagella}

\renewcommand*\xeCJK@fallback@testsymbol[1]{%
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

\ExplSyntaxOn
\NewDocumentCommand\newCJKfontfamily{omO{}mO{}g}{
  \IfNoValueTF{#1}
    {\tl_set:Nx \l_CJK_familyname_tl {\cs_to_str:N #2}}
    {\tl_set:Nx \l_CJK_familyname_tl {#1}}
  \setCJKfamilyfont{\l_CJK_familyname_tl}
    [BoldFont=*,ItalicFont=*,SlantedFont=*,#3]{#4}
  \cs_new_protected_nopar:Npx #2
    {\exp_not:N \CJKfamily {\l_CJK_familyname_tl}}
  \IfNoValueTF{#6}{}{
    \setCJKfallbackfamilyfont{\l_CJK_familyname_tl}
      [BoldFont=*,ItalicFont=*,SlantedFont=*,#5]{#6}
  }
}
\cs_new:Nn \JPM_includechapters:n {
  \prg_replicate:nn {#1} \JPM_includechapters:
}
\int_new:N \g_JPM_chapter_int
\cs_new:Nn \JPM_includechapters: {
  \int_gincr:N \g_JPM_chapter_int
  \int_compare:nTF{\g_JPM_chapter_int < \c_ten}{
    \tl_set:Nx \l_JPM_chapter_tl {00}
  }{
    \int_compare:nTF{\g_JPM_chapter_int < \c_one_hundred}{
      \tl_set:Nx \l_JPM_chapter_tl {0}
    }{
      \tl_set:Nx \l_JPM_chapter_tl {}
    }
  }
  \include{includefiles/JPM\l_JPM_chapter_tl\int_use:N\g_JPM_chapter_int}
}
\cs_new_eq:NN \includechapters \JPM_includechapters:n
\ExplSyntaxOff

\newCJKfontfamily[\CJKrmdefault]{\CJKrmfamily}
  [BoldFont={FZHei-B01},ItalicFont={FZJKai-Z03S},SlantedFont={FZFangSong-Z02}]{FZJSong-Z01S}%%
  [BoldFont={FZHei-B01_GB18030},ItalicFont={FZKai-Z03_GB18030},SlantedFont={FZFangSong-Z02_GB18030}]{FZShuSong-Z01_GB18030}
\newCJKfontfamily[\CJKsfdefault]{\CJKsffamily}
  [BoldFont={FZHei-B01},ItalicFont={FZJKai-Z03S},SlantedFont={FZFangSong-Z02}]{FZZhongDengXian-Z07}%%
  [BoldFont={FZHei-B01_GB18030},ItalicFont={FZKai-Z03_GB18030},SlantedFont={FZFangSong-Z02_GB18030}]{FZZhongDengXian-Z07_GB18030}
\newCJKfontfamily[\CJKttdefault]{\CJKttfamily}
  [BoldFont={FZHei-B01},ItalicFont={FZJKai-Z03S},SlantedFont={FZFangSong-Z02}]{FZJKai-Z03S}%%
  [BoldFont={FZHei-B01_GB18030},ItalicFont={FZKai-Z03_GB18030},SlantedFont={FZFangSong-Z02_GB18030}]{FZKai-Z03_GB18030}

\setCJKfallbackfamilyfont{fallback@\CJKrmdefault}[ItalicFont={FZKaiS-Extended(SIP)}]{Sun-ExtB}

\newCJKfontfamily{\fzwkai}   {FZBeiWeiKaiShu-S19_GB18030}  % 方正北魏楷书
\newCJKfontfamily{\fzzhdxian}{FZZhongDengXian-Z07_GB18030} % 方正中等线
\newCJKfontfamily{\fzltheib} {FZLanTingHei-RC-GBK}         % 方正兰亭黑扁
\newCJKfontfamily{\fzydzhhei}{FZYunDongHei-M-GBK}          % 方正韵动中黑
\newCJKfontfamily{\fzzhysong}{FZYaSong-DB-GBK}             % 方正中雅宋
\newCJKfontfamily{\fzqiti}   {FZQiTi-S14}                  % 方正启体
\newCJKfontfamily{\fzliukai} {FZSuXinShiLiuKaiS-R-GB}{FZQiTi-S14}% 方正苏新诗柳楷简体

\@namedef{xeCJK@kaiming：}{}
\@namedef{xeCJK@kaiming；}{}

\punctstyle{mixedwidth}

\CJKsetecglue{}

\parskip           \z@
\clubpenalty      -\@m
\widowpenalty      \z@
\interlinepenalty -\@m

\raggedbottom

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
\DeclareRobustCommand*\@cdot{\textcentereddot}

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

\newpagestyle{main}[\sffamily\small]{%
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

\renewrobustcmd*{\[}{\begin{quote}\obeylines}
\renewrobustcmd*{\]}{\end{quote}}

\newcommand\named[1]{%
  \unskip\nobreak\hfill\allowbreak\null\nobreak\hfill\quad\hbox{\normalfont ——\,#1}}

%\newcommand\named[1]{{\unskip\nobreak\hfil\penalty50\quad\hbox{}\nobreak\hfill
%  \normalfont ——\,#1\parfillskip\z@ \finalhyphendemerits\z@ \par}}


\newcommand\cipaim[1]{{\upshape\fzzhdxian 【#1】}\enspace\ignorespaces}

\def\textuni#1{\char"#1}

\def\textJinXia {\makebox[\ccwd]{\scalebox{.85}[.9]{釒}\kern-.55em\scalebox{.65}[1]{夏}}}
\def\textShiJie {\makebox[\ccwd]{\scalebox{.9}[1]{飠}\kern-.5em\scalebox{.6}[1]{皆}}}
\def\textShiHe  {\makebox[\ccwd]{\scalebox{.9}[1]{飠}\kern-.47em\scalebox{.58}[1]{禾}}}
\def\textSiTang {\makebox[\ccwd]{\scalebox{.6}[1]{糹}\kern-.3em\scalebox{.7}[1]{堂}}}
\def\textShiDian{\makebox[\ccwd]{砷\kern-.6em\fboxsep\z@\colorbox{white}{\kern-.1em\scalebox{.7}[1]{店}}}}
\def\textShiFou {\makebox[\ccwd]{砷\kern-.6em\fboxsep\z@\colorbox{white}{\kern-.1em\scalebox{.7}[1]{否}}}}
\def\textHuoKua {\makebox[\ccwd]{灿\kern-.6em\fboxsep\z@\colorbox{white}{\kern-.1em\scalebox{.7}[1]{夸}}}}

\endinput
%%
%% End of file `JPM-class.cls'.