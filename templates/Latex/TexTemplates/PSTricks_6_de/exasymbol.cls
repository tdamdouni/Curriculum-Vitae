%
% $Id: exasymbol.cls 307 2010-04-28 13:01:36Z herbert $
%
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
\LoadClass[10pt]{article}
\RequirePackage{DEexa}
\setlength\tabcolsep{4pt}
\def\Lcs#1{\texttt{\small\textbackslash#1}}
\def\mathsymbol#1{$\csname#1\endcsname $ & \Lcs{#1} & }
\def\mathSymbol#1{$ \csname#1\endcsname $ & \Lcs{#1} 
    &  $ \csname big#1\endcsname $ & \Lcs{big#1} &}
\let\StartShownPreambleCommands\relax
\let\StopShownPreambleCommands\relax

% ignore second documentclass command for display in book:

\renewcommand\documentclass[2][]{}

\endinput

