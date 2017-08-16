%% 
%%  Ein Beispiel der DANTE-Edition
%% 
%% 
%%  Copyright (C) 2008 Herbert Voss
%% 
%%  It may be distributed and/or modified under the conditions
%%  of the LaTeX Project Public License, either version 1.3
%%  of this license or (at your option) any later version.
%% 
%%  See http://www.latex-project.org/lppl.txt for details.
%% 
%% 
%% ==== 
% Show page(s) 1
%% 
\documentclass[]{exaarticle}
\pagestyle{empty}
\setlength\textwidth{190.324pt}
\StartShownPreambleCommands
\usepackage{pst-circ}
\StopShownPreambleCommands
\begin{document}
\begin{pspicture}(4,2)
  \pnode(0,1.5){A}
  \pnode(0,0.5){B}
  \pnode(3,1.5){C}
  \pnode(3,0.5){D}
  \quadripole(A)(B)(C)(D){Text}
\end{pspicture}
\end{document}
