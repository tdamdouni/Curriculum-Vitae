 Content
---------

    1) About the template
    2) Quick introduction
    3) Hints

Note: This is not a tutorial how to use LaTeX!



 1) About the template
-----------------------

This template is thought to be easy usable and not changed much,
except of some parameters. After accomplishing that, you are free to 
use the files in the designated content folder. It was developed to 
be used for the lecture "Gesellschaftliche Aspekte der 
Informationstechnologie" at the Technical University of Graz.

NOTE: If you decide to write in English there will be no German
piece of text printed else title, abstract and keywords are printed
in both languages.



 2) Quick introduction
-----------------------

During writing your document, you may wish to compile quickly ad watch
overfull boxes. Therefor you always will be well advised to work in 
draft mode.
Use 
  \documentclass[a4paper, 11pt, fleqn, parskip, draft]{scrartcl}
instead of
  \documentclass[a4paper, 11pt, fleqn, parskip]{scrartcl}

The 
  \newcommand{\isDraft} {true}
indicates only the Template version, at the first page of the 
template and has to be turned off.


According to the language you wish to use uncomment the right package:
  \usepackage[ngerman] {babel}
  \usepackage[english] {babel}



Following variables also have to be corrected:
  \renewcommand{\date}       {GAdI SS 2008}      % printed at the bottom right of every page
  \newcommand{\Author}       {Max Mustermann}    % author details
  \newcommand{\AuthorMatnum} {0123456}           % author's matricula number
  \newcommand{\lang}         {ger}               % language (ger|eng)
  \newcommand{\toc}          {false}             % weather or not print table of contents
  \newcommand{\tof}          {false}             % weather or not print table of figures



 3) Hints
-----------------------

Sometimes you can get line wrapping troubles. Words are printed across
the right border. With sloppy you can prevent overfull boxes but words
can may have more distance from each other. Per default is id turned off.
  %\sloppy                 % less fussy line breaking and 

If you need other pagenumbering change this:
  \pagenumbering{arabic}   % arabic | Roman | roman | Alph | alph

If you want cross references through your document uncomment that package:
  %\usepackage{hyperref}

