%# -*- coding:utf-8 -*-
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{GaoHua}
    [2012/02/24 v1.0 GaoHua document class]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ProcessOptions\relax

\PassOptionsToPackage{fallback,CJKchecksingle}{xeCJK}

\LoadClass[c5size,openany,fntef,nofonts]{ctexbook}

\RequirePackage[xetex]{geometry}
\RequirePackage[perpage,stable,bottom]{footmisc}
\RequirePackage{quoting,needspace,afterpage,varwidth,pifont}
\RequirePackage[pagestyles,explicit,clearempty,outermarks]{titlesec}
\RequirePackage[titlesec]{interfaces}
\RequirePackage[xetex, bookmarksnumbered, pdfstartview={XYZ null null 1}, pdfborder=001,
                pdfpagemode=UseNone, pdfprintscaling=None]{hyperref}

\predisplaypenalty   = \z@
\postdisplaypenalty  = \z@
\clubpenalty         = \z@
\widowpenalty        = \z@
\displaywidowpenalty = \z@
\interlinepenalty    = \z@
\brokenpenalty       = \sixt@@n
\parskip             = \z@

\raggedbottom

\title{红太阳是怎样升起的：延安整风的来龙去脉}
\author{高\enspace 华}

\hypersetup{
  pdfinfo={
    Title   = {\@title},
    Author  = {\@author},
    Creator = {XeLaTeX + xeCJK + CTeX}
  }
}

\let\HyPsd@Warning\@gobble

\geometry{papersize={145mm,210mm}, textwidth=110mm, lines=30, inner=15mm,
          top=20mm, bindingoffset=5mm, headheight=10mm, headsep=6mm, foot=5mm}

\setmainfont{TeX Gyre Pagella}

\renewcommand*\xeCJK@fallback@testsymbol[1]{%
  \iffontchar\font`#1\relax
    #1%
  \else{%
    \@nameuse{xeCJK@fallback@\xeCJK@family}%
      \iffontchar\font`#1\relax
        #1%
      \else
        \@nameuse{xeCJK@fallback@FallBack\xeCJK@family}%
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

\setCJKfallbackfamilyfont{FallBack\CJKrmdefault}[ItalicFont={FZKaiS-Extended(SIP)}]{Sun-ExtB}

\newCJKfontfamily{\fzcusong} {FZCuSong-B09}                % 方正粗宋
\newCJKfontfamily{\fzbykans} {FZBoYaKanSongK}              % 方正博雅刊宋
\newCJKfontfamily{\fzwkai}   {FZBeiWeiKaiShu-S19_GB18030}  % 方正北魏楷书
\newCJKfontfamily{\fzltheib} {FZLanTingHei-RC-GBK}         % 方正兰亭黑扁
\newCJKfontfamily{\fzydzhhei}{FZYunDongHei-M-GBK}          % 方正韵动中黑
\newCJKfontfamily{\fzzhysong}{FZYaSong-DB-GBK}             % 方正中雅宋
\newCJKfontfamily{\fzqiti}   {FZQiTi-S14}                  % 方正启体
\newCJKfontfamily{\fzliukai} {FZSuXinShiLiuKaiS-R-GB}{FZQiTi-S14}% 方正苏新诗柳楷简体
\newCJKfontfamily{\kaishu}   {FZJKai-Z03S}{FZKai-Z03_GB18030}

\@namedef{xeCJK@kaiming：}{}
\@namedef{xeCJK@kaiming；}{}

\newrobustcmd*~{\unskip\hskip 0.2em minus 0.05em\ignorespaces}
\AtEndPreamble{\punctstyle{mixedwidth}}
\CJKsetecglue{}

\let\origemph\emph
\renewcommand*\CJKunderlinecolor{}
\renewcommand*\ULthickness{.8\p@}
\newrobustcmd*\emphfont{\normalfont\bfseries}
\DeclareTextFontCommand\@textemph{\emphfont}
\renewrobustcmd\emph[1]{%
  \ifdefstrequal{\f@series}{\bfdefault}
    {\@textemph{\CTEXunderline{#1}}}
    {\@textemph{#1}}}

\newbool{@preface}

\newcommand*\titlematter{%
  \cleardoublepage
  \boolfalse{@mainmatter}
  \pagestyle{empty}%
  \pagenumbering{Alph}}
\renewcommand*\frontmatter{%
  \cleardoublepage
  \boolfalse{@mainmatter}%
  \booltrue{@preface}%
  \pagestyle{main}%
  \pagenumbering{Roman}}
\renewcommand*\mainmatter{%
  \cleardoublepage
  \booltrue{@mainmatter}%
  \boolfalse{@preface}%
  \pagestyle{main}%
  \pagenumbering{arabic}}
\renewcommand*\backmatter{%
  \cleardoublepage
  \boolfalse{@mainmatter}%
  \boolfalse{@preface}%
  \def\toclevel@chapter{-1}}
\newcommand*\fillinner{%
  \ifbool{@twoside}
    {\ifnumodd\c@page\raggedleft\raggedright}
    {\raggedleft}}
\newcommand*\fillouter{%
  \ifbool{@twoside}
    {\ifnumodd\c@page\raggedright\raggedleft}
    {\raggedright}}

\quotingsetup{
       font=itshape,
      vskip=\z@,
 leftmargin=\parindent,
rightmargin=\z@,
indentfirst=auto}

\DeclareRobustCommand*\KG{\kern\ccwd}
\DeclareRobustCommand*\@cdot{\textcentereddot}

\renewcommand*\contentsname{目\KG 录}
\newcommand*\prefacename{前\KG 言}
\newcommand*\postfacename{后\KG 记}
\newcommand*\titlename{\@title}
\newcommand*\authorname{\@author}

\NewDocumentEnvironment{pre-post-text}{g}{%
  \IfNoValueTF{#1}{%
    \ifbool{@preface}
      {\def\@preposttitle{\prefacename}}
      {\def\@preposttitle{\postfacename}}%
  }{%
    \def\@preposttitle{#1}%
  }
  \chapter{\@preposttitle}%
  \kaishu
}{%
  \relax
}

\newcommand\Sign[2][\authorname]{%
  \par\nopagebreak\bigskip\nopagebreak\null\hfill
  \varwidth[c]{.5\linewidth}%
    \centering
    \mbox{\fzliukai\large #1}\\
    \mbox{\normalfont\small #2}%
  \endvarwidth\quad
}

\renewcommand*\tableofcontents{%
  \cleardoublepage
  \begingroup
    \boolfalse{@mainmatter}%
    \let\addtocontents\@gobbletwo
    \chapter{\contentsname}%
    \let\KG\relax
    \@starttoc{toc}%
  \endgroup}

\newdimen\ruleheight
\ruleheight=.8\p@
\renewcommand\setheadrule[2][2mm]{%
  \ifdimequal{#1}{\z@}
    {\let\makeheadrule\@empty}
    {\def\makeheadrule{\rule[-#1]{\linewidth}{#2}}}%
}

\newcommand*\showthepage{\bfseries\rmfamily\@cdot\enskip\thepage\enskip\@cdot}

\newpagestyle{main}[\sffamily\small]{%
  \sethead[\showthepage][]
    [\ifthechapter{\CTEXthechapter\KG\chaptertitle}{\titlename}]
	  {\ifthesection{\CTEXthesection\KG\sectiontitle}
      {\ifthechapter{\CTEXthechapter\KG\chaptertitle}{\chaptertitle}}}
    {}{\showthepage}%
  \setheadrule\ruleheight}

\renewpagestyle{plain}{}

\def\ttl@chapterout{\typeout{\CTEXthechapter}}

\def\FixCTEXtoclabel#1{%
  \csdef{ttl@toc#1}{%
    \def\ttl@a{\protect\numberline{\csuse{CTEXthe#1}}}%
  }%
}

\forcsvlist\FixCTEXtoclabel{part,chapter,section,subsection}

\let\orig@CTEXthepart\CTEXthepart
\renewcommand*\CTEXthepart{\ifcase\c@part\orig@CTEXthepart\or 上编\or 下编\else\orig@CTEXthepart\fi}

\sectionformat\part{%
     class=page,
     shape=block,
    format=\large\centering\bfseries,
     label=\raggedright\fzydzhhei\fbox{\ziju{.5}\CTEXthepart}\\ \vspace{\stretch{1}},
    before=\zihao{2}\fzcusong\ziju{.1}#1,
     after=\vspace{\stretch{2}}\afterpage{\cleardoublepage}}

\sectionformat\chapter{%
     class=top,
     shape=block,
    format=\zihao{4}\fzzhysong\ifthechapter{\fillinner}{\filcenter},
     label=\fzltheib\fillouter\zihao{-4}\CTEXthechapter\\[-2\p@]\titlerule[\ruleheight]\smallskip,
  labelsep=\z@,
    before=\varwidth[t]{\dimexpr\textwidth-3\ccwd\relax}#1\endvarwidth,
       top=\z@,
    bottom=1.5\baselineskip}

\sectionformat\chapter*{%
     shape=block,
    format=\zihao{4}\fzzhysong\fillinner,
    before=#1,
     after=\vspace{\baselineskip}\titlerule[\ruleheight],
       top=\bigskipamount,
    bottom=2\baselineskip}

\sectionformat\section{%
     class=straight,
     shape=hang,
    format=\Needspace{.2\textheight}\bfseries\zihao{-4}\fzzhysong\filright,
     label=\CTEXthesection,
  labelsep=.8\ccwd,
    before=\rule\z@{2\ccwd}#1,
       top=\bigskipamount,
    bottom=\bigskipamount,
      left=\z@}

\pretocmd\part\cleardoublepage{}{}

\robustify{\ding}
\newcommand*\DingNum[1]{%
  \ifnumgreater{#1}{10}%
    {\typeout{The value of input number is \number#1, larger than 10}}{}%
  \ding{\number\numexpr#1 + 171\relax}}
\newcommand*\Ding[1]{\DingNum{\value{#1}}}

\ifdefdimen\footnotemargin{}{\newdimen\footnotemargin}
\renewcommand*\thefootnote{\Ding{footnote}}
\renewcommand*\footnoterule{%
  \kern-3.6\p@
  \hrule\@width.4\columnwidth\@height.6\p@
  \kern3\p@}
\settowidth\footnotemargin{\footnotesize\DingNum{1}}
\footnotemargin=\dimexpr1.5\footnotemargin\relax
\renewcommand\@makefntext[1]{%
  \@setpar{\@@par
           \@tempdima=\dimexpr\hsize-\footnotemargin\relax
           \parshape\@ne\footnotemargin\@tempdima\relax
           \widowpenalty=\@M\relax}%
  \par\CTEXindent\noindent
  \linespread{1.2}\selectfont
  \llap{\makebox[\footnotemargin][l]{\@thefnmark}}%
  \ignorespaces#1}
\renewcommand*\@makefnmark{\raisebox{1ex}[\z@]{\small\@thefnmark}}
\footnotesep=\dimexpr1.2\footnotesep\relax

\let\orig@footnote\footnote
\renewcommand\footnote[1]{\unskip\orig@footnote{#1}\ignorespaces}

\renewenvironment{thebibliography}[1]{%
  \chapter{\bibname}
  \linespread{1.25}\small
  \list{%
    \llap{\@biblabel{\@arabic\c@enumiv}}\ignorespaces
  }{%
    \settowidth\labelwidth{\@biblabel{#1}}%
    \labelsep=.5\ccwd
    \leftmargin=\dimexpr\labelwidth+\labelsep\relax
    \topsep\z@
    \itemsep\z@
    \parsep\parskip
    \partopsep\parskip
    \usecounter{enumiv}%
    \let\p@enumiv\@empty
    \renewcommand*\theenumiv{\@arabic\c@enumiv}
  }%
  \widowpenalty\@M
}{%
  \def\@noitemerr{\@latex@warning{Empty `thebibliography' environment}}%
  \endlist
}

\newcounter{itemsection}
\newcommand\itemsection[1]{%
  \item[]\bigskip
  \refstepcounter{itemsection}%
  \mbox{\normalsize\bfseries\chinese{itemsection}、#1}%
  \medskip}

\let\orig@bibitem\bibitem
\renewcommand*\bibitem[1]{\orig@bibitem{bib-\the\c@enumiv}}

\newcommand\named[1]{%
  \unskip\nobreak\hfill\allowbreak\null\nobreak\hfill\quad\hbox{\normalfont ——\,#1}}

\endinput
%%
%% End of file `GaoHua.cls'.
