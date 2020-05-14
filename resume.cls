% resume.cls
% Copyright 2009 Ankur Dave <ankurdave@gmail.com>
%
% Licensed under the CC-GNU GPL version 2.0 or later.
% See http://creativecommons.org/licenses/GPL/2.0
%
% See http://ankurdave.com/tex for more document classes.
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{resume}

\PassOptionsToClass{10pt, letterpaper}{article}
\LoadClassWithOptions{article}

\newcommand{\lineunder}{\vspace{-.7em} \hspace{-21.5em} \hrulefill \\}

% fields that user can set
\makeatletter
	\newcommand{\name}[1]{\def \@name {#1}}
	\newcommand{\addressone}[1]{\def \@addressone {#1}}
	\newcommand{\addresstwo}[1]{\def \@addresstwo {#1}}
	\newcommand{\phone}[1]{\def \@phone {#1}}
	\newcommand{\email}[1]{\def \@email {#1}}
	\newcommand{\website}[1]{\def \@website {#1}}
	\newcommand{\websiteLink}[1]{\def \@websiteLink {#1}}
	\name{}
	\addressone{}
	\addresstwo{}
	\phone{}
	\email{}
	\website{}
	\websiteLink{}
\makeatother

% margins
\usepackage[top=0.5in,bottom=0.5in,left=1in,right=1in]{geometry}

\makeatletter
% hyperlinks and PDF options
\RequirePackage{hyperref}
\hypersetup{
    bookmarks=true,         % show bookmarks bar?
    unicode=false,          % non-Latin characters in Acrobat’s bookmarks
    pdftoolbar=true,        % show Acrobat’s toolbar?
    pdfmenubar=true,        % show Acrobat’s menu?
    pdffitwindow=false,     % window fit to page when opened
    pdfstartview={FitH},    % fits the width of the page to the window
    pdfnewwindow=true,      % links in new window
    colorlinks=true,       % false: boxed links; true: colored links
    linkcolor=black,          % color of internal links
    citecolor=black,        % color of links to bibliography
    filecolor=black,      % color of file links
    urlcolor=black           % color of external links
}
\AtBeginDocument{
\hypersetup{
    pdftitle={\@name 's Resume},    % title
    pdfauthor={\@name},     % author
    pdfsubject={Resume},   % subject of the document
    %% pdfcreator={LaTeX},   % creator of the document
    %% pdfproducer={LaTeX}, % producer of the document
    pdfkeywords={resume} % list of keywords
}
}
\makeatother

% fonts
%% \usepackage{times}
%% \renewcommand{\ttdefault}{cmtt}

% alignment
% (must be before indentation because raggedright clears parindent)
\raggedright

% lists
\usepackage{atbeginend}
\AfterBegin{itemize}{
	\setlength{\itemsep}{-\parskip}
	\addtolength{\itemsep}{3pt}
}

% sections
\makeatletter
\renewcommand{\section}[1]{
	\@startsection
		{section}
		{1}
		{\z@}
		{0em}
		{1em \@minus 1em} % tricks LaTeX into linebreak with no space afterward
		{\textsc}
		*
		{\hspace*{-1.5em} #1}      % TODO: adjust?
	\vspace*{-1.9em} % moves line up: OK because of small caps -- no descenders % TODO: adjust?
	\hspace*{-2.0em} \hrulefill
	\par
}

% job positions
\makeatletter
	\newcommand{\employer}[1]{\def \@employer {#1}}
	\newcommand{\location}[1]{\def \@location {#1}}
	\newcommand{\jobtitle}[1]{\def \@jobtitle {#1}}
	\newcommand{\dates}[1]{\def \@dates {#1}}
	\employer{}
	\jobtitle{}
	\dates{}

	\newenvironment{position}{
		\textbf{\@employer} \hfill \textit{\@location}\\
		\textit{\@jobtitle} \hfill \@dates
		\begin{list}{$\bullet$}{\topsep \z@ \itemsep -.2em}
	}{
		\vspace*{4pt}
		\end{list}
	}
\makeatother

% schools
\makeatletter
	\newcommand{\schoolname}[1]{\def \@schoolname {#1}}
	\newcommand{\gpa}[1]{\def \@gpa {#1}}
	\schoolname{}
	\location{}
	\dates{}
	\gpa{}

	\newenvironment{school}{
		\textbf{\@schoolname} \hfill \textit{\@location}\\
                \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}lr@{}}
                  \begin{minipage}[t]{0.8\textwidth}
		    \begin{list}{$\bullet$}{\topsep \z@ \itemsep -.2em}
	}{
                    \end{list}
                  \end{minipage} & \@dates
		\end{tabular*}
	}
\makeatother

\RequirePackage{multirow}
\RequirePackage{tabularx}

% title
\makeatletter
\def \@maketitle {
	\begin{center}
		\newcommand\T{\rule{0pt}{-2.6ex}}
		\begin{tabularx}{\textwidth}{l >{\centering}X r}
			& \vspace*{-2.5em}\LARGE \scshape \@name &\\
			%% \hline
			\rule{0em}{1.25em} \href{mailto:\@email}{\@email} \T & \href{\@websiteLink}{\@website} & \@addressone \\ % TODO: adjust?
			\@phone & & \@addresstwo
		\end{tabularx}
	\end{center}
}
\makeatother
