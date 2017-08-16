\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{my_cv}[6/6/2013 custom CV class]
\LoadClass{article}
\RequirePackage{titlesec}


\titleformat{\section}         % Customise the \section command 
  {\Large\scshape\raggedright} % Make the \section headers large (\Large),
                               % small capitals (\scshape) and left aligned (\raggedright)
  {}{0em}                      % Can be used to give a prefix to all sections, like 'Section ...'
  {}                           % Can be used to insert code before the heading
  [\titlerule]                 % Inserts a horizontal line after the heading
  
  \titleformat{\subsection}
  {\large\scshape\raggedright}
  {}{0em}
  {}
  
  \newcommand{\datedsection}[2]{ %
  \section[#1]{#1 \hfill #2}%
}
\newcommand{\datedsubsection}[2]{ %
  \subsection[#1]{#1 \hfill #2}%
}
\newcommand{\name}[1]{
  \centerline{\Huge{#1}}
}

\newcommand{\contact}[5]{
    #1 {\large\textperiodcentered} #2 {\large\textperiodcentered} #3
    {\Large} #4 \ {\Large} #5
}

\newcommand{\longcontact}[5]{
    \center{#1 \hfill {\large\textperiodcentered} \hfill #2 \hfill {\large\textperiodcentered} \hfill #3}
    \center{ {\Large} #4 \hfill {\Large} #5}
}

\newcommand{\workitems}[3]{
    \begin{itemize}
    \item #1
    \item #2
    \item #3
    \end{itemize}
}