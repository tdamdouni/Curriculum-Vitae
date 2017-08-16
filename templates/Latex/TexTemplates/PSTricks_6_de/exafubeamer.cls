%
% $Id: ttctfubeamer.cls 121 2009-07-16 07:30:44Z herbert $
%
%%
%%
%% Praesentationen, 1st edition
%%
%% Prasentationen mit LaTeX
%%
%% Copyright (C) 2009 Voss
%%
%%
%% It may be distributed and/or modified under the conditions
%% of the LaTeX Project Public License, either version 1.3
%% of this license or (at your option) any later version.
%%
%% See http://www.latex-project.org/lppl.txt for details.
%%
%
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{FUbeamer}}
\ProcessOptions\relax
\LoadClass[xcolor=table]{FUbeamer}

\RequirePackage[T1]{fontenc}
\usepackage{lmodern}

\let\StartShownPreambleCommands\relax
\let\StopShownPreambleCommands\relax

% ignore second documentclass command for display in book:

\renewcommand\documentclass[2][]{}


\endinput

