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
\RequirePackage{empheq,amsthm,thmtools,mlist,systeme,siunitx}
\RequirePackage[uppi,comma,overparen,mathscrf,mathbb,lucida]{varint}
\RequirePackage{needspace,chngcntr,changepage,environ,afterpage}
\RequirePackage{caption,floatrow,wrapfig,labelref}
\RequirePackage[inline,shortlabels]{enumitem}
\RequirePackage{tabu,diagbox,enumcols}
\RequirePackage[perpage,stable,bottom]{footmisc}
\RequirePackage[pagestyles,explicit,clearempty,outermarks]{titlesec}
\RequirePackage[titlesec]{interfaces}
\RequirePackage{titletoc,pifont,marvosym}
\RequirePackage[showframe=false]{geometry}
\RequirePackage{hypbmsec}
\RequirePackage{hyperref}

\geometry{
    papersize={170mm,240mm},
    textwidth=130mm,
        lines=36,
          top=20mm,
        inner=15mm,
   headheight=5mm,
      headsep=7mm,
     footskip=1em,
bindingoffset=10mm
}

\definecolor{linkred}{rgb}{.65,.05,.1}

\hypersetup{
     pdfstartview={XYZ null null 1},
      pdfpagemode=UseNone,
  pdfprintscaling=None,
        pdfduplex=DuplexFlipLongEdge,
  bookmarksopen,
      bookmarksdepth=2,
  bookmarksopenlevel=0,
  bookmarksnumbered,
  colorlinks,
  linkcolor=linkred,
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

\hbadness=\@M
\newcount\hbadness
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
  {\DoNotMakeVolume\let\tableofcontents\relax\orig@includeonly}
  {\orig@includeonly}%
}

\endinput
%%
%% End of file `MA-Book.cls'.