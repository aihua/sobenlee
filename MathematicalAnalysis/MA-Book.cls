%# -*- coding:utf-8 -*-
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{MA-Book}
  [2011/11/14 v2.0 MA-Book document class]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ProcessOptions*\relax

\PassOptionsToPackage{log-declarations=false}{xparse}
\PassOptionsToPackage{no-math,silent}{fontspec}
\PassOptionsToPackage{CJKchecksingle,fallback}{xeCJK}
\LoadClass[twoside,openany,c5size,nofonts,fntef]{ctexbook}[2009/05/05]

\RequireXeTeX

\RequirePackage[lucidasmallscale,math-style=iso,nofontinfo]{lucimatx}
\RequirePackage{empheq,amsthm,thmtools,mlist,siunitx}
\RequirePackage[uppi,comma,overparen,mathscrf,mathbb,lucida]{localint}
\RequirePackage{needspace,chngcntr,changepage,environ,afterpage,ifthen}
\RequirePackage{caption,floatrow,wrapfig,labelref}
\RequirePackage{enumitem,tabu,diagbox,enumcols}
\RequirePackage[perpage,stable,bottom]{footmisc}
\RequirePackage[pagestyles,explicit,clearempty,outermarks]{titlesec}
\RequirePackage[titlesec]{interfaces}
\RequirePackage{titletoc,pifont,marvosym,xcolor}
\RequirePackage[showframe=false,headheight=5mm,headsep=7mm,footskip=1em,bindingoffset=10mm]{geometry}
\RequirePackage{hypbmsec}
\RequirePackage[pdfstartview={XYZ null null 1},pdfpagemode=UseNone,pdfprintscaling=None]{hyperref}

\geometry{papersize={170mm,240mm},top=20mm,textwidth=130mm,lines=36,inner=15mm}

%\RequirePackage[cam,a4,center,noinfo]{crop}

\hypersetup{
  bookmarksopen,
  bookmarksdepth=2,
  bookmarksopenlevel=0,
  bookmarksnumbered,
  colorlinks,
  linkcolor=purple,
  pdfinfo={
      Title={数学分析},
     Author={北京大学数学系},
    Creator={XeLaTeX + xeCJK + CTeX}
  }
}

\let\HyPsd@Warning\@gobble\relax
\graphicspath{{includefiles/figures/}}
\definecolor{titlegray}{gray}{.75}
\newrobustcmd*\MAB@error{\ClassError{MA-Book}}

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

\let\orig@includeonly=\includeonly
\def\includeonly{\@ifstar
  {\DoNotMakeVolume\orig@includeonly}
  {\orig@includeonly}}

\endinput
%%
%% End of file `MA-Book.cls'.