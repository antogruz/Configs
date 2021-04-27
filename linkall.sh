#!/bin/bash

home="/Users/agruzelle"

mkdir -p $home/.vim/after/syntax
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

solarizedDir=$home/.vim/bundle/vim-colors-solarized/colors
mkdir -p $solarizedDir
solarized=$solarizedDir/solarized.vim
rm $solarized
ln -s $home/Configs/solarized.vim $solarized

for f in .vimrc .zshrc
do
    ln -s $home/$f $home/Configs/$f
