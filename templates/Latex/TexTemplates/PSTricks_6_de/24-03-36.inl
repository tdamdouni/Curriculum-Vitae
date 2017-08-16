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
\begin{pspicture}(3,2)
  \pnode(0.5,1){A}\pnode(2.5,1){B}\pnode(1.5,0){C}
  \agc(A)(B)(C){AGC}{fillstyle=solid,fillcolor=yellow}
\end{pspicture}
\end{document}
