%%
%% This is file `jtitauth.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% jtit.dtx  (with options: `author')
%% 
%% Class files for
%% JOURNAL OF TELECOMMUNICATIONS AND INFORMATION TECHNOLOGY
%% Copyright (C) Piotr Bolek <pb@rgstudio.com.pl>
%% 
%% $Id: jtit.dtx,v 1.2 2000/03/13 07:42:25 piotrek Exp $
\typeout{Document Class `jtitauth' <11-March-2000>.}
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{jtitauth}
  [2000/03/11 revision by PB]

%% Load base class
\LoadClass[a4paper]{article}

%% define new needed boolean variables
\newif\if@tmptwocolumn  \@tmptwocolumnfalse
\newif\if@times         \@timesfalse

%% Options
\newif\ifbfabstract     \bfabstracttrue
\DeclareOption{rmabstract}{\bfabstractfalse}
\newif\ifbibskip        \bibskipfalse
\DeclareOption{bibskip}{\bibskiptrue}

\DeclareOption{draft}{\PassOptionsToClass{draft}{article}}
\DeclareOption{times}{\@timestrue}
\DeclareOption{twoside}{\@twosidetrue}
\DeclareOption{twocolumn}{\@tmptwocolumntrue}
\DeclareOption{onecolumn}{\@tmptwocolumnfalse}

\ExecuteOptions{times,twoside,twocolumn}
\ProcessOptions

%% and math support and fonts
\RequirePackage{amsmath}
\RequirePackage{mathptmx}


%% Fonts

\if@times\RequirePackage{times}\fi



%% sizes and margins
\topmargin      -16.0mm
\oddsidemargin  -11.0mm
\evensidemargin -11.0mm
\textwidth        175mm
\textheight       243mm
\columnsep          7mm
\headsep          6.3mm
\headheight        12pt
\lineskip           1pt
\normallineskip     1pt
\def\baselinestretch{1}

\marginparsep      10pt
\marginparwidth    20pt
\marginparpush     25pt

\partopsep          \z@
\topsep           1.3ex
\parsep             \z@
\itemsep            \z@

%%
\abovedisplayskip       0pt plus2pt minus5pt%
\belowdisplayskip       \abovedisplayskip
\abovedisplayshortskip  0pt plus3pt%
\belowdisplayshortskip  0pt plus3pt minus3pt%

\arraycolsep     5pt
\tabcolsep       6pt
\arrayrulewidth .4pt
\doublerulesep   2pt
\tabbingsep\labelsep

%% footnotes
\skip\footins 10pt plus 4pt minus 2pt
\footnotesep 7pt
\footskip 10mm
\skip\@mpfootins = \skip\footins
\fboxsep = 3pt \fboxrule = .4pt
\long\def\@makefntext#1{\parindent .8em\indent$^{\@thefnmark}$#1}
\def\footnoterule{}


\newdimen\@maxsep
\newdimen\@dblmaxsep
%% Definitions for floats
%%
%% Normal Floats                      %% Double Column Floats
\floatsep 12pt plus 2pt minus 2pt     \dblfloatsep 12pt plus 2pt minus 2pt
\textfloatsep 20pt plus 2pt minus 4pt \dbltextfloatsep 20pt plus 2pt minus 4pt
\@maxsep 20pt                         \@dblmaxsep 20pt
\@fptop 0pt plus 1fil                 \@dblfptop 0pt plus 1fil
\@fpsep 8pt plus 2fil                 \@dblfpsep 8pt plus 2fil
\@fpbot 0pt plus 1fil                 \@dblfpbot 0pt plus 1fil
\def\topfraction{1.0}                 \def\dbltopfraction{1.0}
\def\floatpagefraction{0.8}           \def\dblfloatpagefraction{0.8}
\setcounter{topnumber}{2}             \setcounter{dbltopnumber}{4}
\intextsep 12pt plus 2pt minus 2pt
\setcounter{bottomnumber}{2}
\def\bottomfraction{.1}
\setcounter{totalnumber}{4}
\def\textfraction{.1}

\renewcommand{\topfraction}{0.99}
\renewcommand{\floatpagefraction}{0.5}
\renewcommand{\bottomfraction}{0.99}
\renewcommand{\textfraction}{0.01}

%% Captions
\long\def\@caption#1[#2]#3{\par\addcontentsline{\csname ext@#1\endcsname}{#1}{%
   \protect\numberline{\csname the#1\endcsname}{\ignorespaces #2}}
   \begingroup \@parboxrestore \normalsize
     \@makecaption{\csname fnum@#1\endcsname}{\ignorespaces #3}{#1}\par
   \endgroup}

\def\tablestring{table}
\def\figurestring{figure}

\newlength{\captionindent}
\long\def\@makecaption#1#2#3{
\ifx\figurestring#3
    \setbox\@tempboxa\hbox{{\small\bfseries\itshape #1.~ }#2}
    \ifdim \wd\@tempboxa >\hsize
       \setbox\@tempboxa\hbox{{\small\bfseries\itshape #1.~ }}
       \setlength\captionindent{\wd\@tempboxa} \divide\captionindent by 2
       \parbox[t]{\hsize}{\small \hangindent 0pt \hangafter=1%
       \unhbox\@tempboxa#2}
    \else \hbox to\hsize{\small\hfil\box\@tempboxa\hfil}
    \fi
\else
    \begin{center}{#1}\\{#2}\end{center}
\fi}

\def\fnum@figure{Fig.~\thefigure}
\def\fnum@table{Table~\thetable}





%% marks
\def\markboth#1#2{\def\leftmark{#1}\def\rightmark{#2}}
\def\footernote#1{\markboth{#1}{#1}}

%% bibliography

\def\thebibliography#1{\section*{References}\footnotesize\list
    {[\arabic{enumi}]}{\settowidth\labelwidth{[#1]}\leftmargin\labelwidth
    \advance\leftmargin\labelsep
    \ifbibskip \itemsep 1.5pt plus .5pt minus .5pt
    \else \itemsep 0pt plus .5pt \fi
    \usecounter{enumi}}
    \def\newblock{\hskip .11em plus .33em minus .07em}
    \sloppy\clubpenalty4000\widowpenalty4000
    \sfcode`\.=1000\relax}
\let\endthebibliography=\endlist

%% Title
\def\maketitle{\par
  \begingroup
  \def\thefootnote{} % the \thanks{} mark type is empty
\if@tmptwocolumn
  \twocolumn[\@maketitle]
\else
  \@maketitle
\fi
  \thispagestyle{plain}\@thanks
  \endgroup
  \setcounter{footnote}{0}\let\maketitle\relax\let\@maketitle\relax
  \gdef\@thanks{}\gdef\@author{}\gdef\@title{}\let\thanks\relax
}

\def\@maketitle{\newpage
  \begin{center}
    \vskip0.2em{\Huge\bfseries\@title\par}\vskip1.0em%
    {\lineskip.5em\large\@author\par}
  \end{center}\par\vskip 1.4em}

%% Abstract and keywords
\def\abstract{%
  \noindent\ifbfabstract\small\bfseries\else\footnotesize\fi Abstract --- }

\def\endabstract{\vspace{0.6em}\par\normalsize}

\def\keywords{%\vspace{-.3em}
\noindent\itshape\ifbfabstract\small\bfseries\else\footnotesize\fi  Keywords --- }
\def\endkeywords{\vspace{0.6em}\par\normalsize}

%% sections
\def\@seccntformat#1{\csname the#1\endcsname\ }
\def\thesection{\arabic{section}.}
\def\thesubsection{\thesection\arabic{subsection}.}

\renewcommand\section{\@startsection{section}{1}{\z@}%
  {-3.5ex \@plus -1ex \@minus -.2ex}%
  {2.3ex \@plus.2ex}%
  {\normalfont\Large\centering}}
\renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
  {-3.25ex\@plus -1ex \@minus -.2ex}%
  {1.5ex \@plus .2ex}%
  {\normalfont\itshape\bfseries\raggedright}}

%% environemts
\newdimen\tmpitemindent
\def\QED{\mbox{\rule[0pt]{1.5ex}{1.5ex}}}
\def\proof{\noindent\hspace{2em}{\it Proof: }}
\def\endproof{\hspace*{\fill}~\QED\par\endtrivlist\unskip}
\def\@begintheorem#1#2{\tmpitemindent\itemindent\topsep 0pt\rm\trivlist
    \item[\hskip \labelsep{\indent\it #1\ #2:}]\itemindent\tmpitemindent}
\def\@opargbegintheorem#1#2#3{\tmpitemindent\itemindent\topsep 0pt\rm \trivlist
    \item[\hskip\labelsep{\indent\it #1\ #2\ \rm(#3)}]\itemindent\tmpitemindent}
\def\@endtheorem{\endtrivlist\unskip}

\newtheorem{theorem}{Theorem}
\newtheorem{definition}{Definition}
\newtheorem{corollary}{Corollary}

\twocolumn \sloppy \flushbottom

%% Allows to enter BIOGRAPHY leaving place for picture
%%
\newenvironment{biography}[1]{%
\footnotesize\unitlength 1mm\bigskip\bigskip\bigskip\parskip=0pt\par%
\rule{0pt}{39mm}\vspace{-39mm}\par%   garantees correct page breaking
\noindent\setbox0\hbox{\framebox(25,32){}}%   box containing the frame
\ht0=37mm\count10=\ht0\divide\count10 by\baselineskip%  calculates lines
\global\hangindent29mm\global\hangafter-\count10%
\hskip-28.5mm\setbox0\hbox to 28.5mm {\raise-30.5mm\box0\hss}%
\dp0=0mm\ht0=0mm\box0\noindent\bf#1\rm}{
\par\rm\normalsize}

%% Default rules for including pictures
\RequirePackage{graphicx}
\RequirePackage{color}
\DeclareGraphicsRule{*}{eps}{*}{}

%% Page headers and footers
%%
\RequirePackage{fancyhdr}

\pagestyle{fancy}

\def\aJTIT{{\footnotesize\begin{tabular}{l}
    \sffamily JOURNAL OF TELECOMMUNICATIONS \\
    \sffamily AND\hfill INFORMATION\hfill TECHNOLOGY\\
  \end{tabular}}}
\lfoot[\thepage]{\aJTIT}
\rfoot[\aJTIT]{\thepage}

\rhead[]{\footnotesize\rightmark}
\lhead[\footnotesize\leftmark]{}
\cfoot{}
\renewcommand{\headrulewidth}{0pt}

\fancypagestyle{plain}{
\fancyhf{}
\fancyfoot[RE]{\aJTIT}
\fancyfoot[LO]{\aJTIT}
\fancyfoot[LE]{\thepage}
\fancyfoot[RO]{\thepage}}

\def\sectionmark#1{\relax}

\parindent=0pt
\endinput
%%
%% End of file `jtitauth.cls'.
