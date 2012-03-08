%# -*- coding:utf-8 -*-
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{JPM-class}
    [2011/06/07 v1.0 JinPingMei document class]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ProcessOptions\relax

\LoadClass[c5size,openany,nofonts]{ctexbook}

\RequirePackage[xetex]{geometry}
\RequirePackage[pagestyles,clearempty]{titlesec}
\RequirePackage[titles]{tocloft}
\RequirePackage{calc}
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

\ExplSyntaxOn
\cs_new:Nn \JPM_includechapters:n
  { \prg_replicate:nn {#1} \JPM_includechapters: }
\int_new:N \g_JPM_chapter_int
\cs_new:Nn \JPM_includechapters:
  {
    \int_gincr:N \g_JPM_chapter_int
    \int_compare:nTF { \g_JPM_chapter_int < \c_ten }
      {
        \tl_set:Nx \l_JPM_chapter_tl { 0 0 }
      }
      {
        \int_compare:nTF { \g_JPM_chapter_int < \c_one_hundred }
          { \tl_set:Nx \l_JPM_chapter_tl { 0 } }
          { \tl_set:Nx \l_JPM_chapter_tl { \c_empty_tl } }
      }
    \include{includefiles/JPM\l_JPM_chapter_tl\int_use:N\g_JPM_chapter_int}
  }
\cs_new_eq:NN \includechapters \JPM_includechapters:n
\iow_new:N \l_GB_range_stream
\file_if_exist:nTF { GB.range } { \file_input:n { GB.range } }
  {
    \clist_clear_new:N \l_GB_range_clist
    \tl_clear_new:N \l_GB_range_tl
    \bool_new:N \l_first_bool
    \bool_set_true:N \l_first_bool
    \group_begin:
    \tex_font:D \test_font_a "[FZJSJW.TTF]"
    \tex_font:D \test_font_b "[FZSS_GB18030.TTF]"
    \int_zero:N \l_tmpa_int
    \int_zero:N \l_tmpb_int
    \test_font_a
    \int_until_do:nNnn \l_tmpa_int > { "FFFF }
      {
        \reverse_if:N \etex_iffontchar:D \tex_font:D \l_tmpa_int
          \group_begin:
            \test_font_b
            \etex_iffontchar:D \tex_font:D \l_tmpa_int
              \bool_if:NTF \l_first_bool
                {
                  \int_gset_eq:NN \l_tmpb_int \l_tmpa_int
                  \int_gset_eq:NN \l_tmpc_int \l_tmpa_int
                  \bool_gset_false:N \l_first_bool
                }
                {
                  \int_compare:nF { \l_tmpa_int == \l_tmpb_int + 1 }
                    {
                      \int_compare:nTF { \l_tmpc_int == \l_tmpb_int }
                        {
                          \tl_gput_right:Nx \l_GB_range_tl
                            { \int_use:N \l_tmpb_int , }
                        }
                        {
                          \tl_gput_right:Nx \l_GB_range_tl
                            { \int_use:N \l_tmpc_int -> \int_use:N \l_tmpb_int , }
                        }
                      \int_gset_eq:NN \l_tmpc_int \l_tmpa_int
                    }
                  \int_gset_eq:NN \l_tmpb_int \l_tmpa_int
                }
            \fi:
          \group_end:
        \fi:
        \int_incr:N \l_tmpa_int
      }
    \tl_gput_right:Nx \l_GB_range_tl
      { \int_use:N \l_tmpc_int -> \int_use:N \l_tmpb_int }
    \group_end:
    \iow_open:Nn \l_GB_range_stream { GB.range }
    \iow_now:Nx \l_GB_range_stream
      {
        \exp_not:n { \clist_gset:Nn \l_GB_range_clist }
        { \tl_use:N \l_GB_range_tl }
      }
    \iow_close:N \l_GB_range_stream
  }
\xeCJKDeclareSubCJKBlock{GB18030}{ \l_GB_range_clist }
\xeCJKDeclareSubCJKBlock{Ext-B}{ "20000 -> "2A6DF }
\ExplSyntaxOff

\xeCJKsetup {
CJKchecksingle = true,
  AutoFakeBold = false,
 AutoFakeSlant = false,
AutoFakeItalic = false,
     CJKecglue = {},
    PunctStyle = kaiming,
 KaiMingPunct+ = {：；},
}
\setCJKmainfont[
     BoldFont=FZHei-B01,
   ItalicFont=FZJKai-Z03S,
  SlantedFont=FZFangSong-Z02,
     GB18030={[
       BoldFont=FZHei-B01_GB18030,
     ItalicFont=FZKai-Z03_GB18030,
    SlantedFont=FZFangSong-Z02_GB18030]{FZShuSong-Z01_GB18030}},
       Ext-B={[
     ItalicFont={FZKaiS-Extended(SIP)}]{Sun-ExtB}}
]{FZJSong-Z01S}

\setCJKsansfont[
     BoldFont=FZHei-B01,
   ItalicFont=FZJKai-Z03S,
  SlantedFont=FZFangSong-Z02,
     GB18030={[
       BoldFont=FZHei-B01_GB18030,
     ItalicFont=FZKai-Z03_GB18030,
    SlantedFont=FZFangSong-Z02_GB18030]{FZZhongDengXian-Z07_GB18030}}
]{FZZhongDengXian-Z07}

\setCJKmonofont[
     BoldFont=FZHei-B01,
   ItalicFont=FZJKai-Z03S,
  SlantedFont=FZFangSong-Z02,
     GB18030={[
       BoldFont=FZHei-B01_GB18030,
     ItalicFont=FZKai-Z03_GB18030,
    SlantedFont=FZFangSong-Z02_GB18030]{FZKai-Z03_GB18030}}
]{FZJKai-Z03S}

\newCJKfontfamily{\fzwkai}   {FZBeiWeiKaiShu-S19_GB18030}  % 方正北魏楷书
\newCJKfontfamily{\fzzhdxian}{FZZhongDengXian-Z07_GB18030} % 方正中等线
\newCJKfontfamily{\fzltheib} {FZLanTingHei-RC-GBK}         % 方正兰亭黑扁
\newCJKfontfamily{\fzydzhhei}{FZYunDongHei-M-GBK}          % 方正韵动中黑
\newCJKfontfamily{\fzzhysong}{FZYaSong-DB-GBK}             % 方正中雅宋
\newCJKfontfamily{\fzqiti}   {FZQiTi-S14}                  % 方正启体
\newCJKfontfamily{\fzliukai}[GB18030=FZQiTi-S14]{FZSuXinShiLiuKaiS-R-GB}% 方正苏新诗柳楷简体

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
