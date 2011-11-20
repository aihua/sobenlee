%# -*- coding:utf-8 -*-
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{MA-Book}
  [2011/11/14 v2.0 MA-Book document class]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ProcessOptions\relax
\PassOptionsToPackage{CJKchecksingle,no-math,silent,fallback}{xeCJK}
\LoadClass[c5size,openany,nofonts]{ctexbook}[2009/05/05]

\RequireXeTeX

\def\hmmax{0}     % default 3
\def\bmmax{0}     % default 4

\RequirePackage{XITS}
\RequirePackage[mtphrb,mtpcal,subscriptcorrection]{mtpro2}
\RequirePackage[uppi,comma]{localint}
\RequirePackage{empheq,amsthm,thmtools}
\RequirePackage{siunitx,needspace,varwidth,chngcntr,changepage,environ}
\RequirePackage{floatrow,caption,wrapfig}
\RequirePackage[pagestyles,explicit,clearempty,outermarks]{titlesec}
\RequirePackage[titlesec]{interfaces}
\RequirePackage{enumitem,pifont,xcolor,labelformat}
\RequirePackage[hang]{multicolist}
\RequirePackage[showframe=false,twoside,headheight=5mm,headsep=7mm,footskip=1em,bindingoffset=10mm]{geometry}
\RequirePackage[pdfstartview={XYZ null null 1},pdfpagemode=UseNone,pdfprintscaling=None]{hyperref}

\geometry{papersize={170mm,240mm},top=20mm,textwidth=130mm,lines=36,inner=15mm}

\hypersetup{%
  bookmarksopen,
  bookmarksopenlevel=0,
  bookmarksnumbered,
  colorlinks, linkcolor=purple,
%  linktocpage,
  pdfinfo={
      Title={数学分析},
     Author={北京大学数学系},
    Creator={XeLaTeX + xeCJK + CTeX}
  }
}

\let\HyPsd@Warning\@gobble\relax

\graphicspath{{includefiles/figures/}}

\predisplaypenalty   = \z@
\postdisplaypenalty  = \z@
\clubpenalty         = \z@
\widowpenalty        = \z@
\displaywidowpenalty = \z@
\interlinepenalty    = \z@
\brokenpenalty       = \sixt@@n
\parskip             = \z@
\thinmuskip          = 2 mu
\medmuskip           = 3 mu  \@plus 1 mu  \@minus 3 mu
\thickmuskip         = 4 mu  \@plus 1 mu  \@minus 2 mu
\hfuzz   = 10\p@
\vfuzz   = 10\p@
\topskip = 10\p@

\newdimen\ruleheight
\ruleheight = .8\p@

\smallskipamount=3 \p@\relax
\medskipamount  =6 \p@\relax
\bigskipamount  =12\p@\relax

\gappto\bfseries{\boldmath}

\sisetup{group-minimum-digits=4,round-integer-to-decimal}

\raggedbottom
\allowdisplaybreaks[4]

\input{MA-FontSet.def}
\input{MA-Cover.def}
\input{MA-Title.def}
\input{MA-PageStyle.def}
\input{MA-TOC.def}
\input{MA-List.def}
\input{MA-Theorem.def}
\input{MA-Math.def}

\let\includeonly@ori\includeonly\relax
\def\includeonly{%
  \@ifstar{\DoNotMakeVolume\includeonly@ori}{%
  \includeonly@ori}}

\endinput
%%
%% End of file `MA-Book.cls'.