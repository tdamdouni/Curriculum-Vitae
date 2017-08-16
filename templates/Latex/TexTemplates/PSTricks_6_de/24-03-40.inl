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
\begin{pspicture}(5,3)
  \pnode(0,2.5){A}
  \pnode(0,0.5){B}
  \pnode(4,2.5){C}
  \pnode(4,0.5){D}
  \optoCoupler(A)(B)(C)(D){$OC$}
\end{pspicture}
\end{document}
