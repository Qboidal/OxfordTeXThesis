% OxfordTeXThesis (formerly ociamthesis, but renamed as there is very little relation to the Oxford Centre for Industrial and Applied Mathematics group nowadays). 
% 
% Originally by Keith A. Gillow (gillow@maths.ox.ac.uk), 1997
% Modified by Sam Evans (sam@samuelevansresearch.org), 2007
% Modified by John McManigle (john@oxfordechoes.com), 2015
% Modified by Qianyi Sun (inbox4sun@gmail.com), 2025
%
% This version Copyright (c) 2025 Qianyi Sun
%
% Broad permissions are granted to use, modify, and distribute this software
% as specified in the MIT License included in this distribution's LICENSE file.
%
%-------------------------- identification ---------------------
\NeedsTeXFormat{LaTeX2e} %This is the current version of TeX in 2025, as of 1994.
\ProvidesClass{OxfordTeXThesis}[2024/12/26 Oxford thesis class]
%-------------------------- initial code -----------------------

% JEM: Defaults to one-side, but passing 'twoside' should set everything up for that
\LoadClass[openright,12pt]{report}

\newif\ifmc@nobind
\mc@nobindfalse

\DeclareOption{nobind}{\mc@nobindtrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions\relax

\setlength{\parskip}{0pt plus 1pt}
\setlength{\parfillskip}{0pt plus .7\textwidth}

% JEM: Lengths for single spacing (ie separate abstract, captions), front matter (abstract,   acknowledgements, table of contents, etc), and main body text.
\newlength{\singlebaselineskip}
\newlength{\frontmatterbaselineskip}
\newlength{\textbaselineskip}

\setlength{\singlebaselineskip}{\baselineskip}
\setlength{\frontmatterbaselineskip}{17pt plus1pt minus1pt}
\setlength{\textbaselineskip}{22pt plus2pt}

\newcommand{\submittedtext}{{A thesis submitted for the degree of}}
\RequirePackage{varwidth}
\newcommand{\originalitytext}{%
   \rule[-2mm]{1pt}{7mm}\hspace{-1pt}%
   \rule[-2mm]{7mm}{1pt}\hspace{-1pt}%
   \rule[-2mm]{1pt}{7mm}\hspace{-7mm}%
   \rule[5mm]{7mm}{1pt}\hspace{1em}%
   \begin{varwidth}{\textwidth}I hereby certify that this is entirely\\my own work unless otherwise stated.\end{varwidth}}

%
% DECLARATIONS
%
% These macros are used to declare arguments needed for the construction of the title page and other preamble.

% The year and term the degree will be officially conferred
\def\degreedate#1{\gdef\@degreedate{#1}}
% The full (unabbreviated) name of the degree
\def\degree#1{\gdef\@degree{#1}}
% The name of your Oxford college (eg Christ Church, Pembroke)
\def\college#1{\gdef\@college{#1}}
% Your candidate number (ie for master's submissions)
\def\candidateno#1{\gdef\@candidateno{#1}}
% Your word count (for master's submissions)
\def\wordcount#1{\gdef\@wordcount{#1}}
% QS: Your supervisor(s)
\def\supervisors#1{\gdef\@supervisors{#1}}


\newif\ifmasterssubmission
% adds candidate number and word count in place of name and college
\masterssubmissionfalse


%
% CRESTS
%

\def\crest{{\includegraphics{figures/> Crests and coats of arms/beltcrest.pdf}}}


%
% Define text area of page and margin offsets
%

\ifmc@nobind
\RequirePackage[includehead,hmargin={3.1cm, 3.1cm}, vmargin={2.5cm,2.7cm}, headsep=.8cm,footskip=1.2cm]{geometry}
\else
\RequirePackage[includehead,hmargin={3.6cm, 2.6cm}, vmargin={2.5cm,2.7cm}, headsep=.8cm,footskip=1.2cm]{geometry}
\fi

\RequirePackage{xcolor}
\RequirePackage{graphicx} 

\RequirePackage{fancyhdr}
% https://eu.mirrors.cicku.me/ctan/macros/latex/contrib/fancyhdr/fancyhdr.pdf
\setlength{\headheight}{15pt}
\fancyhf{} % clear the header and footers
\pagestyle{fancy}
\renewcommand{\chaptermark}[1]{\markboth{\thechapter. #1}{\thechapter. #1}}
\renewcommand{\sectionmark}[1]{\markright{\thesection. #1}} 
\renewcommand{\headrulewidth}{0pt}
\fancyhead[LO]{\emph{\leftmark}}
%% Adds page numbers to general pages for twosidw
% \fancyhead[RE]{\emph{\rightmark}} 
% \fancyhead[RO,LE]{\emph{\thepage}}
% \fancyhead[RE]{\emph{\rightmark}} 
\fancyfoot[C]{\emph{\thepage}}

\fancypagestyle{plain}{\fancyhf{}\fancyfoot[C]{\emph{\thepage}}}

% JEM fix header on cleared pages for openright
\def\cleardoublepage{\clearpage\if@twoside \ifodd\c@page\else
   \hbox{}
   \fancyhead[RE,LO]{}
   \newpage
   \if@twocolumn\hbox{}\newpage
   \fi
   \fancyhead[LO]{\emph{\leftmark}} 
   \fancyhead[RE]{\emph{\rightmark}} 
   \fi\fi}


\RequirePackage{microtype}
\RequirePackage{nicefrac}
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{textcomp}

\RequirePackage{longtable} 
	% Allows tables to span multiple pages (this package must be called before hyperref)

\RequirePackage[font=small,labelfont=bf]{caption} 
	% Nicer captions

\RequirePackage{multicol,multirow,array} 
	% Used to make multiple columns for the indices and for creating columns that span multiple rows in tables

\RequirePackage{rotating} 
	% To allow tables in landscape mode

\RequirePackage{booktabs} 
	% For better looking tables

\RequirePackage{pdfpages} 
	% Allows multi-page pdfs to be inserted as graphics

\RequirePackage{xfrac}

%\RequirePackage{enumerate} 
	% Allows different numbering styles for Lists
	% to use:
	% \begin{enumerate}[x] 
		% \item text 
	% \end{enumerate} 
	% where x is:
	% A	uppercase letters (as produced by \Alph)
	% a	lowercase letters (as produced by \alph)
	% I	uppercase roman numerals (as produced by \Roman)
	% i	lowercase roman numerals (as produced by \roman)
	% 1	arabic numbers (as produced by \arabic)
	
% JEM the following package allows changing spacing in lists (for acknowledgements)
\RequirePackage{enumitem}

% JEM the following allows table columns aligned by decimal point
\RequirePackage{dcolumn}
\newcolumntype{d}[3]{D{.}{\cdot}{#1} }

\RequirePackage{appendix} 
	% For helping format appendicies
\RequirePackage{notoccite} 
	% To format the bibliography	


% RJS PACKAGES
\RequirePackage{siunitx} % Good units

\RequirePackage{adjustbox} % QS: allows changing the size of floats
\RequirePackage{caption} % See https://ctan.org/pkg/caption?lang=en
\RequirePackage{subcaption} % https://www.overleaf.com/learn/latex/How_to_Write_a_Thesis_in_LaTeX_(Part_3)%3A_Figures%2C_Subfigures_and_Tables
\RequirePackage{booktabs} % Better tables

\RequirePackage{placeins} % https://www.reddit.com/r/LaTeX/comments/u7llg5/how_to_keep_figure_within_a_section/ A really useful way to force sections and subsections to appear underneath a figure physically using the \FloatBarrier after a figure environment.

\RequirePackage[inkscapelatex=false]{svg} % Allow for SVGs to be used which is very useful in conjunction with Inkscape. https://medium.com/@aaron_imn/a-quick-guide-to-use-scalable-vector-graphics-svg-on-overleaf-ca69448f7177. Useful as Scalable Vector Graphics & Inkscape is very useful for crisp figures you can make export as in MATLAB and make your own figures in Inkscape and edit them in there.

\DeclareGraphicsExtensions{.png, .pdf} % https://www.overleaf.com/learn/latex/Inserting_Images. QS: this allows TeX to prefer one file type over another while compiling when graphics without a file extension are included, e.g. if two files called Image.png and Image.pdf exist in the same folder, and \includegraphic{Image} is called, with \DeclareGraphicsExtensions{.png, .pdf} is called, the .png will be loaded, not the .pdf. This makes compiling faster when drafing, and, hence, .pdf should be ahead of .png when producing the document. 

\RequirePackage{dirtytalk} % Nice Quotation Marks. I use \say{This is the quote}, and it does nicely formatted quotation marks for it, which otherwise doesn't look as good as the standard "".

\RequirePackage{pifont}% Extra fonts. 

\RequirePackage{listings}% Extra colours for highlighting https://www.overleaf.com/learn/latex/Code_listing
\RequirePackage{color, colortbl}
\definecolor{LightCyan}{rgb}{0.88,1,1}

\RequirePackage{spreadtab} % Spreadsheet functionality. https://tex.stackexchange.com/questions/3851/how-can-i-automatically-calculate-sums-in-a-latex-table
\RequirePackage{pgf-pie}

\RequirePackage{pdflscape} % Makes whole page landscape which is really helpful with big wide figures

\RequirePackage{silence} % Below will turn off the annoying warning about a page only being floats.
\WarningFilter*{latex}{Text page \thepage\space contains only floats}
%%     Turns off the underfill notifications
\hbadness=99999  % or any number >=10000
\WarningsOff[everypage] % QS: This turns off the everypage warning, which is found in the background package. 

\RequirePackage{chemformula} % Used for doing chemical formulae, could also use mhchem

 \setlength {\marginparwidth }{2cm} % QS: allows todonotes to fit properly.
\RequirePackage[colorinlistoftodos]{todonotes} % Adds inline or margin comments to your PDF. From https://www.overleaf.com/blog/619-tip-of-the-week-add-inline-or-margin-comments-to-your-pdf. Example \todo[size=\scriptsize, color=red!40]{Original thesis said do not reprint.}

%New packages from QS
\RequirePackage{background} % Allows text to appear in the background, used for its 'Draft' watermark.
\RequirePackage{lipsum} % Provides good exemplar text. 
\RequirePackage{setspace} % Provides a great set of commands for changing line spacing.
\RequirePackage{layout} % Helps with geometry with a useful diagram. 
\RequirePackage{lastpage} % Gives the number of pages.
\RequirePackage{verbatim} % Allows commands to be displayed verbatim in TeX
\RequirePackage{fancyvrb} % Makes the above look pretty. 

\RequirePackage[colorlinks=false,pdfpagelabels]{hyperref} 
	% for linking between references, figures, TOC, etc in the pdf document, RJS: https://www.overleaf.com/learn/latex/Hyperlinks. % QS: many packages must come before hyperref https://latexguide.org/book-examples/hyperref/.

\RequirePackage[nohints,tight]{minitoc} 
	\setcounter{minitocdepth}{2} 
	% Generates mini tables of contents per chapter

\RequirePackage{cleveref} % RJS: Clever Hyperlink Referencing. Makes it automatically add in "Chapter 3", "Table 2", "Figure 5a" depending on the environment that the reference label is used with. It is essential for making a thesis nicely referenced.

% QS: Both the glossaries-extra and geometry packages are called after hyperref.
    
	
% JEM: The following fixes minitoc to not be multiple-spaced.
\let\oldmtc@verse\mtc@verse
\renewcommand{\mtc@verse}[1]{\oldmtc@verse{#1}\setlength{\baselineskip}{\z@}}

%
% Environments
%

\newcommand{\numberingstyle}{\thispagestyle{empty}} % QS: means \thispagestyle{empty} doesn't need to be called each time. 

% This macro define an environment for front matter that is always single column even in a double-column document.

\newenvironment{alwayssingle}{%
       \@restonecolfalse
       \if@twocolumn\@restonecoltrue\onecolumn
       \else\if@openright\cleardoublepage\else\clearpage\fi
       \fi}%
       {\if@restonecol\twocolumn
       \else\newpage\thispagestyle{empty}\fi}


%define title page layout

\renewcommand{\maketitle}{%
\begin{alwayssingle}\null
    \renewcommand{\footnotesize}{\small}
    \renewcommand{\footnoterule}{\relax}
    \numberingstyle
\ifmasterssubmission
  \begin{center}
  \vspace*{-3ex}
    { \LARGE {\bfseries {\@title}} \par}
{\large \vspace*{20mm} {\crest \par} \vspace*{20mm}}
    {{\Large Candidate no.\ \@candidateno} \par}
{\large \vspace*{1ex}
    {Word count: {\@wordcount} \par}
\vspace*{4ex}
    {{\submittedtext} \par}
\vspace*{1ex}
    {\it {\@degree} \par}
\vspace*{6ex}
	{{\originalitytext} \par}
\vspace*{2ex}
    {\@degreedate}}
  \end{center}
\else
  \begin{center}
    { \LARGE {\bfseries {\@title}} \par}
{\large \vspace*{25mm} {\crest \par} \vspace*{25mm}}
    {{\Large \@author} \par}
{\large \vspace*{1ex}
    {{\@college} \par}
\vspace*{1ex}
    {University of Oxford \par}
\vspace*{20mm}
    {{\submittedtext} \par}
\vspace*{1ex}
    {\it {\@degree} \par}
\vspace*{3ex}
    {\@degreedate}\par}
  \vspace*{6ex}
    {Supervised by \@supervisors}
  \end{center}
\fi
  \vfill\null
\end{alwayssingle}}



% DEDICATION
%
% The dedication environment makes sure the dedication gets its own page and is set out in verse format.

\newenvironment{dedication}
{\begin{alwayssingle}
  \numberingstyle
  \vspace*{\fill} \begin{center}}
{\end{center}\vspace*{\fill}\vspace*{\fill} \end{alwayssingle}}


% ACKNOWLEDGEMENTS
%
% The acknowledgements environment puts a large, bold, centered "Acknowledgements" label at the top of the page. The acknowledgements themselves appear in a quote environment, i.e. tabbed in at both sides, and on its own page.

\newenvironment{acknowledgements}%
{   \begin{alwayssingle}\chapter*{Acknowledgements}
    \numberingstyle
	\pagestyle{empty}
	\setlength{\baselineskip}{\frontmatterbaselineskip}
}
{\end{alwayssingle}}


%ABSTRACT
%
%The abstract environment puts a large, bold, centered "Abstract" label at
%the top of the page. The abstract itself appears in a quote environment,
%i.e. tabbed in at both sides, and on its own page.

\renewenvironment{abstract}%
{   \begin{alwayssingle}\chapter*{Abstract}
    \numberingstyle
    \pagestyle{empty}
   \setlength{\baselineskip}{\frontmatterbaselineskip}}
{\end{alwayssingle}}

%The abstractseparate environment is for running of a page with the abstract
%on including title and author etc as required to be handed in separately

\newenvironment{abstractseparate} {\newgeometry{margin=3.3cm}\thispagestyle{empty}\begin{alwayssingle}
 \begin{center}
    {\Large \bfseries \@title \par}
\ifmasterssubmission
    {{\large \vspace*{3ex} Candidate no.\ \@candidateno} \par}
\else
    {{\large \vspace*{2ex} \@author} \par}
\fi
{\large \vspace*{1ex}
\ifmasterssubmission
    {Thesis word count: {\@wordcount} \par}
\else
    {{\@college} \par}
    {University of Oxford \par}
\fi
\vspace*{1ex}
    {{\it \submittedtext} \par}
    {\it {\@degree} \par}
\vspace*{2ex}
    {\@degreedate} \par}
\vfill
  {\Large \bfseries  Abstract}
  \end{center}
\vspace{1ex}
   \setlength{\baselineskip}{\z@}}
{\vfill\end{alwayssingle}\restoregeometry}


%ROMANPAGES
%
% The romanpages environment set the page numbering to lowercase roman one
% for the contents and figures lists. It also resets
% page-numbering for the remainder of the dissertation (arabic, starting at 1).
%
% Edited by JEM

\newenvironment{romanpages}
{\cleardoublepage\setlength{\baselineskip}{\frontmatterbaselineskip}\setcounter{page}{1}\renewcommand{\thepage}{\roman{page}}}
{\cleardoublepage\setcounter{page}{1}\renewcommand{\thepage}{\arabic{page}}}


%Figure placement on page
%
%This is to help prevent too many figures on their own pages.  I got it from:
% http://dcwww.camd.dtu.dk/~schiotz/comp/LatexTips/LatexTips.html#captfont

\renewcommand{\topfraction}{0.85}
\renewcommand{\textfraction}{0.1}
\renewcommand{\floatpagefraction}{0.75}


% JEM: VERSE, QUOTATION, and QUOTE must be single-spaced.
% These rename the internal commands for the \begin{...} and
% \end{...} environment commands.
\let\@ldquote=\quote
\let\@ldendquote=\endquote
\renewenvironment{quote}
   {\@ldquote\setlength{\baselineskip}{\singlebaselineskip}}
   {\@ldendquote}

\let\@ldqttn=\quotation
\let\@ldendqttn=\endquotation
\renewenvironment{quotation}
   {\@ldqttn\setlength{\baselineskip}{\singlebaselineskip}}
   {\@ldendqttn}

\let\@ldverse=\verse
\let\@ldendverse=\endverse
\renewenvironment{verse}
   {\@ldverse\setlength{\baselineskip}{\singlebaselineskip}}
   {\@ldendverse}

% JEM: Stuff for List of Abbreviations (or Glossary or other list)
% \RequirePackage{calc}
% \newcommand{\t@cfill}{\cleaders\hbox{$\m@th \mkern\@dotsep mu . \mkern\@dotsep mu$}\hfill}
% \newcommand{\abbrl@bel}[1]{\makebox[\labelwidth][l]{\textbf{#1}\ \t@cfill}}
% \newenvironment{mclistof}[2]{%
%    \chapter*{#1}%
%    \addcontentsline{toc}{chapter}{#1}
%    \begin{list}{}%
%    {\renewcommand{\makelabel}{\abbrl@bel}%
%     \setlength{\labelwidth}{#2}%
%     \setlength{\leftmargin}{\labelwidth+\labelsep}%
%     \setlength{\itemsep}{0pt}%
%     \markboth{#1}{#1}%
%    }}
%    {\end{list}\mtcaddchapter}
% QS: this is now obsolete with the glossaries-extra package, but remains for backwards compatibility. 

\RequirePackage[grey,utopia]{quotchap} 
	% To put nice quotes at the beginning of the chapters

\RequirePackage[nottoc]{tocbibind}
	% Used for inserting the Bibliography, List of Figures, indices, etc into the table of contents.

% JEM: Allow flexible spacing after figures, to reduce other stretching
\setlength{\textfloatsep}{20pt plus15pt minus4pt}

% JEM: Fix paragraph spacing within quotes for multi-par quotes
\renewenvironment{savequote}[1][10cm]{%
\begin{lrbox}{\@quotebox}
\begin{minipage}[t]{#1}\footnotesize\slshape%
\setlength{\parskip}{6px}}{%
\unskip\end{minipage}\end{lrbox}
\global\setbox\@quotebox\copy\@quotebox
\global\let\@printcites\@iprintcites
\ignorespacesafterend}
\renewcommand{\qauthor}[1]{\par
{\raggedleft\upshape #1\qquad\hbox{}\par}\bigskip}

% JEM: All of this is so that headers in these sections aren't uppercase
\let\@ldtoc\tableofcontents
\renewcommand*\tableofcontents{{%
\renewcommand*\MakeUppercase[1]{##1}\@ldtoc}}
\let\@ldlof\listoffigures
\renewcommand*\listoffigures{{%
\renewcommand*\MakeUppercase[1]{##1}\@ldlof}}
\let\@ldlot\listoftables
\renewcommand*\listoftables{{%
\renewcommand*\MakeUppercase[1]{##1}\@ldlot}}
\let\@ldbib\bibliography
\renewcommand*\bibliography[1]{{%
\renewcommand*\MakeUppercase[1]{##1}\@ldbib{#1}}}

% JEM: for crazy multi character set quotes and Unicode and all
\RequirePackage{lmodern}
\RequirePackage[LGR,TS1,T1]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage[british]{babel} % QS: Feel free to add greek, latin, or 'american'
\RequirePackage{csquotes}
\hyphenpenalty=500
\def\longs{{\fontencoding{TS1}\selectfont s}}

% JEM: for highlighting corrections
\newlength{\mccurrentbaselineskip}
\newlength{\mccurrentparskip}
\newlength{\mccurrentparindent}
\newif\ifcorrections
\newif\ifm@csection
\m@csectionfalse
\correctionsfalse

\colorlet{shadecolor}{blue!20}

\RequirePackage{framed}
\OuterFrameSep=-9pt
\newenvironment{mccorrection}
{\ifcorrections\if@nobreak\m@csectiontrue\fi\begin{shaded}\ifm@csection\noindent\ignorespaces\fi\fi}
{\ifcorrections\end{shaded}\m@csectionfalse\ifx\@captype\@undefined\@nobreakfalse\fi\fi}

\RequirePackage{soul}
\sethlcolor{shadecolor}
\newcommand{\mccorrect}[1]{\ifcorrections\hl{#1}\else#1\fi}


% JEM: adjust start-of-chapter spacing
\renewcommand{\chapterheadstartvskip}{\vspace*{40pt}}
\renewcommand{\chapterheadendvskip}{\vspace{30pt}}


% JEM: combine all of the commands you run before appendices start
\newcommand{\startappendices}
  {\appendix\adjustmtc\noappendicestocpagenum\addappheadtotoc\appendixpage}% JEM: Defaults to one-side, but passing 'twoside', e.g. like a book, should set everything up for that




%%% Perhaps obsolete, redundant, unused

% RJS: 
% \RequirePackage{import} % RJS: I recommend using "\input{}" rather than "\import{}" as it works easier with OverLeaf, is less confusing, and is more powerful.
% \RequirePackage{tabularray}
% \RequirePackage{float} % QS: Not hugely necessary unless some other useful 

% \RequirePackage{afterpage} % RJS:  I think this could be redundant as \floatbarrier with \clearpage is a better combination.
% \newcommand\blankpage{%
%     \null
%     \thispagestyle{empty}%
%     \addtocounter{page}{-1}%
%     \newpage}

% QS:
%\RequirePackage{acronym} % QS: contained within glossaries-extra