% LuaTeX class for Supercomputing Frontiers and Innovations.
% Contacat <vestnikvmi@gmail.com> for questions and proposals.

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{superfri}
\LoadClass[twoside, 11pt, a4paper]{article}

\usepackage[english]{babel}
%	\usepackage[unicode=true,linktocpage=true]{hyperref}

%\usepackage{hyperref}
\usepackage{url}


% --- размеры шрифтов ---
\renewcommand{\Large}{\fontsize{14pt}{19.6pt}\selectfont} % заголовок статьи, заголовок 1
\renewcommand{\large}{\fontsize{12pt}{16.8pt}\selectfont} % авторы, заголовок 2, заголовок 3
\renewcommand{\footnotesize}{\fontsize{9pt}{12.6pt}\selectfont} % аннотация, сноски
\renewcommand{\normalsize}{\fontsize{11pt}{15.4pt}\selectfont} % основной текст, подписи к рисункам и таблицам, список литературы, сведения о грантах
\renewcommand{\small}{\fontsize{10pt}{14pt}\selectfont} % код

% --- подсчёт количества разных сущностей ---
\usepackage{totcount}
\regtotcounter{table}
\regtotcounter{figure}

% --- картинки ---
\usepackage{graphicx, epstopdf}
\graphicspath{{pic/}}

% --- красная строка в первом абзаце раздела ---
\usepackage{indentfirst}

\usepackage{enumitem, changepage, fancyvrb}

% --- пробелы между ссылками на литературу ---
\usepackage[space]{cite}

%\usepackage{amsfonts, amsmath, amssymb, amsthm}
%\usepackage{showframe} % показывать все поля для отладки стилей

% --- нумерованный список с уменьшенными интервалами ---
\let\oldenumerate\enumerate
\let\endoldenumerate\endenumerate
\def\enumerate{% FIXME: add support of optional arguments
	\oldenumerate[topsep=0pt, itemsep=0pt, parsep=0pt, widest=9, leftmargin=7mm]
}
\def\enumerateparen{% FIXME: delete this one if the trick with enumerate works
	\oldenumerate[topsep=0pt, itemsep=0pt, parsep=0pt, label=\arabic*), widest=9, leftmargin=7mm]
}
\let\endenumerateparen\endoldenumerate

% --- классификация статьи ---
\let\@classification\@empty
\def\classify#1{\def\@classification{#1}}

% --- заголовок статьи ---
\renewcommand{\maketitle}{%
	\ifx\@firsttitle\indefined% если это первый заголовок статьи
%		\thispagestyle{vestnikfirst}% стиль без колонтитулов
		\def\@firsttitle{}
	\fi

	\ifx \@classification \@empty% если пустая классификация
		\vspace{10pt} % то она реально пустая
	\else%
		{\large{\begin{flushleft}\textbf{\@classification}\end{flushleft}}}% иначе - пишем её
	\fi%
	{\noindent\Large\raggedright\textbf{\@title}\par}% собственно, заголовок
	{\noindent{\begin{flushleft}\large\textbf{\textit{\@author}}\end{flushleft}}\vskip 3pt}% авторы
	\smallskip%
}

% --- формат номера раздела ---
\renewcommand{\@seccntformat}[1]{\csname the#1\endcsname.\hspace{0.7em}}

% --- запрет висячих строк ---
\widowpenalty=10000 % внизу абзацев
\clubpenalty=10000 % вверху абзацев

\usepackage{ifthen,latexsym}
  
\normalsize
\usepackage[margin=2.5cm]{geometry}

% --- маркированный список с уменьшенными интервалами ---
\let\olditemize\itemize
\let\endolditemize\enditemize
\def\itemize{
	\olditemize[topsep=0pt, itemsep=0pt, parsep=0pt]
}

% --- параметры абзаца ---
\parindent=7mm
\parskip=0mm
\leftskip=0mm
\rightskip=0mm
 
% --- вертикальные отступы в строчных и выносных формулах
\abovedisplayskip=12pt plus 3pt minus 3pt
\belowdisplayskip=12pt plus 3pt minus 3pt
\abovedisplayshortskip=0pt plus 3pt
\belowdisplayshortskip=6pt plus 3pt

\pagestyle{empty}

% --- параметры плавающих объектов
\setcounter{totalnumber}{4}
\setcounter{topnumber}{4}
\setcounter{bottomnumber}{4}
\renewcommand{\textfraction}{0.01}
\renewcommand{\topfraction}{0.99}
\renewcommand{\bottomfraction}{0.99}

\newcommand{\sectspacm}{\hspace*{-\medskipamount}}
\newcommand{\sectspacp}{\hspace*{\medskipamount}}

\renewcommand{\section}{%
	\@startsection{section}{1}{0mm}{-\baselineskip}{0.5\baselineskip}{\normalfont\raggedright\Large\bf}%
}

\renewcommand{\subsection}{%
	\@startsection{subsection}{2}{0mm}{-\baselineskip}{0.5\baselineskip}{\normalfont\raggedright\large\bf}%
}

\renewcommand{\subsubsection}{%
	\@startsection{subsubsection}{3}{0mm}{-\baselineskip}{0.5\baselineskip}{\normalfont\raggedright\large\it}%
}

% --- теорема ---
\newcounter{theocounter}
\newenvironment{theorem}{%
	\refstepcounter{theocounter}\par\addvspace{3mm}\noindent%
	{\bf Theorem \thetheocounter.\ }%
}{%
	\par\addvspace{3mm}%
}

% --- теорема без номера ---
\newenvironment{theorem*}{%
	\refstepcounter{theocounter}\par\addvspace{3mm}\noindent%
	{\bf Theorem.\ }\begin{it}%
}{%
	\end{it}\par\addvspace{3mm}
}

% --- лемма ---
\newcounter{lemcounter}
\newenvironment{lemma}{%
	\refstepcounter{lemcounter}\par\addvspace{3mm}\noindent
	{\bf Lemma \thelemcounter.\ }%
}{%
	\par\addvspace{3mm}%
}

% --- замечание ---
\newcounter{remcounter}
\newenvironment{remark}{%
	\refstepcounter{remcounter}\par\addvspace{3mm}\noindent
	{\bf Remark \theremcounter.\ }%
}{%
	\par\addvspace{3mm}%
}

% --- определение ---
\newcounter{defcounter}
\newenvironment{definition}{%
	\refstepcounter{defcounter}\par\addvspace{3mm}\noindent
	{\bf Definition \thedefcounter.\ }%
}{%
	\par\addvspace{3mm}%
}

% --- пример ---
\newcounter{examcounter}
\newenvironment{example}{%
	\refstepcounter{examcounter}\par\addvspace{3mm}\noindent
	{\bf Example \theexamcounter.\ }%
}{%
	\par\addvspace{3mm}%
}

% --- предложение ---
\newcounter{propcounter}
\newenvironment{proposition}{%
	\refstepcounter{propcounter}\par\addvspace{3mm}\noindent
	{\bf Proposition \thepropcounter.\ }%
}{%
	\par\addvspace{3mm}%
}

% --- следствие ---
\newcounter{corcounter}
\newenvironment{corollary}{%
	\refstepcounter{corcounter}\par\addvspace{3mm}\noindent%
	{\bf Corollary \thecorcounter.\ }%
}{%
	\par\addvspace{3mm}%
}

% список литературы
\newenvironment{biblio}[1][9]{% \begin{biblio}[maxval] ...
	\renewcommand{\refname}{References}%
	\begin{thebibliography}{#1}%
	\itemsep 0pt%
}{%
	\end{thebibliography}%
}
\renewcommand{\@biblabel}[1]{#1.} % Формат списка литературы

\newcommand{\R}{\mathbb{R}}
\newcommand{\N}{\mathbb{N}}
\newcommand{\Z}{\mathbb{Z}}
\newcommand{\CP}{\mathbb{C}}
\newcommand\Paragraph{\textsection}

\newcommand{\keywords}[1]{%
	{\footnotesize\it Keywords:~#1.}%
}

\renewenvironment{abstract}{%
	\footnotesize%
	\begin{adjustwidth}{22mm}{0em}%
	\setlength{\parindent}{2em}%
	\hspace{2em}%
}{%
	\end{adjustwidth}
}

\renewcommand\newblock{\hskip .11em plus .33em minus .07em}
\sloppy
\sfcode`\.=1000\relax

% Отступ сверху и снизу от плавающих объектов
\setlength{\intextsep}{1em}

% --- подпись к рисункам и таблицам ---

% подписи к подрисункам
\usepackage{subcaption}
\renewcommand\thesubfigure{\asbuk{subfigure}}
\DeclareCaptionLabelFormat{rightparen}{#2)}
\captionsetup[subfloat]{labelformat=rightparen}

\abovecaptionskip=0pt
\belowcaptionskip=0pt
\newlength{\@tblwid}
\setlength{\@tblwid}{10cm}
\renewcommand{\@makecaption}[2]{%
	\def\@tabenvname{table}%
	\ifx\@currenvir\@tabenvname%
		% we're in a table environment
		\vspace{\abovecaptionskip}%
		\centering\parbox{\@tblwid}{%
			{\flushleft\textbf{#1.} #2\par\vspace{2mm}}%
		}
		\vspace{\belowcaptionskip}%
	\else%
		% we're in a figure environment
		\vspace{\abovecaptionskip}%
		\sbox{\@tempboxa}{{#1. #2}}%
		\ifdim \wd\@tempboxa >\hsize%
			{\textbf{\small #1.} #2}%
		\else%
			\global\@minipagefalse%
			\hbox to \hsize {\textbf{\hfil #1.} #2 \hfil}%
		\fi%
		\vspace{\belowcaptionskip}%
	\fi%
}

% --- таблица ---
\newcommand{\tabref}[1]{tab.~\ref{#1}} % быстрая ссылка на таблицу
\newsavebox{\@tblbox}
\newcommand{\tab}[3]{% label, caption, data
	\begin{table}[h]%
	\sbox{\@tblbox}{#3}% сохранить таблицу в бокс
	\settowidth{\@tblwid}{\usebox{\@tblbox}}% измерить ширину полученного бокса
	%\setlength{\@tblwid}{\linewidth}% измерить ширину полученного бокса
	\caption{#2}%
	\label{#1}%
	\centering%
	\usebox{\@tblbox}% собственно напечатать таблицу
	\end{table}%
}

% --- рисунок ---
\newcommand{\figref}[1]{fig.~\ref{#1}} % быстрая ссылка на рисунок
\newcommand{\fig}[3]{% params, label, caption
	\begin{figure}[h]%
		\centering%
		\includegraphics[#1]{#2}%
		\caption{#3}%
		\label{#2}%
	\end{figure}%
}

% --- исходный код ---
\newcommand{\code}[4][\linewidth]{% width, params, label, caption
	\begin{figure}[h]%
		\centering%
		\topsep=0pt%
		\partopsep=0pt%
		\begin{minipage}{#1}
		{
		\small\VerbatimInput[#2]{#3}

		}%
		\end{minipage}
		\vskip 3pt
		\caption{#4}%
		\label{#3}%
	\end{figure}%
}

% --- исходный код без номера ---
\newcommand{\codenonum}[3]{% params, label, caption
	\begin{figure}[h]%
		\centering%
		\topsep=0pt%
		\partopsep=0pt%
		\begin{minipage}{\linewidth}
		{
		\small\VerbatimInput[#1]{#2}

		}%
		\end{minipage}
		\vskip 3pt
		#3%
		\label{#2}%
	\end{figure}%
}

% --- неплавающий рисунок
\newcommand{\fignofloat}[3]{% params, label, caption
	\center%
	\includegraphics[#1]{#2}%
	\caption{#3}%
	\label{#2}%
}

\newcommand{\MakeUppercaseWithNewline}[1]{%
	\begingroup
		\let\SavedOrgNewline\\%
		\DeclareRobustCommand{\\}{\SavedOrgNewline}%
		\MakeTextUppercase{#1}%
	\endgroup
}

\renewcommand\@makefntext[1]{%
	\noindent\@makefnmark #1%
}

\newcommand\ack[1]{
	\vspace{1em}
	{\it
		#1

	}
}

\newcommand\received[1]{
	\begin{flushright}
	{\it Received #1.}
	\end{flushright}
}

\newcommand\footnoteref[1]{\protected@xdef\@thefnmark{\ref{#1}}\@footnotemark}

% vim: syntax=tex
