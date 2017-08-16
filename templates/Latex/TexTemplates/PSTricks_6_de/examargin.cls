%
% $Id: examargin.cls 162 2009-12-05 20:32:34Z herbert $
%
%%
%% The LaTeX Companion, 2ed
%%
%% Example ``margin lines'' class for use with the Companion examples.
%%
%% Copyright (C) 2004 Frank Mittelbach, Michel Goossens,
%%    Johannes Braams, David Carlisle, and Chris Rowley
%%
%% It may be distributed and/or modified under the conditions
%% of the LaTeX Project Public License, either version 1.3
%% of this license or (at your option) any later version.
%%
%% See http://www.latex-project.org/lppl.txt for details.
%%
%
\LoadClass[twoside]{article}

\RequirePackage[T1]{fontenc}

%\RequirePackage{times}
%\RequirePackage[scaled]{helvet}
\RequirePackage[scaled=1.07]{libertine}


\let\StartShownPreambleCommands\relax
\let\StopShownPreambleCommands\relax


\let\ps@origplain\ps@plain
\let\ps@plain\ps@empty % this class doesn't produces page numbers
                       % since this would make examples too big
                       % but if necessary there is origplain


% Public version uses cmtt (ectt)
%\renewcommand{\ttdefault}{cmtt}\endinput
% Book version uses emtt, and restricts to two colors.

\DeclareFontFamily{T1}{emtt}{\hyphenchar \font\m@ne}
\DeclareFontShape{T1}{emtt}{m}{n}{
        <-9>    emtt8
        <9-10>  emtt9
        <10-12> emtt10
        <12->   emtt12
      }{}
\DeclareFontShape{T1}{emtt}{m}{it}{
        <->     emitt10
      }{}
\DeclareFontShape{T1}{emtt}{m}{sl}{
        <->     emsltt10
      }{}
\DeclareFontShape{T1}{emtt}{m}{sc}{
        <->     emtcsc10
      }{}

% FAKE OT1 as it is needed in one example

\DeclareFontFamily{OT1}{emtt}{\hyphenchar \font\m@ne}
\DeclareFontShape{OT1}{emtt}{m}{n}{
        <-9>    emtt8
        <9-10>  emtt9
        <10-12> emtt10
        <12->   emtt12
      }{}

\renewcommand{\ttdefault}{emtt}

% as the book is printed in two colors only (black and blue) we need
% to ensure that other colors are replaced by gray if necessary:

\AtBeginDocument{
\ifx\color\@undefined
\else
\definecolor{red}{gray}{.7}
\definecolor{green}{gray}{.8}   % we keep green
\definecolor{yellow}{gray}{.9}
\fi
}

% for margin rules in math examples we need color to make them
% blue. So in this class color is actually always present:

\RequirePackage{color}

\newcommand \EX@rulewidth {0.25pt}

%% Keep on hacking!
\newcommand \SetupMarginLines{%
    \AtBeginDocument
     {\hbox\bgroup \kern-\EX@rulewidth
      {\color{blue}\vrule width \EX@rulewidth}%
      \vbox\bgroup}%
    \AtEndDocument
     {\egroup       
      {\color{blue}\vrule width \EX@rulewidth}%
      \kern-\EX@rulewidth \egroup}%   
}


\SetupMarginLines


\endinput

