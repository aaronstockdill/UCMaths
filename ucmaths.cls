% ucmaths.cls
%
% A LaTeX2e documentclass for the University of Canterbury Faculty of
% Mathematics and Statistics students to use when writing their answers
% to assignments / projects / whatever, should they choose to use LaTeX.

%% ucmaths.cls
%% This work is licensed under a Creative Commons
%% Attribution-ShareAlike 4.0 International License.
% This file was originally created by Aaron Stockdill.

\def\fileversion{1.1.0}
\def\filedate{2016/08/22}

%% Thanks to:
%     TeXExchange, for already having all the answers.
%     Jeanette McLeod, for supplying the starting point for this class.
%     Peter Renaud, who in turn provided Jeanette the starting point
%                   for her file.

\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{ucmaths}[\filedate\space Version \fileversion\space by
    Aaron Stockdill]

\RequirePackage{ifthen}
\RequirePackage{array}
\RequirePackage{calc}

\newcolumntype{L}[1]{p{#1}}
\newcolumntype{C}[1]{>{\centering\arraybackslash}p{#1}}
\newcolumntype{R}[1]{>{\raggedleft\arraybackslash}p{#1}}

%% We provide the option to have the pages prompt for a signature
\newif\ifsignedpages
\signedpagesfalse
\newif\ifblankpage
\blankpagefalse
\DeclareOption{signature}{\signedpagestrue}
\DeclareOption{twosided}{\blankpagetrue}

\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{article}%
}
\ProcessOptions\relax
\LoadClass{article}  % After all, this is essentially a skinned article

%-------------------------------------------------------------------------------

%  PAGE LAYOUT

\setlength{\textwidth}{\paperwidth}
\addtolength{\textwidth}{-2in}
\setlength{\oddsidemargin}{0pt}
\setlength{\evensidemargin}{0pt}

\setlength{\headheight}{15pt}
\setlength{\headsep}{15pt}
\setlength{\topmargin}{0in}
\addtolength{\topmargin}{-\headheight}
\addtolength{\topmargin}{-\headsep}
\setlength{\footskip}{29pt}
\setlength{\textheight}{\paperheight}
\addtolength{\textheight}{-2.2in}

\setlength{\marginparwidth}{.5in}
\setlength{\marginparsep}{5pt}

\def\@oddhead{%
    \ifnum\value{page}=1\relax
    \else\ifnum\value{page}=2\relax
    \else\ifnum\@groupsize>1
    \makebox[\textwidth][l]{
    \bgroup
    \def\ucmaths@headrun{\numexpr \@groupsize - 2}
    \setlength{\tabcolsep}{0pt}
    \renewcommand{\arraystretch}{0.0}
    \begin{tabular}{*{\ucmaths@headrun}{l@{, }} l@{ and } l}
        \@author
    \end{tabular}
    \egroup}
    \else
    \bgroup
    \makebox[0.5\textwidth][l]{\@author}
    \hfill
    \makebox[0.5\textwidth][r]{\@studentid}
    \egroup
    \fi\fi\fi
}

\ifsignedpages
\def\@oddfoot{%
    \bgroup
        \ifnum\value{page}=1\relax
            \hspace{0.49\hsize}\hbox to 0.5\hsize{\thepage}
        \else
        \hbox to 0.5\hsize{Signature: \underline{\hspace{ 3 in}}}
        \hfill{\thepage}
        \fi
    \egroup
}
\else
\fi

%-------------------------------------------------------------------------------

%  TITLES and COVERS

\def\and{&}

\def\@groupsize{1}
\newcommand{\groupsize}[1]{\gdef\@groupsize{#1}}

\def\@author{\@empty}

\def\@studentid{\@empty}
\newcommand{\studentid}[1]{\gdef\@studentid{#1}}

\def\@coursecode{\@latex@error{No \noexpand\coursecode given}\@ehc}
\newcommand{\coursecode}[1]{\gdef\@coursecode{#1}}

\def\@coursetitle{\@latex@error{No \noexpand\coursetitle given}\@ehc}
\newcommand{\coursetitle}[1]{\gdef\@coursetitle{#1}}

\def\@duedate{\@latex@error{No \noexpand\due date given}\@ehc}
\newcommand{\due}[1]{\gdef\@duedate{#1}}

\def\@coverinfo{\@empty}
\newcommand{\coverinfo}[1]{\gdef\@coverinfo{#1}}

\newcommand{\@maketitlehead}{%
\begin{center}
\vspace*{0.0cm}
\@coursecode\\
\textsc{\@coursetitle}\\
\end{center}
}

\newcommand{\@maketitlebar}{%
\begin{center}
\bgroup
\setlength\tabcolsep{0cm}
\renewcommand{\arraystretch}{1.6}
\begin{tabular}{l r}
\hline
\makebox[0.3\textwidth][l]{\textbf{\@title}} &
\makebox[0.7\textwidth][r]{\textbf{Due \@duedate}} \\
\hline
\end{tabular}
\egroup
\end{center}
}

\newcommand{\@makecover}{%
\@maketitlehead
\vspace{0cm}
\@maketitlebar
\vspace{0.85cm}
\begin{center}
\textbf{STAPLE this page to the front of your assignment.}\\
\vspace{1cm}
\renewcommand{\arraystretch}{3.0}
\newlength{\ucmaths@cellsize}
\setlength{\ucmaths@cellsize}{9.5cm / \@groupsize}
\begin{tabular}{|p{4.0cm}|p{10.0cm}|}\hline
    \textbf{Name:} &
    \bgroup\renewcommand{\arraystretch}{0.0}
    \begin{tabular}{*{\@groupsize}{L{\ucmaths@cellsize}}}
        \@author
    \end{tabular}\egroup \\ \hline
    \textbf{Student ID:} &
    \bgroup\renewcommand{\arraystretch}{0.0}
    \begin{tabular}{*{\@groupsize}{L{\ucmaths@cellsize}}}
        \@studentid
    \end{tabular}\egroup \\ \hline
\end{tabular}
\vspace{3cm}\\
\parbox{0.7\textwidth}{\@coverinfo}
\end{center}
\clearpage
\ifblankpage
\leavevmode\thispagestyle{empty}\newpage
\setcounter{page}{2}
\else
\fi
}

\let\oldmaketitle\maketitle
\renewcommand{\maketitle}{%
\@makecover
\@maketitlehead
\if\@author\@empty
\else
\vspace{0.0cm}
\newlength{\ucmaths@namesize}
\setlength{\ucmaths@namesize}{\textwidth / \real{\@groupsize}}
\bgroup
\setlength{\tabcolsep}{0pt}
\renewcommand{\arraystretch}{0.0}
\large
\begin{tabular}{*{\@groupsize}{C{\ucmaths@namesize}}}
    \@author
\end{tabular} \\
\begin{tabular}{*{\@groupsize}{C{\ucmaths@namesize}}}
    \@studentid
\end{tabular}
\egroup
\fi
\@maketitlebar
\vspace{1cm}
}

%-------------------------------------------------------------------------------

%% PACKAGES
%  Load a selection of packages that are always useful.

\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{amsthm}
\RequirePackage{mathtools}
\RequirePackage{enumitem}

% Do some quick tweaks using them
\allowdisplaybreaks
\setlist[enumerate,1]{label=\arabic*.}
\setlist[enumerate,2]{label=(\roman*)}

%-------------------------------------------------------------------------------

%% MACROS
%  A collection of macros that should make life easier.

\DeclareMathOperator*{\argmin}{argmin}
\DeclareMathOperator*{\argmax}{argmax}
\DeclarePairedDelimiter\abs{\lvert}{\rvert}
\DeclarePairedDelimiter\norm{\lVert}{\rVert}
\DeclarePairedDelimiter\floor{\lfloor}{\rfloor}
\DeclarePairedDelimiter\ceil{\lceil}{\rceil}

\theoremstyle{definition}
\newtheorem{definition}{Definition}
\newtheorem{theorem}{Theorem}
\newtheorem{lemma}{Lemma}
\newtheorem{corollary}{Corollary}

\newcommand{\mlv}[1]{\textit{#1}}  % Multi-letter variable
\newcommand{\diff}{\mathrm{d}}
\newcommand{\divides}{\mid}
\newcommand{\sigfig}[1]{\quad(4\text{ s.f.})}

\let\@oldepsilon\epsilon
\let\epsilon\varepsilon
\let\varepsilon\@oldepsilon

\let\slashedzero\emptyset
\let\emptyset\varnothing

\newcommand{\naturals}{\ensuremath{\mathbb{N}}}
\newcommand{\integers}{\ensuremath{\mathbb{Z}}}
\newcommand{\rationals}{\ensuremath{\mathbb{Q}}}
\newcommand{\reals}{\ensuremath{\mathbb{R}}}
\newcommand{\complex}{\ensuremath{\mathbb{C}}}
\newcommand{\quaternions}{\ensuremath{\mathbb{H}}}

\newcommand{\set}[1]{\left\{ #1 \right\}}
\newcommand{\comp}[1]{\overline{#1}}
\newcommand{\union}{\cup}
\newcommand{\intersection}{\cap}
\newcommand{\false}{\mathbb{F}}
\newcommand{\true}{\mathbb{T}}

\newcommand{\transpose}{^\top}
\newcommand{\inverse}{^{-1}}
\newcommand{\inversetranspose}{^{-\top}}
\newcommand{\pseudoinverse}{^{\dagger}}
\newcommand{\mat}[2][]{% over-engineering at its best!
    \ifthenelse{\equal{#1}{}}{%
        \ensuremath{\mathbf{#2}}}{% if there is no superscript
        \ensuremath{\mathbf{#2}^\text{#1}}}% include the superscript
}

%-------------------------------------------------------------------------------
