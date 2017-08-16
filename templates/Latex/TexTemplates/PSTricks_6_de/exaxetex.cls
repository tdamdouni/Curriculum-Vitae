%%
%% Das LaTeX Buch
%%
%% Example class for use with the book examples.
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
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass[twoside,10pt]{article}

\let\StartShownPreambleCommands\relax
\let\StopShownPreambleCommands\relax
% ignore second documentclass command for display in book:
\renewcommand\documentclass[2][]{}

\let\ps@origplain\ps@plain
\let\ps@plain\ps@empty % this class doesn't produces page numbers
                       % since this would make examples too big
                       % but if necessary there is origplain

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


