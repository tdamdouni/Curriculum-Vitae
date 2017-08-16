% UTF8
%
% $Id: bspfont.cls 162 2009-12-05 20:32:34Z herbert $
%
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{scrartcl}}
\ProcessOptions\relax
\LoadClass[a4paper,12pt]{scrartcl}
\usepackage{xcolor,ifthen,calc,tabularx,ragged2e}
\newcolumntype{C}{>{\centering\arraybackslash}X}
\usepackage{eqlist}
\usepackage{babel}
\usepackage[top=1cm,bottom=1cm]{geometry}
\pagestyle{empty}
\setlength{\parindent}{0em}
\newcommand{\bs}{$\backslash$}
\let\StartShownPreambleCommands\relax
\let\StopShownPreambleCommands\relax
\let\DocStart\relax
\let\DocEnde\relax
% ignore second documentclass command for display in book:
\renewcommand\documentclass[2][]{}

% \newcommand*\printFontAttr[2]{%
%      \ifthenelse{\equal{#1}{m}}{}{}%
%      \ifthenelse{\equal{#1}{b}}{bold - }{}%
%      \ifthenelse{\equal{#1}{bx}}{bold - }{}%
%      \ifthenelse{\equal{#1}{r}}{regular - }{}%
%      \ifthenelse{\equal{#1}{c}}{black - }{}%
%      \ifthenelse{\equal{#1}{k}}{book - }{}%
%      \ifthenelse{\equal{#1}{me}}{medium - }{}%
%      \ifthenelse{\equal{#2}{n}}{normal}{}%
%      \ifthenelse{\equal{#2}{it}}{italic}{}%
%      \ifthenelse{\equal{#2}{sl}}{slanted}{}%
%      \ifthenelse{\equal{#2}{sc}}{caps}{}%
%      \ifthenelse{\equal{#2}{ic}}{italic caps}{}%
% }
\newcommand*\printFontAttr[2]{#1-#2}

% Symbol im entsprechenden Font anzeigen
\newcommand\fsymbol[5]{\usefont{#1}{#2}{#3}{#4}\fontsize{9pt}{9pt}\selectfont%
   \strut\textcolor{blue}{\symbol{#5}}}

\newcounter{myx}\newcounter{myy}\newcounter{mye}

\newcommand*\InitToks{\@temptokena={}}
\newcommand\AddToks[1]{\@temptokena=\expandafter{\the\@temptokena #1}}
\newcommand\AddToksExp[1]{%
  \edef\@tempa{#1}\expandafter\AddToks\expandafter{\@tempa}}
\newcommand*\PrintToks{\the\@temptokena}

\newcommand\makeTable[4]{%
  \begingroup
    \InitToks
    \AddToks{\begin{tabularx}{\linewidth}{@{}|C|C|C|C|C|C|C|C|@{}}\hline}%
    \setcounter{myy}{0}%
    \whiledo{\value{myy} < 32}{%
      \setcounter{myx}{0}%
      \whiledo{\value{myx} < 8}{%
        \setcounter{mye}{\themyy * 8 + \themyx}%
        \AddToksExp{\noexpand\tiny\strut\themye\hfill\noexpand\fsymbol{#1}{#2}{#3}{#4}{\themye}\hfill\mbox{}}%
        \ifthenelse{\value{myx} < 7}%
          {\AddToks{&}}%
          {\AddToks{\\\hline}}%
        \addtocounter{myx}{1}%
      }\addtocounter{myy}{1}%
    }%
    \AddToks{\end{tabularx}}%
    \setlength\extrarowheight{-2pt}%
    \PrintToks
  \endgroup
}

\newcommand{\FONTTAB}[4]{
   \par\medskip\normalfont
   \makeTable{#1}{#2}{#3}{#4}
}

\newcommand\TEXT[4]{{%
\usefont{#1}{#2}{#3}{#4}\selectfont%
Dies hier ist ein
Blindtext zum Testen von Textausgaben.
Wer diesen Text liest, ist selbst schuld.
Der Text gibt lediglich den Grauwert
der Schrift an. Ist das wirklich so?\par}}
\newcommand\TEXTUPPER[4]{{%
\usefont{#1}{#2}{#3}{#4}\selectfont%
DIES HIER IST EIN
BLINDTEXT ZUM TESTEN VON TEXTAUSGABEN.
WER DIESEN TEXT LIEST, IST SELBST SCHULD.
DER TEXT GIBT LEDIGLICH DEN GRAUWERT
DER SCHRIFT AN. IST DAS WIRKLICH SO?\par}}
\newcommand\ZAHL[4]{{\usefont{#1}{#2}{#3}{#4}\selectfont%
0123456789}}
\newcommand\BEISPIEL[4]{{%
\usefont{#1}{#2}{#3}{#4}\fontsize{1cm}{1cm}\selectfont%
BEISPIEL\par}}
\def\FONTfont{}
\def\FONTname{}
\def\FONTtexname{}
\def\FONTschnitte{}
\def\FONTencoding{}
\def\FONTpackage{}
\def\FONTmathe{}
\def\FONTtabelle{yes}
\def\FONTupper{no}
\def\FONTinitial{}

\newcommand\PRINT[4]{%
\begin{minipage}{\linewidth}
  \begin{minipage}{.38\linewidth}\scriptsize
    \begin{eqlist}[\def\makelabel##1{\textbf{##1}}\setlength\itemsep{0pt}\setlength\parsep{3pt}]
    \item [Font] {\raggedright\FONTfont}
    \item [Fontname] \FONTname
    \item [\TeX-Name] \FONTtexname
    \item [Schnitte] \FONTschnitte
    \ifthenelse{\equal{\FONTencoding}{}}{}{\item [Encoding] \FONTencoding}
    \ifthenelse{\equal{\FONTpackage}{}}{}{\item [Paket] \FONTpackage}
    \ifthenelse{\equal{\FONTmathe}{}}{}{\item [Mathematik] \FONTmathe}
    \end{eqlist}
  \end{minipage}\hfill
  \begin{minipage}{.6\linewidth}\small\color{blue}
    \ifthenelse{\equal{\FONTinitial}{}}{%
    \ifthenelse{\equal{\FONTupper}{ja}}{\TEXTUPPER{#1}{#2}{#3}{#4}}{\TEXT{#1}{#2}{#3}{#4}\par\ZAHL{#1}{#2}{#3}{#4}}
    }{\BEISPIEL{#1}{#2}{#3}{#4}}
  \end{minipage}
\end{minipage}
\ifthenelse{\equal{\FONTtabelle}{}}{}{\FONTTAB{#1}{#2}{#3}{#4}}%
}

\newcommand\PRINTFD[4]{\pagebreak[0]\textbf{#1-#2-#3-#4}\nopagebreak\par\TEXT{#1}{#2}{#3}{#4}\par\medskip}


\endinput
