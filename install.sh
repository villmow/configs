#!/usr/bin/env bash

# get newest version of pathogen (vim packet manager)
curl -LSso ./.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

#mv .vimrc ~/.vim/vimrc
ln -s ./.vim/ ~/.vim
ln -s ~/.vim/vimrc ~/.vimrc