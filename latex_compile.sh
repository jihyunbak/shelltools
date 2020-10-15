#!/bin/bash

# if parameter is unset of null, default value is used
FILE=${1:-"main"}

pdflatex $FILE
bibtex $FILE
pdflatex $FILE
pdflatex $FILE

