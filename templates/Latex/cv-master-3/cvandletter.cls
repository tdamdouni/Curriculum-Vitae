%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% LEROY Vanessa CV and cover letter
% LaTeX use cvandletter
% Version 1.1 (12/07/2017)
%
% Based on : 
% 'moderncv' package of Xavier Danaux (xdanaux@gmail.com).
%
% Original author:
% LEROY Vanessa (leroy.vanessa@live.fr)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% start of file 'cvandletter.cls'.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%----------------------------------------------------------
% IDENTIFICATION
%----------------------------------------------------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cvandletter}[2017/07/12 v1.1 curriculum vitae and cover letter document class]

%----------------------------------------------------------
% CLASS OPTIONS
%
% (need to be done before the external package loading, for example because
% we need \paperwidth, \paperheight and \@ptsize to be defined before loading
% geometry and fancyhdr)
%----------------------------------------------------------
% paper size option
\DeclareOption{a4paper}{
  \setlength\paperheight{297mm}
  \setlength\paperwidth{210mm}}
\DeclareOption{a5paper}{
  \setlength\paperheight{210mm}
  \setlength\paperwidth{148mm}}
\DeclareOption{b5paper}{
  \setlength\paperheight{250mm}
  \setlength\paperwidth{176mm}}
\DeclareOption{letterpaper}{
  \setlength\paperheight{11in}
  \setlength\paperwidth{8.5in}}
\DeclareOption{legalpaper}{
  \setlength\paperheight{14in}
  \setlength\paperwidth{8.5in}}
\DeclareOption{executivepaper}{
  \setlength\paperheight{10.5in}
  \setlength\paperwidth{7.25in}}
\DeclareOption{landscape}{
  \setlength\@tempdima{\paperheight}
  \setlength\paperheight{\paperwidth}
  \setlength\paperwidth{\@tempdima}}

% font size options
\newcommand\@ptsize{}
\DeclareOption{10pt}{\renewcommand\@ptsize{0}}
\DeclareOption{11pt}{\renewcommand\@ptsize{1}}
\DeclareOption{12pt}{\renewcommand\@ptsize{2}}

% font type options
\DeclareOption{sans}{\AtBeginDocument{\renewcommand{\familydefault}{\sfdefault}}}
\DeclareOption{roman}{\AtBeginDocument{\renewcommand{\familydefault}{\rmdefault}}}

% draft/final option
\DeclareOption{draft}{\setlength\overfullrule{5pt}}
\DeclareOption{final}{\setlength\overfullrule{0pt}}

% language
\newcommand\@language{}
\DeclareOption{french}{\renewcommand\@language{french}}

% execute default options
\ExecuteOptions{a4paper,11pt,final}

% process given options
\ProcessOptions\relax
\input{size1\@ptsize.clo}

%----------------------------------------------------------
% REQUIRED PACKAGES
%----------------------------------------------------------
% \AtEndPreamble hook (loading etoolbox instead of defining the macro, as to avoid incompatibilities with etoolbox (and packages relying on it) defining the macro too)
\RequirePackage{etoolbox}

% if... then... else... constructs
\RequirePackage{ifthen}

% color
\RequirePackage{xcolor}

% font loading
\RequirePackage{ifxetex,ifluatex}
\newif\ifxetexorluatex
\ifxetex
  \xetexorluatextrue
\else
  \ifluatex
    \xetexorluatextrue
  \else
    \xetexorluatexfalse
  \fi
\fi

% automatic loading of latin modern fonts
\RequirePackage[T1]{fontenc}
\IfFileExists{lmodern.sty}%
	{\RequirePackage{lmodern}}%
	{}

% language
\ifthenelse{\equal{\@language}{french}}
{
	% langue français
	\RequirePackage[utf8]{inputenc}   % accents dans le source
	\RequirePackage[francais]{babel}    % faire du français
}
{}

% graphics
\RequirePackage{graphicx}

% Liens hypertexte
\def\thepage{\arabic{page}}%
\RequirePackage{hyperref}
%\RequirePackage{bookmark}

% headers and footers
\RequirePackage{fancyhdr}

% lengths calculations
\RequirePackage{calc}

% advanced command arguments (LaTeX 3)
\RequirePackage{xparse}

%% micro-typography (e.g., character protrusion, font expansion, hyphenatable letterspacing)
%\RequirePackage{microtype}

% stack of key-value elements, used to save personal information
\RequirePackage{moderncvcollection}

% for test 
\RequirePackage{lipsum}

% loads a style variant
% usage: \usecvstyle{<style variant name>}
\newcommand*{\usecvstyle}[1]{%
  \RequirePackage{cvstyle#1}%
}
  
% loads a style variant
% usage: \useletterstyle{<style variant name>}
\newcommand*{\useletterstyle}[1]{%
  \RequirePackage{letterstyle#1}%
}
  
% loads a color scheme
% usage: \usecolor{<color scheme name>}
\newcommand*{\usecolor}[1]{%
  \RequirePackage{cvandlettercolor#1}%
}

% loads an icons set
% usage: \useicons{<icon set name>}
\newcommand*{\useicons}[1]{%
  \RequirePackage{cvandlettericons#1}%
}

% loads an fonts set
% usage: \usefonts{<font set name>}
\newcommand*{\usefonts}[1]{%
  \RequirePackage{cvandletterfonts#1}%
}

%----------------------------------------------------------
% CLASS DEFINITION
%----------------------------------------------------------
%%%% minimal base settings
%%%\setlength\lineskip{1\p@}
%%%\setlength\normallineskip{1\p@}
%\renewcommand\baselinestretch{}
%%%\setlength{\parindent}{0\p@}
%\setlength{\parskip}{0\p@}
%%%\setlength\columnsep{10\p@}
%%%\setlength\columnseprule{0\p@}
%%%\setlength\fboxsep{3\p@}
%%%\setlength\fboxrule{.4\p@}
%%%\setlength\arrayrulewidth{.4\p@}
%%%\setlength\doublerulesep{2\p@}
%
%\raggedbottom
%\onecolumn

% colors
%-------
\definecolor{color0}{rgb}{0,0,0}% main default color, normally left to black
\definecolor{color1}{rgb}{0,0,0}% primary scheme color
\definecolor{color2}{rgb}{0,0,0}% secondary scheme color
\definecolor{color3}{rgb}{0,0,0}% tertiary scheme color

%% symbols
%%-------
%%%% itemize labels (the struts were added to correct inter-item spacing (works for single line items, until a solution is found for multi-line ones...)
%%%\newcommand*{\labelitemi}          {\strut\textcolor{color1}{\large\rmfamily\textbullet}}% the \rmfamily is required to force Latin Modern fonts when using sans serif, as OMS/lmss/m/n is not defined and gets substituted by OMS/cmsy/m/n
%%%\newcommand*{\labelitemii}         {\strut\textcolor{color1}{\large\bfseries-}}
%%%\newcommand*{\labelitemiii}        {\strut\textcolor{color1}{\rmfamily\textperiodcentered}}% alternative: \textasteriskcentered; the \rmfamily is required to force Latin Modern fonts when using sans serif, as OMS/lmss/m/n is not defined and gets substituted by OMS/cmsy/m/n
%%%\newcommand*{\labelitemiv}         {\labelitemiii}
%%%
%%%% enumerate labels
%%%\renewcommand{\theenumi}           {\@arabic\c@enumi}
%%%\renewcommand{\theenumii}          {\@alph\c@enumii}
%%%\renewcommand{\theenumiii}         {\@roman\c@enumiii}
%%%\renewcommand{\theenumiv}          {\@Alph\c@enumiv}
%%%\newcommand*{\listitemsymbol}      {\labelitemi~}

% fonts
%------
\AtBeginDocument{\normalfont\color{color0}}


%----------------------------------------------------------
% PROPRIÉTÉS DU DOCUMENT
%----------------------------------------------------------
\AtEndPreamble{
	\ifthenelse{\equal{\@language}{french}}
	{%
		\hypersetup{
			breaklinks,
			%pdfcenterwindow	= true,      	  % position the document window in the center of the screen
			pdfborder       = 0 0 0,
			pdfpagelayout	  = TwoPageLeft, 						% set layout of PDF pages, ex : SinglePage,TwoPageRight
			pdfstartpage    = 1,
			pdfstartview	  = {FitV},    				% fits the width of the page to the window, ex : FitH FitV
			pdfcreator      = {\LaTeX{} avec mon propre package},
			pdfproducer     = {\LaTeX{}},% will/should be set automatically to the correct TeX engine used
			bookmarksopen   = true,
			bookmarksdepth  = 2,% to show sections and subsections
			pdfauthor       = {\@firstname{}~\@familyname{}},
			pdftitle        = {\@firstname{}~\@familyname{} -- \@title{}},
			pdfsubject      = {CV et lettre de motivation de \@firstname{}~\@familyname{}},
			pdfkeywords     = {\@firstname{}~\@familyname{}, candidature, curriculum vit\ae{}, CV, lettre de motivation}
		}
	}{%
		\hypersetup{%
			breaklinks,
			pdfcenterwindow	= true,      	  % position the document window in the center of the screen
			pdfborder       = 0 0 0,
			pdfpagelayout	  = TwoPageLeft, 						% set layout of PDF pages, ex : SinglePage,TwoPageRight
			pdfstartpage    = 1,
			pdfstartview	  = {FitV},    				% fits the width of the page to the window, ex : FitH FitV
			pdfcreator      = {\LaTeX{} with my 'cv' package},
			pdfproducer     = {\LaTeX{}},% will/should be set automatically to the correct TeX engine used
			bookmarksopen   = true,
			bookmarksdepth  = 2,% to show sections and subsections
			pdfauthor       = {\@firstname{}~\@familyname{}},
			pdftitle        = {\@firstname{}~\@familyname{} -- \@title{}},
			pdfsubject      = {Curriculum Vit\ae{} and a cover letter of \@firstname{}~\@familyname{}},
			pdfkeywords     = {\@firstname{}~\@familyname{}, curriculum vit\ae{}, CV, cover letter}
		}
	}
}

% headers and footers
\fancypagestyle{plain}{
  \renewcommand{\headrulewidth}{0pt}
  \renewcommand{\footrulewidth}{0pt}
  \fancyhf{}}
% page numbers in footer if more than 1 page
\newif\if@displaypagenumbers\@displaypagenumberstrue
\newcommand*{\nopagenumbers}{\@displaypagenumbersfalse}
\AtEndPreamble{%
  \AtBeginDocument{%
    \if@displaypagenumbers%
      \@ifundefined{r@lastpage}{}{%
        \ifthenelse{\pageref{lastpage}>1}{%
          \newlength{\pagenumberwidth}%
          \settowidth{\pagenumberwidth}{\color{color2}\contactfont\itshape\strut\thepage/\pageref{lastpage}}%
          \fancypagestyle{plain}{%
            \fancyfoot[r]{\parbox[b]{\pagenumberwidth}{\color{color2}\pagenumberfont\strut\thepage/\pageref{lastpage}}}}% the parbox is required to ensure alignment with a possible center footer (e.g., as in the casual style)
          \pagestyle{plain}}{}}%
      \AtEndDocument{\label{lastpage}}\else\fi}}
\pagestyle{plain}

%----------------------------------------------------------
% OVERALL DESIGN COMMANDS DEFINITIONS
%----------------------------------------------------------
% elements
%---------
% defines one's name
% usage: \name{<firstname>}{<lastname>}
\newcommand*{\name}[2]{\def\@firstname{#1}\def\@familyname{#2}}
\newcommand*{\firstname}[1]{\def\@firstname{#1}}
\newcommand*{\givenname}[1]{\def\@firstname{#1}}
\newcommand*{\lastname}[1]{\def\@familyname{#1}}
\newcommand*{\familyname}[1]{\def\@familyname{#1}}
\def\@name{\@firstname~\@familyname}

% defines sex
% usage: \sex{<sex>} 
% where <sex> should be either "female" or "male" (default)
\newcommand*{\sex}[1]{\def\@sex{#1}}

% defines one's address (optional)
% usage: \address{<street>}{<codecity>}{<city>}{<country>}
% where the <codecity>, <city> and <country> arguments can be omitted or provided empty
\NewDocumentCommand{\address}{mG{}G{}G{}}{\def\@addressstreet{#1}\def\@addresscodecity{#2}\def\@addresscity{#3}\def\@addresscountry{#4}}

% defines one's email (optional)
% usage: \email{<email adress>}
\newcommand*{\email}[1]{\def\@email{#1}}

% adds a fixed/mobile/fax number to one's personal information (optional)
% usage: \phone[<optional type>]{<number>}
% where <optional type> should be either "fixed", "mobile" (default) or "fax
\collectionnew{phones}
\newcommand*{\phone}[2][mobile]{\collectionadd[#1]{phones}{#2}}
\newcommand*{\mobile}[1]{\phone[mobile]{#1}}

% adds a social link to one's personal information (optional)
% usage: \social[<optional type>][<optional url>]{<account name>}
% where <optional type> should be either "homepage", "linkedin", "twitter" or "github"
\collectionnew{socials}
\NewDocumentCommand{\social}{O{}O{}m}{%
  \ifthenelse{\equal{#2}{}}%
    {%
      \ifthenelse{\equal{#1}{linkedin}}{\collectionadd[#1]{socials}{\protect\httplink[#3]{www.linkedin.com/in/#3}}}{}%
      \ifthenelse{\equal{#1}{twitter}} {\collectionadd[#1]{socials}{\protect\httplink[#3]{www.twitter.com/#3}}}    {}%
      \ifthenelse{\equal{#1}{github}}  {\collectionadd[#1]{socials}{\protect\httplink[#3]{www.github.com/#3}}}     {}%
    }
    {\collectionadd[#1]{socials}{\protect\httplink[#3]{#2}}}%
}
\newcommand*{\linkedin}[1]{\social[linkedin]{#1}}
\newcommand*{\github}[1]{\social[github]{#1}}

% defines one's birth date (optional)
% usage: \birthdate{<year>}{<month>}{<day>}
% where the <month> and <day> arguments can be omitted or provided empty
\NewDocumentCommand{\birthdate}{mG{}G{}}{\def\@birthyear{#1}\def\@birthmonth{#2}\def\@birthday{#3}}

% defines a driving licence to one's personal information (optional)
% usage: \drivinglicence{<text>}
\newcommand{\drivinglicence}[1]{\def\@drivinglicence{#1}}

% defines additional personal information (optional)
% usage: \extrainfo{<text>}
\newcommand*{\extrainfo}[1]{\def\@extrainfo{#1}}

% symbols
%--------
\newcommand*{\addresssymbol}       {}
\newcommand*{\mobilephonesymbol}   {}
\newcommand*{\fixedphonesymbol}    {}
\newcommand*{\faxphonesymbol}      {}
\newcommand*{\emailsymbol}         {}
\newcommand*{\homepagesocialsymbol}{}
\newcommand*{\linkedinsocialsymbol}{}
\newcommand*{\twittersocialsymbol} {}
\newcommand*{\githubsocialsymbol}  {}

% fonts
%------
\newcommand*{\namefont}{}
\newcommand*{\contactfont}{}

% styles
%------
\newcommand*{\namestyle}[1]{{\namefont#1}}
\newcommand*{\contactstyle}[1]{{\contactfont#1}}

% other
%------
% internal maketitle command to issue a new line only when required
\newif\if@firstdetailselement\@firstdetailselementtrue
\newcommand*{\makenewline}{
  \if@firstdetailselement%
    \strut% to ensure baseline alignment, e.g. with when put in the margin vs sections that also contains a \strut
  \else%
    \\%
	\fi%
  \@firstdetailselementfalse%
}

% formates date : day/month/year
\def\@birthdate{%
	\ifthenelse{\equal{\@birthyear}{}}%
	{}%
	{%
		\ifthenelse{\equal{\@language}{french}}
		{%
			\ifthenelse{\equal{\@sex}{female}}{Née le\ }{Né le\ }%
			%
			\ifthenelse{\equal{\@birthday}{}}%
			{%
				\ifthenelse{\equal{\@birthmonth}{}}%
				{\@birthyear}%
				{\@birthmonth/\@birthyear}%
			}%
			{\@birthday/\@birthmonth/\@birthyear}%
		}%
		{
			\ifthenelse{\equal{\@birthmonth}{}}%
			{\@birthyear}%
			{%
				\ifthenelse{\equal{\@birthday}{}}%
				{\@birthmonth/\@birthyear}%
				{\@birthmonth/\@birthday/\@birthyear}%
			}%
		}%
	}%
}%

% makes an email hyperlink
% usage: \emaillink[optional text]{link}
\newcommand*{\emaillink}[2][]{%
  \ifthenelse{\equal{#1}{}}%
    {\href{mailto:#2}{#2}}%
    {\href{mailto:#2}{#1}}}

% makes a http hyperlink
% usage: \httplink[optional text]{link}
\newcommand*{\httplink}[2][]{%
  \ifthenelse{\equal{#1}{}}%
    {\href{http://#2}{#2}}%
    {\href{http://#2}{#1}}}

%----------------------------------------------------------
% RESUME DESIGN COMMANDS DEFINITIONS
%----------------------------------------------------------
% elements
%------
% defines one's picture (optional)
% usage: photo[<picture width>][<picture frame thickness>]{<picture filename>}
\NewDocumentCommand{\photo}{O{64pt}O{0.4pt}m}{\def\@photowidth{#1}\def\@photoframewidth{#2}\def\@photo{#3}}

% defines one's title (optional)
% usage: \title{<title>}
\renewcommand*{\title}[1]{\def\@title{#1}}

% defines more information (optional)
% usage : \aboutme{<text>}
\newcommand*{\aboutme}[1]{\def\@aboutme{#1}}

% makes a resume section
% usage: \section{<title>}
% identical starred and non-starred variants should be defined for compatibility with other packages (e.g. with natbib, that uses \section*{} for the bibliography header)
\NewDocumentCommand{\section}{sm}{}

% makes a resume subsection
% usage: \subsection{title}
\NewDocumentCommand{\subsection}{sm}{}

% makes a typical resume job / education entry
% usage: \cventry[spacing]{years}{degree/job title}{institution/employer}{localization}{optionnal: grade/...}{optional: comment/job description}
\newcommand*{\cventry}[7][.25em]{}

% makes a resume line with a header and a corresponding text
% usage: \cvitem[spacing]{header}{text}
\newcommand*{\cvitem}[3][.25em]{}


% fonts
%------
\newcommand*{\@titlefont}{}
\newcommand*{\@aboutmefont}{}
\newcommand*{\@sectionfont}{}
\newcommand*{\@subsectionfont}{}
\newcommand*{\@hintfont}{}

% styles
%------
\newcommand*{\@titlestyle}[1]{{\@titlefont#1}}
\newcommand*{\@aboutmestyle}[1]{{\@aboutmefont#1}}
\newcommand*{\@sectionstyle}[1]{{\@sectionfont#1}}
\newcommand*{\@subsectionstyle}[1]{{\@subsectionfont#1}}
\newcommand*{\@hintstyle}[1]{{\@hintfont#1}}

% other
%------
\newcommand*{\cvnametitle}[1][l]{%
	\begin{tabular}[b]{@{}#1@{}}%
		\namestyle{\@name}%
		\ifthenelse{\equal{\@title}{}}{}{\\[1.25em]\@titlestyle{\@title}}%
	\end{tabular}
}%

\newcommand*{\cvcontact}[1][r]{%
	\def\phonesdetails{}%
	\collectionloop{phones}{% the key holds the phone type (=symbol command prefix), the item holds the number
		\protected@edef\phonesdetails{\phonesdetails\protect\makenewline\csname\collectionloopkey phonesymbol\endcsname\collectionloopitem}}%
		%
	\def\socialsdetails{}%
	\collectionloop{socials}{% the key holds the social type (=symbol command prefix), the item holds the link
		\protected@edef\socialsdetails{\socialsdetails\protect\makenewline\csname\collectionloopkey socialsymbol\endcsname\collectionloopitem}}%
		%
	\contactstyle{%
		\begin{tabular}[b]{@{}#1@{}}%
			\ifthenelse{\isundefined{\@addressstreet}}{}{\makenewline\addresssymbol\@addressstreet}%
				\ifthenelse{\equal{\@addresscity}{}}{}{\makenewline\@addresscodecity\ \@addresscity}
				\ifthenelse{\equal{\@addresscountry}{}}{}{\makenewline\@addresscountry}%
			\phonesdetails% needs to be pre-rendered as loops and tabulars seem to conflict
			\ifthenelse{\isundefined{\@email}}{}{\makenewline\emailsymbol\emaillink{\@email}}%
			\socialsdetails% needs to be pre-rendered as loops and tabulars seem to conflict
			\ifthenelse{\isundefined{\@birthdate}}{}{\makenewline\@birthdate}%
			\ifthenelse{\isundefined{\@extrainfo}}{}{\makenewline\@extrainfo}%
		\end{tabular}
	}
}%

\newcommand*{\cvpicturerect}{%
	\ifthenelse{\isundefined{\@photo}}%
	{}%
	{%
		\hspace*{\separatorcolumnwidth}%
		\color{color1}%
		\setlength{\fboxrule}{\@photoframewidth}%
		\ifdim\@photoframewidth=0pt%
			\setlength{\fboxsep}{0pt}\fi%
		\framebox{\includegraphics[width=\@photowidth]{\@photo}}%
	}%
}

% make cv
%------
% makes the resume title
% usage: \makecvtitle
\newcommand*{\makecvtitle}{}

%----------------------------------------------------------
% COVER LETTER DESIGN
%----------------------------------------------------------
% elements
%---------
\newcommand*{\recipient}[5]{\def\@recipientcontactname{#1}\def\@recipientname{#2}\def\@recipientstreet{#3}\def\@recipientcodecity{#4}\def\@recipientcity{#5}}

\newcommand*{\object}[1]{\def\@object{#1}}
\newcommand*{\opening}[1]{\def\@opening{#1}}
\newcommand*{\closing}[1]{\def\@closing{#1}}

% makes a typical resume job / education entry
% usage: \lettertext[spacing]{<text>}
\newcommand*{\lettertext}[2][\parskip]{}

\newcommand*{\enclosure}[1]{\def\@attached{#1}}

% other
%-------
\def\@recipientaddress{
	\@recipientstreet\\
	\@recipientcodecity\ \@recipientcity
}

\def\@sendercontact{%
	% sender name
	{\bfseries\upshape\@name}\@firstdetailselementfalse%
	% sender address
	\ifthenelse{\isundefined{\@addressstreet}}{}{\makenewline\addresssymbol\@addressstreet}%
	\ifthenelse{\equal{\@addresscity}{}}{}{\makenewline\ifthenelse{\equal{\@addresscodecity}{}}{}{\@addresscodecity\ }\@addresscity}
	\ifthenelse{\equal{\@addresscountry}{}}{}{\makenewline\@addresscountry}%
	% sender contact
	\collectionloop{phones}{% the key holds the phone type (=symbol command prefix), the item holds the number
		\makenewline\csname\collectionloopkey phonesymbol\endcsname\collectionloopitem}%
	\ifthenelse{\isundefined{\@email}}{}{\makenewline\emailsymbol\emaillink{\@email}}%
}%

\def\@recipientcontact{%
	% recipient name
	{\bfseries\upshape\@recipientname}\@firstdetailselementfalse%
	\ifthenelse{\equal{\@language}{french}}
	{%
	\ifthenelse{\equal{\@recipientcontactname}{}}{}{{\makenewline\bfseries\upshape\`A l'attention de \@recipientcontactname}}%
	}{}
	% recipient address
	\makenewline\@recipientaddress
}%

\def\@senderdate{
	\ifthenelse{\equal{\@language}{french}}
	{Le\ \@date\ifthenelse{\equal{\@addresscity}{}}{}{\ à\ \@addresscity}}
	{\@date}% US informal style: "January 1, 1900"; UK formal style: "01/01/1900"
}
% makes letter
%---------
% makes the letter title
% usage: \makelettertitle
\newcommand*{\makelettertitle}{}

% makes the letter closing
% usage: \makelettercontents
\newcommand*{\makelettercontents}{}

\endinput

%%%\newcommand*{\hintfont}{}
%%%\newcommand*{\pagenumberfont}{\contactfont\itshape}
%%%\newcommand*{\hintstyle}[1]{{\hintfont#1}}
%%%\newcommand*{\pagenumberstyle}[1]{{\pagenumberfont#1}}
%
%%%% strings for internationalisation
%%%\newcommand*{\refname}{Publications}
%%%
%%%% makes the footer (normally used both for the resume and the letter)
%%%% usage: \makefooter
%%%\newcommand*{\makefooter}{}%
%%%% recomputes all automatic lengths
%%%\newcommand*{\recomputelengths}{\recomputecvlengths}
%%%\AtBeginDocument{\recomputelengths{}}
%%%
%%%% creates a length if not yet defined
%%%\newcommand*{\@initializelength}[1]{%
  %%%\ifdefined#1\else\newlength{#1}\fi}
%%
%%%% recompute all resume lengths
%%%\newcommand*{\recomputecvlengths}{}
%%%
%%%% makes the resume footer
%%%% usage: \makecvfooter
%%%\newcommand*{\makecvfooter}{\makefooter}

%%%% makes a resume line 2 headers and their corresponding text
%%%% usage: \cvdoubleitem[spacing]{header1}{text1}{header2}{text2}
%%%\newcommand*{\cvdoubleitem}[5][.25em]{}
%%%
%%%% makes a resume line with a list item
%%%% usage: \cvlistitem[label]{item}
%%%\newcommand*{\cvlistitem}[2][\listitemsymbol]{}
%%%
%%%% makes a resume line with 2 list items
%%%% usage: \cvlistdoubleitem[label]{item1}{item2}
%%%\newcommand*{\cvlistdoubleitem}[3][\listitemsymbol]{}
%%%
%%%% makes a resume entry with a proficiency comment
%%%% usage: \cvitemwithcomment[spacing]{header}{text}{comment}
%%%\newcommand*{\cvitemwithcomment}[4][.25em]{}
%%%
%%%% makes a generic hyperlink
%%%% usage: \link[optional text]{link}
%%%\newcommand*{\link}[2][]{%
  %%%\ifthenelse{\equal{#1}{}}%
    %%%{\href{#2}{#2}}%
    %%%{\href{#2}{#1}}}

%%%% cvcolumns environment, where every column is created through \cvcolumn
%%%% usage: \begin{cvcolumns}
%%%%          \cvcolumn[width]{head}{content}
%%%%          \cvcolumn[width]{head}{content}
%%%%          ...
%%%%        \end{cvcolumns}
%%%% where "width" is the width as a fraction of the line length (between 0 and 1), "head" is the column header and "content" its content
%%%\newcounter{cvcolumnscounter}% counter for the number of columns
%%%\newcounter{cvcolumnsautowidthcounter}% counter for the number of columns with no column width provided, and which will then be equally distributed
%%%\newcounter{tmpiteratorcounter}% counter for any temporary purpose (e.g., iterating loops)
%%%\newlength{\cvcolumnsdummywidth}\setlength{\cvcolumnsdummywidth}{1000pt}% dummy width for total width, in order to enable arithmetics (TeX has no float variables, only integer counters or lengths)
%%%\newlength{\cvcolumnswidth}% total width available for head / content
%%%\newlength{\cvcolumnsautowidth}% total width of columns with no explicit width provided
%%%\newlength{\cvcolumnautowidth}% width of one of the columns with no explicit width provided (based on equal distribution of remaining space)
%%%\newif\if@cvcolumns@head@empty% whether or not at least one of the columns has a header
%%%\newenvironment*{cvcolumns}%
  %%%{% at environment opening: reset counters, lengths and ifs
    %%%\setcounter{cvcolumnscounter}{0}%
    %%%\setcounter{cvcolumnsautowidthcounter}{0}%
    %%%\setlength{\cvcolumnsautowidth}{\cvcolumnsdummywidth}%
    %%%\setlength{\cvcolumnautowidth}{0pt}%
    %%%\@cvcolumns@head@emptytrue}%
  %%%{% at environment closing: typeset environment
    %%%% compute the width of each cvcolumn, considering a spacing of \separatorcolumnwidth and the columns with set width
    %%%\ifnum\thecvcolumnscounter>0%
      %%%\setlength{\cvcolumnswidth}{\maincolumnwidth-\value{cvcolumnscounter}\separatorcolumnwidth+\separatorcolumnwidth}%
      %%%\setlength{\cvcolumnautowidth}{\cvcolumnswidth*\ratio{\cvcolumnsautowidth}{\cvcolumnsdummywidth}/\value{cvcolumnsautowidthcounter}}\fi%
    %%%% pre-aggregate the tabular definition, heading and content (required before creating the tabular, as the tabular environment doesn't like loops --- probably because "&" generates a \endgroup)
    %%%% - the tabular definition is the aggregation of the different "\cvcolumn<i>@def" (by default "p{\cvcolumnautowidth}"), separated by "@{\hspace*{\separatorcolumnwidth}}"
    %%%% - the tabular heading is the aggregation of the different "\cvcolumn<i>@head", separated by "&"
    %%%% - the tabular content is the aggregation of the different "\cvcolumn<i>@content", separated by "&"
    %%%% to aggregate the different elements, \protected@edef or \g@addto@macro is required to avoid that \cvcolumns@def, -@head and -@content get expanded in subsequent redefinitions, which would cause errors due to the expansions of \hspace, of \subsectionstyle and possibly of user content/argument such as font commands
    %%%\def\cvcolumns@def{}%
    %%%\def\cvcolumns@head{}%
    %%%\def\cvcolumns@content{}%
    %%%\setcounter{tmpiteratorcounter}{0}%
    %%%% loop based on \g@addto@macro
    %%%\loop\ifnum\thetmpiteratorcounter<\thecvcolumnscounter%
      %%%\ifnum\thetmpiteratorcounter=0\else%
        %%%\g@addto@macro\cvcolumns@def{@{\hspace*{\separatorcolumnwidth}}}%
        %%%\g@addto@macro\cvcolumns@head{&}%
        %%%\g@addto@macro\cvcolumns@content{&}\fi%
      %%%\expandafter\g@addto@macro\expandafter\cvcolumns@def\expandafter{\csname cvcolumn\roman{tmpiteratorcounter}@def\endcsname}%
      %%%\expandafter\g@addto@macro\expandafter\cvcolumns@head\expandafter{\csname cvcolumn\roman{tmpiteratorcounter}@head\endcsname}%
      %%%\expandafter\g@addto@macro\expandafter\cvcolumns@content\expandafter{\csname cvcolumn\roman{tmpiteratorcounter}@content\endcsname}%
      %%%\stepcounter{tmpiteratorcounter}%
      %%%\repeat%
    %%%% create the tabular
    %%%\cvitem{}{%
      %%%\begin{tabular}{\cvcolumns@def}%
        %%%\if@cvcolumns@head@empty\else%
          %%%\cvcolumns@head%
          %%%\\\fi%
        %%%\cvcolumns@content%
      %%%\end{tabular}}}
%%%
%%%% cvcolumn command, to create a column inside a cvcolumns environment
%%%% usage: \cvcolumn[width]{head}{content}
%%%% where "width" is the width as a fraction of the line length (between 0 and 1), "head" is the column header and "content" its content ("head" and "content" can contain "\\", "\newline" or any other paragraph command such as "itemize")
%%%\newcommand*{\cvcolumn}[3][\cvcolumnautowidth]{%
%%%%  \def\cvcolumn@width{}%
  %%%\ifthenelse{\equal{#1}{\cvcolumnautowidth}}%
    %%%{% if no width fraction is provided, count this column as auto-adjusted and set its width to \cvcolumnsautowidth
      %%%\stepcounter{cvcolumnsautowidthcounter}%
      %%%\expandafter\expandafter\expandafter\def\expandafter\csname cvcolumn\roman{cvcolumnscounter}@def\endcsname{p{\cvcolumnautowidth}}%
      %%%\expandafter\expandafter\expandafter\def\expandafter\csname cvcolumn\roman{cvcolumnscounter}@head\endcsname{\protect\parbox[b]{\cvcolumnautowidth}{\protect\subsectionstyle{#2}}}}%
    %%%{% if a width is provided, set the width of the column to it and decrease the available space for auto-adjusted columns
      %%%\addtolength{\cvcolumnsautowidth}{-#1\cvcolumnsdummywidth}%
      %%%\expandafter\expandafter\expandafter\def\expandafter\csname cvcolumn\roman{cvcolumnscounter}@def\endcsname{p{#1\cvcolumnswidth}}%
      %%%\expandafter\expandafter\expandafter\def\expandafter\csname cvcolumn\roman{cvcolumnscounter}@head\endcsname{\protect\parbox[b]{#1\cvcolumnswidth}{\protect\subsectionstyle{#2}}}}%
  %%%\ifthenelse{\equal{#2}{}}{}{\@cvcolumns@head@emptyfalse}%
  %%%\expandafter\expandafter\expandafter\def\expandafter\csname cvcolumn\roman{cvcolumnscounter}@content\endcsname{\protect\cvcolumncell{#3}}%
  %%%\stepcounter{cvcolumnscounter}}
%%%
%%%% internal cvcolumncell command, that enables a cvcolumn cell to contain paragraph commands (lists, newlines, etc)
%%%\newcommand*{\cvcolumncell}[1]{{% put cell inside a group, so that command redefinitions are only local
  %%%% roughly restore \\ to its regular definition (outside of tabular)
  %%%\renewcommand*{\\}{\newline}%
  %%%% enclose the contents of the cell inside a vertical box, to allow paragraph commands
  %%%\protect\vtop{#1}}}
%%%
%%%% thebibliography environment, for use with BibTeX and possibly multibib
%%%\newlength{\bibindent}
%%%\setlength{\bibindent}{1.5em}
%%%% bibliography item label
%%%\newcommand*{\bibliographyitemlabel}{}% use \@biblabel{\arabic{enumiv}} for BibTeX labels
%%%% bibliography head (section, etc}, depending on whether multibib is used
%%%\newcommand*{\bibliographyhead}[1]{\section{#1}}
%%%\AtEndPreamble{\@ifpackageloaded{multibib}{\renewcommand*{\bibliographyhead}[1]{\subsection{#1}}}{}}
%%%% thebibliography environment definition
%%%\newenvironment{thebibliography}[1]{}{}
%%%\newcommand*{\newblock}{\hskip .11em\@plus.33em\@minus.07em}
%%%\let\@openbib@code\@empty
%%%
%%%% itemize, enumerate and description environment
%%%\setlength{\leftmargini}   {1em}
%%%\leftmargin\leftmargini
%%%\setlength{\leftmarginii}  {\leftmargini}
%%%\setlength{\leftmarginiii} {\leftmargini}
%%%\setlength{\leftmarginiv}  {\leftmargini}
%%%\setlength{\leftmarginv}   {\leftmargini}
%%%\setlength{\leftmarginvi}  {\leftmargini}
%%%\setlength{\labelsep}      {.5em}% this is the distance between the label and the body, but it pushes the label to the left rather than pushing the body to the right (to do the latter, modify \leftmargin(i)
%%%\setlength{\labelwidth}    {\leftmargini}% unfortunately, \labelwidth is not defined by item level (i.e. no \labeliwidth, \labeliiwidth, etc)
%%%\addtolength{\labelwidth}  {-\labelsep}
%%%\@beginparpenalty -\@lowpenalty
%%%\@endparpenalty   -\@lowpenalty
%%%\@itempenalty     -\@lowpenalty
%%%\newcommand\labelenumi{\theenumi.}
%%%\newcommand\labelenumii{(\theenumii)}
%%%\newcommand\labelenumiii{\theenumiii.}
%%%\newcommand\labelenumiv{\theenumiv.}
%%%\renewcommand\p@enumii{\theenumi}
%%%\renewcommand\p@enumiii{\p@enumii(\theenumii)}
%%%\renewcommand\p@enumiv{\p@enumiii\theenumiii}
%%%% description label
%%%\newcommand*\descriptionlabel[1]{\hspace\labelsep\normalfont\bfseries#1}
%%%
%%%% classical \today definition
%%%\def\today{\ifcase\month\or
  %%%January\or February\or March\or April\or May\or June\or
  %%%July\or August\or September\or October\or November\or December\fi
  %%%\space\number\day, \number\year}
	
%% end of file `cv.cls'.