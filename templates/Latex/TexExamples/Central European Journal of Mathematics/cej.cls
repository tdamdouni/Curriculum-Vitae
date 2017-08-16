%
% CEJ LaTeX Class for authors of Vesita own journals
% Copyright by Versita (2008). All rights reserved.
%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cej}
\newif\ifcej@twocolumns\cej@twocolumnstrue
\newif\ifcej@printpagenumbers\cej@printpagenumberstrue
\newif\ifcej@printlinenumbers\cej@printlinenumbersfalse
\newif\ifcej@printpagerange\cej@printpagerangetrue
\newif\ifcej@printbox\cej@printboxfalse
\newif\ifcej@printabstract\cej@printabstracttrue
\newif\ifcej@printkeywords\cej@printkeywordstrue
\newif\ifcej@printpacs\cej@printpacstrue
\newif\ifcej@printmsc\cej@printmsctrue
\newif\ifcej@final\cej@finaltrue
\newif\ifcej@pdf
\cej@pdftrue
\pdfoutput=1
\newif\ifcej@firstaffiliation
\cej@firstaffiliationtrue
\newdimen\cej@tempdimen
\newcount\cej@tempcount
\def\cej@journalname{[Use option {\tt CEJB}, {\tt CEJC}, {\tt CEJM}, {\tt CEJMed} or {\tt CEJP}, to set name of journal.]}
\def\cej@shortjournalname{[Use option {\tt CEJB}, {\tt CEJC}, {\tt CEJM}, {\tt CEJMed} or {\tt CEJP}, to set short name of journal.]}
\def\cej@title{[Put the title here using command {\tt\char`\\title\char"7B text~of~title\char"7D}.]}
\let\cej@shorttitle=\empty
\def\cej@author{[Put the names of authors here using command {\tt\char`\\author\char"7B names of authors\char"7D}.]}
\let\cej@shortauthor=\empty
\def\cej@articletype{[Put the type of article here using command {\tt\char`\\articletype\char"7B type of article\char"7D}.]}
\def\cej@year{[Put the year here using command {\tt\char`\\year\char"7B YYYY\char"7D}.]}
\def\cej@issue{[Put the issue here using command {\tt\char`\\issue\char"7B NN\char"7D}.]}
\def\cej@institute{[Put the names of institutes here using command {\tt\char`\\institute\char"7B names of institutes\char"7D}.]}
\let\cej@msc=\empty
\let\cej@pacs=\empty

\DeclareOption{CEJB}{
  \def\cej@journalname{Central European Journal of {\bfseries Biology}}
  \def\cej@shortjournalname{Cent. Eur. J. Biol.}
  \def\cej@type{CEJB}
}
\DeclareOption{CEJC}{
  \def\cej@journalname{Central European Journal of {\bfseries Chemistry}}
  \def\cej@shortjournalname{Cent. Eur. J. Chem.}
  \def\cej@type{}
}
\DeclareOption{CEJM}{
  \def\cej@journalname{Central European Journal of {\bfseries Mathematics}}
  \def\cej@shortjournalname{Cent. Eur. J. Math.}
  \def\cej@type{CEJM}
  \cej@twocolumnsfalse
}
\DeclareOption{CEJMed}{
  \def\cej@journalname{Central European Journal of {\bfseries Medicine}}
  \def\cej@shortjournalname{Cent. Eur. J. Med.}
  \def\cej@type{CEJMed}
}
\DeclareOption{CEJP}{
  \def\cej@journalname{Central European Journal of {\bfseries Physics}}
  \def\cej@shortjournalname{Cent. Eur. J. Phys.}
    \def\cej@type{CEJP}
  \cej@twocolumnsfalse
}

\DeclareOption{PDF}{\cej@pdftrue\pdfoutput=1\relax}
\DeclareOption{DVI}{\cej@pdffalse\pdfoutput=0\relax}

\ProcessOptions
\ifcej@printabstract   \cej@printboxtrue \fi
\ifcej@printkeywords  \cej@printboxtrue  \fi
\ifcej@printpacs   \ifx\cej@pacs\empty   \else     \cej@printboxtrue   \fi \fi
\ifcej@printmsc   \ifx\cej@msc\empty   \else     \cej@printboxtrue   \fi \fi
\LoadClass[10pt,twoside,pre,nofootinbib,secnumarabic,balancelastpage,superscriptaddress,showpacs,showkeys]{revtex4}

  \pagestyle{myheadings}
  \def\contentsname{Contents}
  \def\listfigurename{List of Figures}
  \def\listtablename{List of Tables}
  \def\refname{References}
  \def\indexname{Index}
  \def\figurename{Figure}
  \def\tablename{Table}
  \def\partname{Part}
  \def\appendixname{Appendix}
  \def\abstractname{Abstract}

  \renewcommand*\email[1][E-mail: ]{\begingroup\sanitize@url\@email{#1}}%
  \chardef\*180
  \def\author#1{\expandafter\gdef\csname cej@author\endcsname{#1}}
  \def\shortauthor#1{\expandafter\gdef\csname cej@shortauthor\endcsname{#1}}
  \def\title#1{\expandafter\gdef\csname cej@title\endcsname{#1}}
  \def\shorttitle#1{\expandafter\gdef\csname cej@shorttitle\endcsname{#1}}
  \def\articletype#1{\expandafter\gdef\csname cej@articletype\endcsname{#1}}
  \def\year#1{\expandafter\gdef\csname cej@year\endcsname{#1}}
  \def\issue#1{\expandafter\gdef\csname cej@issue\endcsname{#1}}
  \def\institute#1{\expandafter\gdef\csname cej@institute\endcsname{#1}}
  \def\msc#1{\expandafter\gdef\csname cej@msc\endcsname{#1}}
  \def\pacs#1{\expandafter\gdef\csname cej@pacs\endcsname{#1}}
  \long\def\abstract#1{\expandafter\gdef\csname cej@abstract\endcsname{#1}}
  \def\keywords#1{\expandafter\gdef\csname cej@keywords\endcsname{#1}}
  \def\firstpage{\setcounter{page}}
  \def\lastpage#1{\expandafter\gdef\csname cej@lastpage\endcsname{#1}}
  \def\titleblock@produce{%
    \def\thefootnote{\@fnsymbol\c@footnote}%
    \begingroup
    \null
    \vskip-\baselineskip
    \vskip-12mm
      \vbox to0pt{\vskip-12mm
      }
      \vskip-\baselineskip
      \vbox to0pt{\vskip19mm \vskip\textheight
      }
    \vskip-\baselineskip
    \vbox to0pt{\vskip-5mm \fontsize{7pt}{8.4pt}\selectfont    
      \cej@shortjournalname%
      \ifcej@printpagerange\;\*\;\thepage-\cej@lastpage\fi\\
       Author version%
    }
    \vskip-\baselineskip
    \vskip4mm
    \leftline{\hskip-2mm\color{cej@color}\vrule width\paperwidth height.5pt}
    \vskip2pt
    \leftline{%
      \hskip-2mm\colorbox{cej@color}{%
        \hbox to\paperwidth{%
          \fontsize{11pt}{13.2pt}\selectfont\color{white}\hskip1mm\textbf{\cej@journalname}
          \vrule width0ptheight10ptdepth2pt\hss
        }%
      }%
    }
    \newdimen\@rulewidth
    \@rulewidth=\textwidth
    \advance\@rulewidth by4mm
    \vskip13.5mm
    \begin{flushleft}
      \sloppy\fontsize{19pt}{22.8pt}\selectfont\color{cej@color}\textbf{\cej@title}
    \end{flushleft}
    \vskip-\baselineskip
    \vskip10mm
    \begin{flushright}
       \fontsize{9pt}{8pt}\selectfont\textbf{\cej@articletype}
    \end{flushright}%
   \vskip-\baselineskip
    \leftline{\hskip-2mm\color{cej@color}\vrule width\@rulewidth height.5pt}
    \vskip-1.5\baselineskip
    \vskip2mm
    \null
    \begin{flushleft}
      \def\inst##1{$^\text{##1}$}%
      \def\email##1{\footnote{E-mail: ##1}}%
      \fontsize{10pt}{12pt}\selectfont\textbf{\cej@author}
    \end{flushleft}
    \null
    \vskip-2.5\baselineskip
    \vskip2mm
    \null
    \begin{flushleft}
     $\null$%
     \def\inst##1{\parindent=10pt%
       \ifcej@firstaffiliation%
         \vskip-\baselineskip
         \cej@firstaffiliationfalse
       \else
         \vskip2mm
       \fi%
       $\null$\llap{\hbox to\parindent{##1\hss}}\ignorespaces}%
       \fontsize{8pt}{9.5pt}\selectfont\color{grey}%
      \vskip-1\baselineskip\indent$\null$\cej@institute
    \end{flushleft}
    \vskip-1.5\baselineskip
    \vskip10mm
     \ifcej@printbox%
	    \vskip-\baselineskip
	    \vskip1.5mm
	    \leftline{\hskip-2mm\color{cej@color}\vrule width\@rulewidth height.5pt}
	    \vskip-.5pt
	    \fontsize{8pt}{10pt}\selectfont
	    \settowidth\cej@tempdimen{\textbf{MSC:}\kern.5em}%
	    \ifcej@printabstract%
	      \settowidth\cej@tempdimen{\textbf{Abstract:}\kern.5em}%
	    \fi%
	    \ifcej@printkeywords%
	      \settowidth\cej@tempdimen{\textbf{Keywords:}\kern.5em}%
	    \fi%
	    \ifcej@printpacs%
		    \ifx\cej@pacs\empty%
		    \else%
		      \settowidth\cej@tempdimen{\textbf{PACS (2008):}\kern.5em}%
		    \fi%
		  \fi%
	    \leftline{%
	      \hskip-2mm\colorbox{abs}{%
	        \hskip1mm\vbox{%
	          \ifcej@printabstract%
		          \vskip2.6mm\hangindent\cej@tempdimen
		           \fontsize{8pt}{10pt}\selectfont
		            $\null$\rlap{\textbf{Abstract:}}\kern\cej@tempdimen%
                    \selectfont\cej@abstract
		            \vskip1mm
		        \fi%
	          \ifcej@printmsc%
		          \ifx\cej@msc\empty\else
		            \vskip1mm\hangindent\cej@tempdimen
		             \fontsize{8pt}{10pt}\selectfont
		              $\null$\rlap{\textbf{MSC:}}\kern\cej@tempdimen%
		              \selectfont\cej@msc
  		            \vskip1mm
		          \fi%
		        \fi%
		        \ifcej@printpacs%
		          \ifx\cej@pacs\empty\else
		            \vskip1mm\hangindent\cej@tempdimen
		              \fontsize{8pt}{10pt}\selectfont
		              $\null$\rlap{\textbf{PACS (2008):}}\kern\cej@tempdimen%
		              \selectfont\cej@pacs
  		            \vskip1mm
		          \fi%
		        \fi%
		        \ifcej@printkeywords%
		          \vskip1mm\hangindent\cej@tempdimen
		          \fontsize{8pt}{10pt}\selectfont
		            $\null$\rlap{\textbf{Keywords:}}\kern\cej@tempdimen%
		            \selectfont\cej@keywords\\[1mm]%
		            \copyright\;
		            \selectfont
		            Versita Warsaw and Springer-Verlag Berlin Heidelberg.% All rights reserved.
		          \vskip1mm
		        \fi%
            \vskip1.6mm
	        }%
	      \hskip1mm}%
	    }%
	  \fi%
    \vskip-2mm
    \leftline{\hskip-2mm\color{cej@color}\vrule width\@rulewidth height.5pt}
    \vskip10mm
    \endgroup
    \gdef\thefootnote{\@arabic\c@footnote}
    \global\c@footnote=0
  }%

  \def\@hangfrom@section#1#2#3{\@hangfrom{#1#2}{#3}}%
  \def\section{\@startsection{section}{1}{\z@}{19\p@}{12\p@}
    {\noindent\fontsize{15pt}{17pt}	\bfseries \selectfont$\null$\color{cej@color}}}
  \def\subsection{\@startsection{subsection}{2}{\z@}{14\p@}{8\p@}
   {\noindent\fontsize{12\p@}{14\p@} \bfseries \selectfont$\null$\color{cej@color}}}
  \def\subsubsection{\@startsection {subsubsection}{3}{\z@}{8\p@}{4\p@}
    {\noindent\fontsize{10pt}{12pt}	\bfseries \selectfont$\null$\color{cej@color}}}
  \def\paragraph{\@startsection{paragraph}{4}{\z@}{12\p@}{2\p@}
    {\noindent\fontsize{9pt}{12pt}	\bfseries \itshape \selectfont$\null$\color{cej@color}}}
  \def\subparagraph{\@startsection{subparagraph}{5}{\z@}{6\p@}{\z@}%
    {\normalfont\normalsize\bfseries}}
  \c@tocdepth=1
  \c@secnumdepth=3

  \def\footnoterule{\kern-7.5mm {\color{cej@color}\hbox{\hskip-2mm\vrule width79.8mm height.5pt}}\kern2mm}
  \renewcommand\@makefntext[1]{\parindent0\p@\relax\indent%
    \rmfamily\it\fontsize{9}{10.8}\selectfont%
    \@makefnmark\enspace#1}
  \def\@fnsymbol#1{\ensuremath{\ifcase#1\or *\or \dagger\or \ddagger\or
    \mathsection\or \mathparagraph\or \|\or **\or \dagger\dagger
    \or \ddagger\ddagger \else\@ctrerr\fi}}
  \def\thefootnote{\@arabic\c@footnote}
  \footnotesep=2mm
  \gdef\@reinserts{%
    \ifvoid\footins\else\insert\footins{\unvbox\footins}\fi
    \ifvbox\@kludgeins\insert\@kludgeins
                        {\unvbox\@kludgeins}\fi
  }
  \def\thetable{\@arabic\c@table}
  \abovecaptionskip=5.5mm
  \belowcaptionskip2mm
  \long\def\@makecaption#1#2{%
    \par
    \vskip\abovecaptionskip
    \begingroup
    \small\rmfamily
    \sbox\@tempboxa{%
      \let\\\heading@cr
        \fontsize{9pt}{8.4pt} \bfseries \selectfont%
      \settowidth\cej@tempdimen{#1.\enspace}%
      \hangindent\cej@tempdimen{\color{cej@color}#1.\enspace}%
    \fontsize{7pt}{8.4pt} \selectfont%
      #2\par
    }%
    \@ifdim{\wd\@tempboxa >\hsize}{%
      \begingroup
      \samepage
      \flushing
      \let\footnote\@footnotemark@gobble
      \fontsize{9pt}{8.4pt}  \selectfont%
      \settowidth\cej@tempdimen{#1.\enspace}%
      \hangindent\cej@tempdimen{\color{cej@color}#1.\enspace}%
       \fontsize{7pt}{8.4pt}\selectfont%
      #2\par
      \endgroup
    }{%
      \global \@minipagefalse
      \hb@xt@\hsize{\unhbox\@tempboxa\hfil}%
    }%
    \endgroup
    \vskip\belowcaptionskip
  }%

  \renewenvironment{widetext@grid}{%
    \par\ignorespaces
    \setbox\widetext@top\vbox{%
    \vskip10\p@
    \hb@xt@\hsize{%
      \leaders\hrule\hfil
      \vrule\@height6\p@
    }%
    \vskip6\p@
    }%
    \setbox\widetext@bot\hb@xt@\hsize{%
      \vrule\@depth6\p@
      \leaders\hrule\hfil
    }%
    \onecolumngrid
    \dimen@\ht\widetext@top\advance\dimen@\dp\widetext@top
    \cleaders\box\widetext@top\vskip\dimen@
    \let\set@footnotewidth\set@footnotewidth@ii
  }{%
    \vskip6\p@
    \setbox\widetext@bot\vbox{%
    \hb@xt@\hsize{\hfil\box\widetext@bot}%
    \vskip10\p@
    }%
    \dimen@\ht\widetext@bot\advance\dimen@\dp\widetext@bot
    \cleaders\box\widetext@bot\vskip\dimen@
    \twocolumngrid\global\@ignoretrue
    \@endpetrue
  }%

  \def\bibfont{\normalsize}
	\def\bibsection{%
	  \def\section{\@startsection{section}{1}{\z@}{5.5mm}{5mm}
	    {\noindent\fontsize{11pt}{11pt}\selectfont$\null$\color{cej@color}\vskip6mm \hbox{\hskip-2mm\color{cej@color}\vrule width79.8mm height.5pt}\vskip-10mm }}
	  \let\@hangfroms@section\@hang@froms
	  \section*{\refname}%
	  \ifcej@twocolumns
	  \else
	    \vskip-\baselineskip
	    \vskip4mm
	    \null
	  \fi
	  \@nobreaktrue
	}

  \def\tiny{\fontsize{5pt}{6pt}\selectfont}
  \def\scriptsize{\fontsize{6pt}{7pt}\selectfont}
  \def\footnotesize{\fontsize{7pt}{8pt}\selectfont}
  \def\small{\fontsize{8pt}{10pt}\selectfont}
  \def\normalsize{\fontsize{9pt}{18pt}\selectfont}
  \def\large{\fontsize{10pt}{12pt}\selectfont}
  \def\Large{\fontsize{12pt}{14pt}\selectfont}
  \def\LARGE{\fontsize{15pt}{16pt}\selectfont}
  \def\huge{\fontsize{17pt}{20pt}\selectfont}
  \def\Huge{\fontsize{20pt}{24pt}\selectfont}
  \def\*{$\bullet$ \relax}

\RequirePackage{amsmath}
  \abovedisplayskip=16ptplus4ptminus8pt
  \abovedisplayshortskip=1ptplus4pt
  \belowdisplayskip=16ptplus4ptminus8pt
  \belowdisplayshortskip=8ptplus6ptminus5pt

\RequirePackage{amsthm}
  \newtheoremstyle{itstyle}
    {16pt plus6pt}
    {16pt plus6pt}
    {\rmfamily\it\fontsize{9}{11}\selectfont}
    {0pt}
    {\fontsize{10}{11} \bfseries \selectfont\color{cej@color}$\null$}
    {\newline\nobreak}
    {0pt}
    {\indent#1\hbox{ }#2\thmnote{\hbox{ }(#3)}. \ }
  \newtheoremstyle{rmstyle}
    {16pt plus6pt}
    {16pt plus6pt}
    {\rmfamily\fontsize{9}{11}\selectfont}
    {0pt}
    {\fontsize{10}{11}\bfseries \selectfont\color{cej@color}$\null$}
    {\newline\nobreak}
    {0pt}
    {\indent#1\hbox{ }#2\thmnote{\hbox{ }(#3)}. \ }
  \theoremstyle{itstyle}
  \newtheorem{theorem}{Theorem}[section]
  \newtheorem{lemma}{Lemma}[section]
  \newtheorem{proposition}{Proposition}[section]
  \newtheorem{claim}{Claim}[section]
  \newtheorem{fact}{Fact}[section]
  \newtheorem{corollary}{Corollary}[section]
  \newtheorem{assumption}{Assumption}[section] %???
  \newtheorem{algoritheorem}{Algoritheorem}[section] %???
  \theoremstyle{rmstyle}
  \newtheorem{remark}{Remark}[section]
  \newtheorem{example}{Example}[section]
  \newtheorem{question}{Question}[section]
  \newtheorem{problem}{Problem}[section]
  \newtheorem{definition}{Definition}[section]
  \newtheorem{axiom}{Axiom}[section] %???
  \def\proofname{{\fontsize{10}{11}\selectfont\color{cej@color}$\null$Proof. \ }}

\ifcej@pdf
  \RequirePackage[pdftex]{graphicx}
\else
  \RequirePackage[dvips]{graphicx}
\fi

\RequirePackage{color}
  \definecolor{cej@color}{rgb}{1,0,0}
  \definecolor{abs}{rgb}{1,.9,.9}
  \definecolor{grey}{rgb}{.3,.3,.3}

\def\CEJB{CEJB}
\ifx\cej@type\CEJB
  \definecolor{cej@color}{rgb}{0.28515625,0.5234375,0.140625}
  \definecolor{abs}{rgb}{0.96875,0.97265625,0.95703125}
\fi
\def\CEJC{CEJC}
\ifx\cej@type\CEJC
  \definecolor{cej@color}{rgb}{0.9140625,0.4609375,0}
  \definecolor{abs}{rgb}{0.9921875,0.97265625,0.953125}
\fi
\def\CEJM{CEJM}
\ifx\cej@type\CEJM
  \definecolor{cej@color}{rgb}{0,0.38671875,0.64453125}
  \definecolor{abs}{rgb}{0.953125,0.96484375,0.98046875}
\fi
\def\CEJMed{CEJMed}
\ifx\cej@type\CEJMed
  \definecolor{cej@color}{rgb}{0,0.578125,0.60546875}
  \definecolor{abs}{rgb}{0.96484375,0.9765625,0.98046875}
\fi
\def\CEJP{CEJP}
\ifx\cej@type\CEJP
  \definecolor{cej@color}{rgb}{0.5,0.37109375,0.59765625}
  \definecolor{abs}{rgb}{0.97265625,0.96875,0.98046875}
\fi

\ifcej@pdf
  \ifcej@final
    \RequirePackage[pdftex,colorlinks=true,citecolor=blue,linkcolor=blue,final]{hyperref}
  \else
    \RequirePackage[pdftex,colorlinks=true,citecolor=blue,linkcolor=blue,draft]{hyperref}
  \fi
\else
  \ifcej@final
    \RequirePackage[ps2pdf,colorlinks=true,citecolor=blue,linkcolor=blue,final]{hyperref}
  \else
    \RequirePackage[ps2pdf,colorlinks=true,citecolor=blue,linkcolor=blue,draft]{hyperref}
  \fi
\fi

\usepackage{hypernat}

\paperwidth=210mm
\paperheight=277mm

\ifcej@pdf
  \pdfpagewidth=\paperwidth
  \pdfpageheight=\paperheight
\fi

\textwidth=159.95mm
\textheight=222.5mm

\newdimen\cej@textwidth
\cej@textwidth=\textwidth

\hoffset=-1in
\advance\hoffset by.5\paperwidth
\advance\hoffset by-.5\textwidth

\voffset=-1in
\advance\voffset by.5\paperheight
\advance\voffset by-.5\textheight
\advance\voffset by-15mm

\evensidemargin=0mm
\oddsidemargin=0mm

\topmargin=0pt

\headheight=40pt
\headsep=0pt

\marginparsep=0pt
\marginparwidth=0pt
\marginparpush=0pt

\parindent=0pt

\baselineskip=12pt

\footskip=30pt

\def\cej@linenumbers{}
\def\cej@titlehead{\vbox to40pt{\hsize=.5\cej@textwidth \advance\hsize by.5\columnsep
  \cej@linenumbers%
}}

\def\cej@oddhead{\vbox to40pt{%
  \ifcej@twocolumns
	  \hsize=.5\cej@textwidth
	  \advance\hsize by.5\columnsep
  \else
    \hsize=\cej@textwidth
  \fi
  \cej@linenumbers%
  \def\email##1{}\def\inst##1{}%
  \vbox to20pt{%
    \raggedright%
    \fontsize{7pt}{8.4pt}\selectfont\color{grey}%
    \ifx\cej@shortauthor\empty%
      \cej@author%
    \else%
      \cej@shortauthor%
    \fi%
    \vss%
  }%
  \hbox to\cej@textwidth{\hskip-2mm\color{cej@color}\vrule width\paperwidth height.5pt\hss}%
  \vskip1mm
  \hskip.5\cej@textwidth\hbox to.5\cej@textwidth{\hskip.5\columnsep\color{cej@color}\vrule width\paperwidth height2.962mm\hss}%
  \vss%
}}

\def\cej@evenhead{\vbox to40pt{\hsize=\cej@textwidth
  \cej@linenumbers%
  \def\email##1{}\def\inst##1{}%
  \vbox to20pt{%
    \raggedleft%
    \fontsize{7pt}{8.4pt}\selectfont\color{grey}%
    \ifx\cej@shorttitle\empty%
      \cej@title%
    \else%
      \cej@shorttitle%
    \fi%
    \vss%
  }%
  \hbox to\cej@textwidth{\hss\color{cej@color}\vrule width\paperwidth height.5pt\hskip-2mm}%
  \vskip1mm
  \hbox to.5\cej@textwidth{\hss\color{cej@color}\vrule width\paperwidth height2.962mm\hskip.5\columnsep}%
  \vss%
}}

\def\cej@oddfoot{\ifcej@printpagenumbers%
    \hfill\rlap{\hskip.7cm{\colorbox{cej@color}{\hbox to1.7cm{%
    \hss\usefont{T1}{square721exeu}{m}{n}\fontsize{7pt}{8.4pt}\selectfont\color{white}\thepage\hss}}}}%
  \fi}

\def\cej@evenfoot{\ifcej@printpagenumbers%
    \llap{{\colorbox{cej@color}{\hbox to1.7cm{%
    \hss\fontsize{7pt}{8.4pt}\selectfont\color{white}\thepage\hss}}\hskip.7cm}}%
  \fi}

\def\ps@myheadings{
  \let\@oddhead=\cej@oddhead
  \let\@oddfoot=\cej@oddfoot
  \let\@evenhead=\cej@evenhead
  \let\@evenfoot=\cej@evenfoot
}

\def\ps@titlepage{
  \let\@oddhead=\cej@titlehead
  \let\@oddfoot=\cej@oddfoot
  \let\@evenhead=\cej@titlehead
  \let\@evenfoot=\cej@evenfoot
}

\ps@myheadings

\AtBeginDocument{%
  \renewcommand{\familydefault}{\rmdefault}
  \fontfamily{\familydefault}

  \thispagestyle{titlepage}
  \def\cej@lastpage{{\color{red}[Compile the document one more time to update number of the last page!]}}

  \newread\cej
  \openin\cej=\jobname.cej
  \ifeof\cej \else\input\jobname.cej \fi

  \newwrite\cej
  \immediate\openout\cej=\jobname.cej

  \rm\normalsize
}

\AtEndDocument{
  \immediate\write\cej{\string\lastpage{\thepage}}
  \immediate\closeout\cej
}
\endinput
