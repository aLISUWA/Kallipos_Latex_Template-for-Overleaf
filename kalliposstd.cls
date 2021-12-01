%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% Kallipos Standard LaTeX Class File %%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Created by A. Syropoylos
%%
% Copyright © 2021, Hellenic Academic Libraries Link (HEAL-Link)  / ELKE 
% NTUA -KALLIPOS, Open Academic Editions
% National Technical University of Athens (NTUA)
% Zografou Campus
% 9, Iroon Polytechniou str
% 15780 Zografou
% www.kallipos.gr
%
% This work may be distributed and/or modified under the conditions of the LaTeX Project Public License, either version 1.3 of this % license or (at your option) any later version.
%
% The latest version of this license is in http://www.latex-project.org/lppl.txt
% and version 1.3 or later is part of all distributions of LaTeX version 2005/12/01 or later.
%
%This work has the LPPL maintenance status `maintained'.
%
%The Current Maintainer of this work is Apostolos Syropoulos.
%
%This work consists of the file : kalliposstd.cls
%
% ------------------------------------------
%This work was funded by:
% -------------------------------------------
% National Public Investment Program (PIP) of the Greek Government
% through the Ministry of Education, Research and Religious Affairs
%-----------------------------------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{kalliposstd}[2021/11/05 kallipos LaTeX class]
\newif\ifcustombook
\custombookfalse
\newif\ifdraft
\draftfalse
\newif\ifnonderivative
\nonderivativefalse
%%
\DeclareOption{a4book}{\custombookfalse}
%%
\DeclareOption{custombook}{\custombooktrue}
%%
\DeclareOption{draft}{\setlength\overfullrule{5pt}\drafttrue}
%%
\DeclareOption{nonderivative}{\nonderivativetrue}
%%
\ExecuteOptions{a4book}
\ProcessOptions
\LoadClass[twoside,12pt]{book}
%%%% Load Basic Packages
\RequirePackage{xltxtra}
\RequirePackage[nonumeralsign]{xgreek}
%%%
%%% Hyphenation
%%%
\RequirePackage{ucharclasses}
\setTransitionsForGreek{\setlanguage{monogreek}}{}
\setTransitionsForLatin{\setlanguage{american}}{}
%%%
\parindent=1pc
\parskip=0pt %plus .1pt
%%%%%%
%%%%%% Class Options
%%%%%%
\RequirePackage[xetex]{geometry}
%
%
\ifcustombook%
   \geometry{%hoffset=1in,  voffset=-5cm,
        centering,xetex,
        paperwidth=170mm,paperheight=240mm,
        heightrounded,lmargin=21mm,rmargin=21mm,tmargin=25mm,bmargin=15mm,
        headsep=8mm,headheight=15mm,marginparwidth=0pt,includefoot}%
\else%
     \geometry{%
        centering,xetex,
        paperwidth=205mm,paperheight=290mm,
        lmargin=21mm,rmargin=21mm,tmargin=20mm,bmargin=20mm,
        headsep=8mm,headheight=15mm,marginparwidth=15pt}%
\fi
%%%
\setcounter{secnumdepth}{4}
\setcounter{tocdepth}{4}
%%%
%%%%%%%%%%%%
%%%%%%%%%%%% Fonts
%%%%%%%%%%%%
\newfontfamily\partnumberfont{Arimo-Bold.ttf}[SizeFeatures={Size=14}]
\newfontfamily\partfont{Arimo-Regular.ttf}[SizeFeatures={Size=24}]
\newfontfamily\chaptertitlefont{Arimo-Regular.ttf}[SizeFeatures={Size=18}]
\newfontfamily\chapternumberfont{Arimo-Bold.ttf}[SizeFeatures={Size=14}]
\newfontfamily\sectionfont{Arimo-Bold.ttf}[SizeFeatures={Size=10}]
\newfontfamily\subsectionfont{Arimo-Bold.ttf}[SizeFeatures={Size=10}]
\newfontfamily\subsubsectionfont{Arimo-BoldItalic.ttf}[SizeFeatures={Size=10}]
\newfontfamily\paragraphfont{Arimo-Italic.ttf}[SizeFeatures={Size=10}]
\newfontfamily\runningheadfont{Arimo-Regular.ttf}[SizeFeatures={Size=7}]
\newfontfamily\foliofont{Arimo-Bold.ttf}[SizeFeatures={Size=9}]
%%%%%%%%%%%%
%%%%%%%%%%%% Section headers
%%%%%%%%%%%%
\RequirePackage[pagestyles,explicit]{titlesec}
%%%%%%%%%%%%%%%%%%%%%%%%
%%% part heading
%%%%%%%%%%%%%%%%%%%%%%%%
\titleformat{\part}[display]
            {\partnumberfont}
            {\partname\ \thepart\hfill\vrule depth12pt width0pt\hrule height3pt}
            {\ifcustombook 7.5pc\else 11.5pc\fi}
            {\raggedright\partfont\MakeUppercase{#1}\vskip1pc\hrule height 1pt}
\assignpagestyle{\part}{empty}
%\titlespacing*{hcommand i}{hlefti}{hbefore-sepi}{hafter-sepi}[hright-sepi]
\titlespacing*{\part}{0pt}{20pt}{0pt}
%%%%%%%%%%%%%%%%%%%%%%
%%% chapter heading
%%%%%%%%%%%%%%%%%%%%%%
\titleformat{\chapter}[display]
            {\chapternumberfont}
            {\MakeUppercase{\chaptername}\ \thechapter\hfill\vrule depth12pt width0pt\hrule height3pt}
            {\ifcustombook 7.5pc\else 11.5pc\fi}
            {\raggedright\chaptertitlefont\MakeUppercase{#1}\vskip1pc\hrule height 1pt}
\titleformat{name=\chapter,numberless}[display]
            {\chapternumberfont}
            {\vrule depth12pt width0pt\hrule height3pt}
            {\ifcustombook 3.5pc\else 7.5pc\fi}
            {\raggedright\chaptertitlefont\MakeUppercase{#1}\vskip1pc\hrule height 1pt}
\titlespacing*{\part}{0pt}{20pt}{0pt}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Numberless chapter that should be included in the table of contents
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand\schapter[1]{%
  \chapter*{#1}%
  \addcontentsline{toc}{chapter}{#1}%
  \chaptermark{\MakeUppercase{#1}}}
%%%%%%%%%%%%%%%%%%%
%% chapter author
%%%%%%%%%%%%%%%%%%%
\RequirePackage{suffix}
\NewDocumentCommand\chapterauthor{m o}{%
  \IfNoValueTF{#2}{\authortoc{#1}\printchapterauthor{#1}}{%
                   \authortoc{#1}\printchapterauthor{#2}}}
\WithSuffix\newcommand\chapterauthor*[1]{\printchapterauthor{#1}}
\newcommand{\printchapterauthor}[1]{%
  {\parindent0pt\vspace*{-25pt}%
  \linespread{1.1}\large\scshape#1%
  \par\nobreak\vspace*{35pt}}
  \@afterheading%
}
\newcommand{\authortoc}[1]{%
  \addtocontents{toc}{\vskip-10pt}%
  \addtocontents{toc}{%
    \protect\contentsline{chapter}%
    {\hskip1.3em\mdseries\scshape\protect\scriptsize#1}{}{}}
  \addtocontents{toc}{\vskip5pt}%
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Chapter summary
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\changemargin#1#2{\list{}{\rightmargin#2\leftmargin#1%
\listparindent=\parindent%
\parsep=\z@}\item[]\hspace{\parindent}}
\let\endchangemargin=\endlist
\RequirePackage{tikz}
\NewDocumentCommand\myITC{m}{%
\begin{tikzpicture}
  \node[inner xsep=0pt,text width=\columnwidth,
    align=left,left color=black!15,right color=white]
    {\parbox[t]{\columnwidth}{\large\sffamily\bfseries\ #1}};
  \end{tikzpicture}%
}
\newsavebox{\summarybox}
\NewDocumentEnvironment{summary}{m}{%
\noindent\myITC{#1}
\vspace*{-20pt}

\noindent\begin{lrbox}{\summarybox}%
\begin{minipage}{\columnwidth}}
{\end{minipage}\end{lrbox}%
  \colorbox{black!15}{\usebox{\summarybox}}\bigskip}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% section, subsection, etc.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\titleformat{\section}{\sectionfont}{\thesection\ #1}{1em}{}
\titleformat{name=\section,numberless}{\sectionfont}{#1}{1em}{}
\titleformat{\subsection}{\subsectionfont}{\thesubsection\ #1}{1em}{}
\titleformat{name=\subsection,numberless}{\subsectionfont}{\#1}{1em}{}
\titleformat{\subsubsection}{\subsubsectionfont}{\thesubsubsection\ #1}{1em}{}
\titleformat{name=\subsubsection,numberless}{\subsubsectionfont}{#1}{1em}{}
\titleformat{\paragraph}[runin]{\paragraphfont}{\theparagraph\ #1}{1em}{}
\titleformat{name=\paragraph,numberless}[runin]{\paragraphfont}{#1}{1em}{}
\titleformat{name=\subparagraph,numberless}[runin]{\normalfont\normalsize\bfseries}{#1}{1em}{}
%%%
\titlespacing*{\section}{0pt}{22pt plus -1pt minus -6pt}{13pt}
\titlespacing*{\subsection}{0pt}{16pt plus -1pt minus -3pt}{8pt}
\titlespacing*{\subsubsection}{0pt}{12pt plus -1pt minus -6pt}{1em}
\titlespacing*{\paragraph}{0pt}{12pt}{1em}
\titlespacing*{\subparagraph} {\parindent}{3.25ex \@plus1ex \@minus .2ex}{1em}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% exercises
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{enumitem}
\newcounter{exersection}
\titleclass{\exersection}{straight}[\chapter]
\titleformat{\exersection}{\sectionfont}{}{1em}{\sectionfont #1}
\titlespacing*{\exersection}{0pt}{1ex}{1ex}
\newlist{exerciseslist}{enumerate}{10}
\setlist[exerciseslist]{label*=\bfseries\thesection.\arabic*}
\NewDocumentEnvironment{exercises} { o }
     {%
      \IfNoValueTF{#1} { \gdef\sectiontitle{Ασκήσεις} }{ \gdef\sectiontitle{#1} }
      \exersection*{\sectiontitle}%
      \addcontentsline{toc}{section}{\protect\numberline{}\sectiontitle}%
      \relax
      \begin{exerciseslist}
     }
     {\end{exerciseslist}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% answers
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{newfile}
\def\newanswer#1{%
   \newoutputstream{#1}%
   \openoutputfile{\jobname.#1}{#1}%
   \expandafter\gdef\csname close#1\endcsname{\closeoutputstream{#1}}%
   \expandafter\gdef\csname write#1\endcsname{%
      \addtostream{#1}{\string\indent\string\bfseries\ \thesection.\arabic{exerciseslisti}%
             \ \string\mdseries \string\ (σελ.\ \the\c@page):}%
  	  \@bsphack
  	  \let\do\@makeother\dospecials
  	  \catcode`\^^M\active
  	  \verbatim@startline
  	  \verbatim@addtoline
  	  \verbatim@finish
  	  \def\verbatim@processline{%
    	 \immediate\write\@nameuse{#1outstre@m}{\the\verbatim@line\\}}%
  	  \verbatim@start}%
   \expandafter\gdef\csname endwrite#1\endcsname{\@esphack}
   \expandafter\gdef\csname input#1\endcsname{\input{\jobname.#1}}%
}
%\addtostream{solutions}{...}
%\closeoutputstream{solutions}
%\input{\jobname.solutions}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%% METADATA "Variables" %%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\primaryauthor#1{\gdef\@primaryauthor{#1}}%
\def\@mypdftitle{\relax}
\def\PDFtitle#1{\gdef\@mypdftitle{#1}}%             <---- pdftitle
\def\@pdfdoi{\relax}%
\def\PDFdoi#1{\gdef\@pdfdoi{#1}}%                <---- pdfdoi
\def\@mypdfauthor{\relax}%
\def\PDFauthor#1{\gdef\@mypdfauthor{#1}}%          <---- pdfauthor(s)
\def\@pdfyear{\relax}%
\def\PDFyear#1{\gdef\@pdfyear{#1}}%              <---- pdfyear
\def\@pdfshorttitle{\relax}%
\def\PDFshorttitle#1{\gdef\@pdfshorttitle{#1}}%    <---- short book title for page headings
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%% Page styles
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newpagestyle{mainstyle}[]{
    \restoregeometry%
    \sethead[{\foliofont\thepage}\quad{\runningheadfont\MakeUppercase{\chaptertitle}}]%  even-left
            []%                              even-center
            []%     even-right
            {}%     odd-left
            {}%                              odd-center
%            {{\runningheadfont\MakeUppercase{\sectiontitle}}\quad{\foliofont\thepage}}%  odd-right
            {{\runningheadfont\MakeUppercase{\@pdfshorttitle}}\quad{\foliofont\thepage}}%  odd-right
    \setfoot[][][]{}{}{}%
  }
%%%%%%%%%%
\newpagestyle{nosections}[]{
    \sethead[{\foliofont\thepage}\quad{\runningheadfont\MakeUppercase{\chaptertitle}}]%  even-left
            []%                              even-center
            []%     even-right
            {}%     odd-left
            {}%                              odd-center
            {{\runningheadfont\MakeUppercase{\chaptertitle}}\quad{\foliofont\thepage}}%  odd-right
    \setfoot[][][]{}{}{}%
  }
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%% PAGE STYLES %%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newpagestyle{chapfirstpage}[]{
      \ifcustombook%
         \newgeometry{%hoffset=1in,  voffset=-5cm,
                      centering,
                      heightrounded,lmargin=21mm,rmargin=21mm,tmargin=15mm,bmargin=35mm,footskip=15mm,
                      headsep=8mm,headheight=15mm,marginparwidth=0pt,includefoot}%
      \else%
         \newgeometry{%
                      centering,
                      lmargin=21mm,rmargin=21mm,tmargin=11mm,bmargin=34mm,footskip=14mm,
                      headsep=8mm,headheight=15mm,marginparwidth=15pt}%
      \fi
    \sethead[]%  even-left
            []%  even-center
            []%  even-right
            {}%  odd-left
            {}%  odd-center
            {}%  odd-right
    \setfoot[][][]{\footnotesize\begin{tabular}{l}\@primaryauthor\, «\href{\@pdfdoi}{\@mypdftitle}»\\
                   Copyright© \@pdfyear, ΣΕΑΒ/ΕΛΚΕ ΕΜΠ - ΚΑΛΛΙΠΟΣ, ΑΝΟΙΚΤΕΣ ΑΚΑΔΗΜΑΪΚΕΣ ΕΚΔΟΣΕΙΣ\\
                   \ifnonderivative\raisebox{-.2\height}{\includegraphics[scale=0.8]{logos/by-nc-nd-small.pdf}}\
                    Creative Commons Αναφορά Δημιουργού - Μη Εμπορική Χρήση - Όχι Παράγωγα Έργα 4.0\else%
                    \raisebox{-.2\height}{\includegraphics[scale=0.8]{logos/by-nc-sa-small.pdf}}\
                    Creative Commons Αναφορά Δημιουργού - Μη Εμπορική Χρήση - Παρόμοια Διανομή 4.0\fi\end{tabular}}%
            {}{}%
  }
%%
\renewcommand\frontmatter{%
    \cleardoublepage
  \@mainmatterfalse
  \pagenumbering{roman}
  \pagestyle{nosections}}
\renewcommand\mainmatter{%
   \cleardoublepage
  \@mainmattertrue
  \pagenumbering{arabic}
  \pagestyle{mainstyle}
  \assignpagestyle{\chapter}{chapfirstpage}}
\renewcommand\appendix{\par
  \assignpagestyle{\chapter}{empty}
  \setcounter{chapter}{0}%
  \setcounter{section}{0}%
  \gdef\chaptername{Παράρτημα}%
  \gdef\thechapter{\@Alph\c@chapter}}
%%%%%%%%%%%%
%%%%%%%%%%%% Front matter
%%%%%%%%%%%%
\RequirePackage{pdfpages}
\RequirePackage{hyperxmp}
\RequirePackage{hyperref}
%\definecolor{MustardYellow}{cmyk}{0.0, 0.23, 1.0 0.12}
\NewDocumentCommand\soletitlepage{m}{%
   \pagestyle{empty}%
   \vspace*{\stretch{1}}
   {\bfseries\LARGE\MakeUppercase{#1}}\hfill
   \vspace*{\stretch{2}}\hbox{ }
   \newpage
   \null
   \newpage}
%%
\NewDocumentEnvironment{authorpage}{m o}{%
 %  \vspace{\stretch{1}}
 \vspace*{4cm}
   {\bfseries\LARGE #1}\hfill

   \IfValueT{#2}{%
     \vspace*{5pt}

     {\bfseries\large #2}\hfill%
   }{}%

   \rule{400pt}{0.5pt}
   \vspace*{25pt}}{%
   \vspace{\stretch{1}}
   \begin{flushleft}
   \begin{tabular} {p{0.20\linewidth} p{0.65\linewidth}}
\raisebox{-.6\totalheight}{\includegraphics[scale=0.6]{logos/Kallipos-logo-gr-b-w.pdf}}  &    {\Large\bfseries ΚΑΛΛΙΠΟΣ \newline ΑΝΟΙΚΤΕΣ ΑΚΑΔΗΜΑΪΚΕΣ ΕΚΔΟΣΕΙΣ} \newline \url{www.kallipos.gr} \\
   \end{tabular}
   \end{flushleft}
   \null
   \newpage}
%%%%%%%%
\def\changemargin#1#2{\list{}{\rightmargin#2\leftmargin#1%
\listparindent=\parindent%
\parsep=\z@}\item[]\hspace{\parindent}}
\let\endchangemargin=\endlist 
%%%%%%%%
\DeclareRobustCommand\and{%   % \begin{tabular}
  \end{tabular}%
  \vskip 1em%
  \begin{tabular}{l}}%
\NewDocumentEnvironment{authors}{}{%
  \begin{changemargin}{3.5cm}{0pt}\begin{tabular}{l}}{\end{tabular}\end{changemargin}}
%%
\NewDocumentCommand\copyrightpage{m m m m}{%
   \vspace*{10cm}

   \noindent{Τίτλος πρωτοτύπου: <<\em\@mypdftitle>>}\\
   \noindent\textbf{Copyright\ ©\ \@pdfyear, ΣΕΑΒ/ ΕΛΚΕ ΕΜΠ - ΚΑΛΛΙΠΟΣ, ΑΝΟΙΚΤΕΣ  ΑΚΑΔΗΜΑΪΚΕΣ ΕΚΔΟΣΕΙΣ}

   \ifnonderivative%
   \noindent\includegraphics[scale=1]{logos/by-nc-nd.eu.pdf}

   \noindent Το παρόν έργο αδειοδοτείται υπό τους όρους της άδειας Creative Commons Αναφορά Δημιουργού – Μη Εμπορική
    Χρήση – Όχι Παράγωγα Έργα 4.0. Για να δείτε ένα αντίγραφο της άδειας αυτής επισκεφτείτε τον ιστότοπο\\
    \url{https://creativecommons.org/licenses/by-nc-nd/4.0/legalcode.el}\\
     Αν τυχόν κάποιο τμήμα του έργου διατίθεται με διαφορετικό καθεστώς αδειοδότησης, αυτό αναφέρεται ρητά και ειδικώς
     στην οικεία θέση
   \else%
   \noindent\includegraphics[scale=1]{logos/by-nc-sa.eu.pdf}

   \noindent Το παρόν έργο διατίθεται με τους όρους της άδειας Creative Commons Αναφορά Δημιουργού – Μη Εμπορική Χρήση –
   Παρόμοια Διανομή 4.0. Για να δείτε τους όρους της άδειας αυτής επισκεφτείτε τον ιστότοπο\\
   \url{https://creativecommons.org/licenses/by-nc-sa/4.0/legalcode.el}\\
    Αν τυχόν κάποιο τμήμα του έργου διατίθεται με διαφορετικό καθεστώς αδειοδότησης, αυτό αναφέρεται ρητά και ειδικώς
    στην οικεία θέση.
   \fi

   \begin{flushleft}
    \begin{tabular} {p{0.35\linewidth} p{0.65\linewidth}}
    \textbf{Συντελεστές έκδοσης}\\
     Γλωσσική επιμέλεια:   & #1\\[4pt]
     Γραφιστική επιμέλεια: & #2\\[4pt]
     Τεχνική επεξεργασία:  & #3\\[6pt]
     \textbf{\Large ΚΑΛΛΙΠΟΣ}\\[6pt]
     Εθνικό Μετσόβιο Πολυτεχνείο\\[4pt]
     Ηρώων Πολυτεχνείου 9\\[4pt]
     15780 Ζωγράφου\\[4pt]
     \url{www.kallipos.gr}\\[7pt]
 Βιβλιογραφική αναφορά: & {\@mypdfauthor, \@pdfyear. \textit{\@mypdftitle}. Αθήνα: Κάλλιπος, Ανοικτές Ακαδημαϊκές Εκδόσεις}\\
     Διαθέσιμο στο: & {\href{\@pdfdoi}{\@pdfdoi}}\\[5pt]
     \textbf{ISBN}: & \textbf{#4}
    \end{tabular}
   \end{flushleft}
   \null
   \newpage}
\NewDocumentEnvironment{dedication}{}{%
\null
\vspace*{5cm}

\begin{flushright}
\begin{minipage}{205pt}
\large}{\end{minipage}\end{flushright}\hfill}
\endinput
