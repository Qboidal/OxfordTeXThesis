# OxfordTeXThesis

**OxfordTeXThesis** is a LaTeX template for an Oxford University thesis, originally published on [the Oxford Echoes blog](https://www.oxfordechoes.com/oxford-thesis-template/).


Feel free to submit issues or push requests here, or email directly. Of course, happy thesis-writing!

---
- Originally by Keith A. Gillow (gillow@maths.ox.ac.uk), 1997
- Modified by Sam Evans (sam@samuelevansresearch.org), 2007
- Modified by John McManigle (john@oxfordechoes.com), 2015
- Modified by Robin Scales (robin@scales.me), 2023
- Modified by Qianyi Sun (inbox4sun@gmail.com), 2025

Having been blessed by this template during the writing of my Part II thesis, I have contributed to and cleaned up pieces of the .cls and .tex documents, now with this updated version hosted on a github repository, [here](https://github.com/Qboidal/OxTeXThesis). Some updates as of the 2024/2025 academic year, with a focus on master's theses, specifically the undergraduate MEng in Materials Science Part II thesis, include:
*Future-proofing and preserving generational knowledge* Building on the extensive commenting by JEM, there is now further commenting and guidance on both the now renamed OxfordTeXThesis.cls and Oxford_Thesis.tex. This should allow further generations of those writing their theses to continue to develop this template.

*More easily adaptable thesis formatting requirements* Improved ease and guidance to adjust portions of the template to meet requirements for any thesis. Specifically, to help Part IIs in the Oxford University Department of Materials, there was a focus on the formatting requirements for the Part II thesis for 2024/2025. For Oxford Materials Scientists, look for the word "CAMELGRAPH" to find formatting settings needed for the 2024/2025 academic year.

*Integrated word count* Building on the manual method developed by RJS and previous automated methods, the [texcount](https://ctan.org/pkg/texcount?lang=en) package has been reintegrated, with adjustable settings to conform to specific thesis word count requirements.

*Glossary and Abbreviations* Building on the method by JEM and RJS, which focussed on abbreviations and acronyms using custom-built formatting, using the [glossaries](https://www.ctan.org/pkg/glossaries), both a glossary and acronyms can be supported, while preserving the previous method that used the [acronym](https://www.ctan.org/pkg/acronym) package. 

Enjoy and happy thesis writing! 
Q.

The following is from [John McManigle's OxThesis](https://github.com/mcmanigle/OxThesis), and that version best explains how to use the full features of the work, so find and look at their version.

Some of the features of **OxThesis** are:

*Fantastic chapter pages.* The template retains Sam Evans’s use of the [quotchap](https://www.ctan.org/pkg/quotchap?lang=en) and [minitoc](https://www.ctan.org/pkg/minitoc?lang=en) packages to (optionally) include an epigraph and brief table of contents at the beginning of each chapter. I found this a great way to inject a bit of personality into the thesis (via the epigraph) and ensure that my reader wasn’t getting lost (table of contents). My modifications cleaned up some of the spacing, ensuring single-spaced tables and slightly more compact chapter headings.

*Table of Contents refinements.* Careful attention was paid to spacing and page headings in the table of contents as well as other heading sections. This can get tricky in documents using lots of packages. This template also inserts an “Appendices” page (and ToC entry) between chapters and appendices.

*Table of abbreviations.* Many science and engineering theses use lots of abbreviations. Humanities and social sciences theses often need glossaries. While there are some dedicated LaTeX classes that meet these needs in complex cases, I decided to create a simple list environment to handle the routine cases.

*Highlighted corrections.* Most Oxford theses go through a round of corrections, as time-honored a tradition as the viva itself. Minor corrections generally just involve sending a PDF of your revised thesis to your internal examiner. (Major corrections often require a more exacting process.) This class allows you to designate text (or figures, etc) as a correction. You can then toggle between generating a document in which these corrections are highlighted in blue (ideal for sending to your examiner for a quick read-through) and just printing them without any adornment (for generating your final copy).

*Page layout, draft, and spacing options.* In a few keystrokes, you can switch between a double-spaced, single-sided, binding-margin document (ideal for submission), a 1.5-spaced, double-sided document (for your parents’ copy), or a version with equal left and right margins (for submitting as a PDF). An optional draft notice (with date) can be included in the footer — just remember to turn it off before submitting!

*Master’s thesis title page.* Some masters’ degrees require title pages with a candidate number and word count rather than a name and college, to ensure anonymity for the examinees. They also require a statement of authenticity / originality on the title page. This template has a quick option to switch to this master’s submission format. And, just as importantly, it can be turned off when you want to print a version for yourself.

---
Full details with pictures from JEM can still be found at the [Oxford Echoes blog post](https://www.oxfordechoes.com/oxford-thesis-template/).  Feel free to submit push requests or issues. Currently maintained by QS. 
---
> Written with [StackEdit](https://stackedit.io/).
