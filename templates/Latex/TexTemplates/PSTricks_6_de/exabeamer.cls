%
% $Id: exabeamer.cls 162 2009-12-05 20:32:34Z herbert $
%
%%
%% Das LaTeX Buch
%%
%% Example ``beamer like'' class for use with the book examples.
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
\RequirePackage{beamerbasercs}
\RequirePackage{beamerbaseoptions}
\DeclareOptionBeamer*{\PassOptionsToClass{\CurrentOption}{beamer}}
\ProcessOptionsBeamer\relax
\LoadClass{beamer}
\RequirePackage{DEexa}

\endinput

\AtBeginDocument{
\ifx\selectcolormodel\@undefined
\else
  \selectcolormodel{cmyk}
\fi
\special{ps:
    /setcmykcolor { exch 0.11 mul add
                    exch 0.59 mul add
                    exch 0.3 mul add
                    dup 1 gt { pop 1 }  if neg 1 add setgray } def
    /setrgbcolor { 0.11 mul
                   exch 0.59 mul add
                   exch 0.3 mul add setgray } def
    /sethsbcolor { /b exch def /s exch def 6 mul dup cvi dup /i exch def sub /f exch def
                   /F [[0 1 f sub 1][f 0 1][1 0 1 f sub][1 f 0][1 f sub 1 0][0 1 f][0 1 1]] def
                   F i get { s mul neg 1 add b mul} forall
                   0.11 mul
                   exch 0.59 mul add
                   exch 0.3 mul add setgray } def
  }
}


