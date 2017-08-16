% UTF8
%
% $Id: bspdvdcoll.cls 162 2009-12-05 20:32:34Z herbert $
%
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{dvdcoll}}
\ProcessOptions\relax
\LoadClass{dvdcoll}
\RequirePackage[utf8x]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage{xcolor}
\RequirePackage{libertine}
\RequirePackage{babel}
\setlength\parindent{0pt}
\setcounter{page}{1}

\let\StartShownPreambleCommands\relax
\let\StopShownPreambleCommands\relax
\let\DocStart\relax
\let\DocEnde\relax
% ignore second documentclass command for display in book:
\renewcommand\documentclass[2][]{}

\endinput
