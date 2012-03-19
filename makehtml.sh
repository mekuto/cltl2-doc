#!/bin/sh
if [ -f symbols.idx ]; then
    tex '\def\filename{{symbols}{idx}{4dx}{ind}} \input  idxmake.4ht' 
    makeindex -o symbols.ind symbols.4dx 
fi

if [ -f issues.idx ]; then
    tex '\def\filename{{issues}{idx}{4dx}{ind}} \input  idxmake.4ht' 
    makeindex -o issues.ind issues.4dx 
fi

htlatex clm.tex 'cltl,3,index=2,next,fn-in,charset=utf-8,sections+,minitoc<' ' -cunihtf -utf8' '' '-interaction=batchmode'
#htlatex clm.tex 'cltl,3,index=2,next,fn-in,charset=utf-8,sections+,minitoc<,obj-toc' ' -cunihtf -utf8' '' '-interaction=batchmode'
cp -f clm.html index.html
