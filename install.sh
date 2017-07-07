#!/usr/bin/env bash

BASE_DIR="$( pwd )"

# get newest version of pathogen (vim packet manager)
# curl -LSso ${BASE_DIR}/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

#mv .vimrc ~/.vim/vimrc
ln -s ${BASE_DIR}/.vim ~/.vim
ln -s ${BASE_DIR}/.vim/vimrc ~/.vimrc