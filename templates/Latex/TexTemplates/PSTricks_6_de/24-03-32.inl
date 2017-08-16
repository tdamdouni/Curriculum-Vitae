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
\begin{pspicture}(5,2)
  \pnode(0,2){A}
  \pnode(5,2){B}
  \pnode(0,0){C}
  \Tswitch(A)(B)(C){$K$}
\end{pspicture}
\end{document}
