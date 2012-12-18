#!/bin/ksh
#

tmp="$1-tmp"

echo '\documentclass[12pt]{article}' > $tmp.tex
echo '\usepackage{graphicx}' >> $tmp.tex
echo '\usepackage{subfigure}' >> $tmp.tex
echo '\usepackage{mathptm}' >> $tmp.tex
echo '\usepackage{fancybox}' >> $tmp.tex
echo '\usepackage{color}' >> $tmp.tex
echo '\usepackage{array}' >> $tmp.tex
echo '\usepackage{dcolumn}' >> $tmp.tex
echo '\usepackage{multirow}' >> $tmp.tex
echo '\usepackage{slashbox}' >> $tmp.tex
echo '\usepackage{longtable}' >> $tmp.tex
echo '\usepackage[a4paper,top=1in,left=1in,right=1in,bottom=1in]{geometry}' >> $tmp.tex
#echo '\\setlength{\\textwidth}{3in}' >> $tmp.tex
echo '\begin{document}' >> $tmp.tex
echo '\pagestyle{empty}' >> $tmp.tex
echo '\noindent' >> $tmp.tex
cat $1.tex >> $tmp.tex
echo '\end{document}' >> $tmp.tex
#latex $tmp.tex > /dev/null 2> /dev/null
latex $tmp.tex > out # /dev/null 2> /dev/null
dvips -q -E $tmp.dvi -o $1.eps
#/bin/rm -f $tmp.tex $tmp.log $tmp.dvi $tmp.aux

