#!/bin/bash

home="/Users/agruzelle"

for f in c.vim css.vim html.vim java.vim md.vim xml.vim
do
    rm $home/.vim/after/syntax/$f
    ln -s $home/Configs/$f $home/.vim/after/syntax/$f
done

for f in parametersHighlight.vim highlight.vim
do
    rm $home/.vim/$f
    ln -s $home/Configs/$f $home/.vim/$f
done

dest="$home/.vim/plugin"
mkdir -p $dest
for f in grep_operator.vim google.vim
do
	rm $dest/$f
	ln -s $home/Configs/$f $dest/$f
done

solarized=$home/.vim/bundle/vim-colors-solarized/colors/solarized.vim
rm $solarized
ln -s $home/Configs/solarized.vim $solarized
