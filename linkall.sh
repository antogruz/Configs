#!/bin/bash

home="/Users/agruzelle"

for f in c.vim css.vim html.vim java.vim md.vim xml.vim
do
    rm $home/.vim/after/syntax/$f
    ln -s $home/Configs/$f $home/.vim/after/syntax/$f
done
