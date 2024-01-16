\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{rapport-dve-ups}[2018/09/12]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions\relax

\LoadClass[notitlepage]{report}

\setcounter{secnumdepth}{3}
\setcounter{tocdepth}{3}


\RequirePackage[a4paper,margin=2cm]{geometry} % définit le format de la page

\RequirePackage[french]{babel}  % Pour une typographie «à la Française»
\AtBeginDocument{\renewcommand\labelitemi{\textbullet}}

\renewcommand{\thechapter}{\Roman{chapter}}

\RequirePackage{varwidth}

\def\@makechapterhead#1{{\parindent \z@ \raggedright \normalfont \LARGE \bfseries
	\framebox[\linewidth][c]{\begin{varwidth}{.95\linewidth}\interlinepenalty\@M
		\ifnum \c@secnumdepth >\m@ne \thechapter \space --\space \fi
    #1\par\nobreak
		\end{varwidth}}
		\vskip 40\p@ }}

\def\@makeschapterhead#1{{\parindent \z@ \raggedright \normalfont \LARGE \bfseries
	\framebox[\linewidth][c]{\begin{varwidth}{.95\linewidth}\interlinepenalty\@M    
    #1\par\nobreak
		\end{varwidth}}
		\vskip 40\p@ }}

\def\@maketitle{\newpage \null \vskip 2em \begin{center}%
	\let \footnote \thanks
	{\normalfont \LARGE \bfseries \@title \par}%
	\vskip 1.5em%
	{\large \bfseries \lineskip .5em \begin{tabular}[t]{c} \@author \end{tabular}\par}%
	\vskip 1em {\large \@date}%
	\vskip 2em \raisebox{-.9cm}{\includegraphics[height=3cm]{logo_UPS.png}} \hskip2em {\Large\sffamily UE Management de projet}
  \end{center} \par \vskip 1.5em}

\renewenvironment{abstract}
	{\center{\bfseries \abstractname\vspace{-\topsep}}\endcenter\quotation}
	{\endquotation}

\newenvironment{motsclefs}
	{\begin{center}{\bfseries Mots-clefs\vspace{-\topsep}}\end{center}\quotation}
	{\endquotation}

\RequirePackage{soul,color}
\newcommand{\surligne}[2][yellow]{\sethlcolor{#1}\hl{#2}}

\renewcommand{\emph}[1]{\textbf{#1}}

% Modification de l'environnement de bibliographie, pour qu'il apparaisse en table des matières
\renewenvironment{thebibliography}[1]
	{\chapter{\bibname}\@mkboth{\MakeUppercase\bibname}{\MakeUppercase\bibname}%
		\list{\@biblabel{\@arabic\c@enumiv}}{\settowidth\labelwidth{\@biblabel{#1}}%
			\leftmargin\labelwidth \advance\leftmargin\labelsep
			\@openbib@code\usecounter{enumiv}\let\p@enumiv\@empty
			\renewcommand\theenumiv{\@arabic\c@enumiv}}%
		\sloppy \clubpenalty4000 \@clubpenalty \clubpenalty
		\widowpenalty4000\sfcode`\.\@m}
	{\def\@noitemerr{\@latex@warning{Empty `thebibliography' environment}}\endlist}

