\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{resume}[2025/05/05 Custom Resume Class]

\LoadClass[a4paper,10pt]{article}

% Basic packages
\RequirePackage[margin=1in]{geometry}
\RequirePackage{titlesec}
\RequirePackage{enumitem}
\RequirePackage{hyperref}
\RequirePackage{parskip}
\RequirePackage{xcolor}
\RequirePackage{svg}
\RequirePackage{ifthen}
\RequirePackage{fontspec}
\RequirePackage{xifthen}
\RequirePackage{xparse}
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{multicol}
\RequirePackage{fancyhdr}
\RequirePackage{lastpage}




% Section formatting
\titleformat{\section}{\large\bfseries}{}{0em}{}[\titlerule]
% \renewcommand{\familydefault}{\ttdefault}  % use monospaced font as default
% \renewcommand{\familydefault}{\sfdefault}
\hypersetup{
    colorlinks,
    linkcolor={red!50!black},
    citecolor={blue!50!black},
    urlcolor={black!80!black}
}
\definecolor{commentcolor}{rgb}{0, 0.5, 0}
\definecolor{light}{rgb}{0.5, 0.5, 0.5}
\def\light#1{{\color{light}#1}}
\definecolor{lightb}{rgb}{0.25, 0.25, 0.25}
\def\lightb#1{{\color{lightb}#1}}

% Footer formatting
\pagestyle{fancy}
\fancyhf{} % clears the header and footer
\fancyhead{}
\renewcommand{\headrulewidth}{0pt} % removes the unwanted header rule
\fancyfoot[C]{\thepage\ of \pageref*{LastPage}}

% === User Variables ===
\newcommand{\name}{Your Name}
\newcommand{\email}{your@email.com}
\newcommand{\phone}{(000) 000-0000}
\newcommand{\roletitle}{Software Engineer}
\newcommand{\location}{ChocolateVille}
\newcommand{\linkedin}{}
\newcommand{\github}{myaccountname}
\newcommand{\languages}{}
\newcommand{\profilepic}{headshot.png}
\newcommand{\iconsize}{12pt} % Optional image path
% === Header Command ===
\usepackage{graphicx}
\newcommand{\makeheader}{
  \vspace*{-2.5cm}
  \section*{\texttt{\textcolor{commentcolor}{/* Brief */}} \hfill \includegraphics[height=\iconsize]{icons/briefcase.png}}
  \begin{center}
    \ifx\profilepic\empty
      {\LARGE \textbf{\name}} \\
    \else
      \begin{minipage}{0.15\textwidth}
        \includegraphics[width=50pt,clip,keepaspectratio]{\profilepic}
      \end{minipage}
      \hfill
      \begin{minipage}{0.8\textwidth}
        {\LARGE \textbf{\name}} 
        
        \vspace{0.5em}
        {\includegraphics[width=\iconsize]{icons/information.png} \roletitle \ from \includegraphics[width=\iconsize]{icons/placeholder.png} \location} \\
        {
          \includegraphics[width=\iconsize]{icons/email.png} \href{mailto:\email}{\email} $\cdot$
          \includegraphics[width=\iconsize]{icons/telephone.png} \href{tel:\phone}{\phone}
          \ifthenelse{\equal{\github}{}}{}{$\cdot$ \includegraphics[width=\iconsize]{icons/github.png} \href{https://github.com/\github}{\github}}
          \ifthenelse{\equal{\linkedin}{}}{\\}{$\cdot$ {\includegraphics[width=\iconsize]{icons/linkedin.png} \href{\linkedin}{linkedIn}\\}}
        }
        \ifthenelse{\equal{\languages}{}}{}{\includegraphics[width=\iconsize]{icons/language.png} \languages}
        
      \end{minipage}
    \fi
  \end{center}
}
\newcommand{\makeeducation}{\section*{\texttt{\textcolor{commentcolor}{/* Education */}} \hfill \includegraphics[height=\iconsize]{icons/mortarboard.png}}}
\newcommand{\makeexperience}{\section*{\texttt{\textcolor{commentcolor}{/* Experience */}} \hfill \includegraphics[height=\iconsize]{icons/building.png}}}
\newcommand{\makeprogramming}{\section*{\texttt{\textcolor{commentcolor}{/* Programming \& Markdown Languages */}} \hfill \includegraphics[height=\iconsize]{icons/laptop.png}}}
\newcommand{\makeconcecpts}{\section*{\texttt{\textcolor{commentcolor}{/* Relevant Concepts and Tools */}} \hfill \includegraphics[height=\iconsize]{icons/like.png}}}
\newcommand{\makevolunteer}{\section*{\texttt{\textcolor{commentcolor}{/* Volunteer Experience */}} \hfill \includegraphics[height=\iconsize]{icons/certificate.png}}}


% Education command
\newcommand{\educationentry}[6]{
  % \ifthenelse{\equal{#6}{university}}{
  %   \includegraphics[height=\iconsize]{icons/mortarboard.png}
  % }{
  %   \includegraphics[height=\iconsize]{icons/certificate.png}
  % }
  \hspace{4pt}
  \textbf{#1} \hfill \light{#2}\\
  #3 \hfill \light{#4}
  \vspace*{-0.15cm}
  \ifthenelse{\isempty{#5}}{}{\begin{itemize}[noitemsep,leftmargin=*]
    #5
  \end{itemize}}
}


% Experience command
\newcommand{\experienceentry}[5]{
  % \includegraphics[height=\iconsize]{icons/building.png}
  \textbf{#1} \\
  \lightb{\textit{#2}}, #3 \hfill  \light{#4}
  \vspace*{-0.15cm}
  \ifthenelse{\isempty{#3}}{}{\begin{itemize}[noitemsep,leftmargin=*]
    #5
  \end{itemize}}
}
