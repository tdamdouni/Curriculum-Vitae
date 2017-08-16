%%
%% Wiss, 1st edition
%%
%% LaTeX für wissenschaftliche Arbeiten
%%
%% Copyright (C) 2009 Herbert Voss
%%
%% It may be distributed and/or modified under the conditions
%% of the LaTeX Project Public License, either version 1.3
%% of this license or (at your option) any later version.
%%
%% See http://www.latex-project.org/lppl.txt for details.
%%
%
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{scrreprt}}
\ProcessOptions\relax
\LoadClass[twoside,openany,10pt]{scrreprt}

\RequirePackage{DEexa}

\RequirePackage[ngerman]{babel}
    
\let\StartShownPreambleCommands\relax
\let\StopShownPreambleCommands\relax
\makeatletter
%\let\ps@plain\ps@empty
\makeatother
\renewcommand\documentclass[2][]{}
\endinput

\AtBeginDocument{
\ifx\color\@undefined
\else
  \definecolor{blue}{cmyk}{1,0.56,0,0}
  \definecolor{red}{cmyk}{0,0,0,.3}
  \definecolor{green}{cmyk}{0,0,0,.2}
  \definecolor{yellow}{cmyk}{0,0,0,.1}
\fi
}


