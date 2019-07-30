#!/usr/bin/env bash

set +e

BASE_DIR="$( pwd )"

echo "[configs] checking out git submodules"
cd $BASE_DIR
git submodule update --init

#######################
#         VIM         #
#######################
echo "[vim] downloading newest version of pathogen (vim packet manager)"
curl -LSso ${BASE_DIR}/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# create symlink for vim folder and vimrc
echo "[vim] creating symlink for vim configuration files"
ln -fs ${BASE_DIR}/.vim ~/.vim
ln -fs ${BASE_DIR}/.vim/vimrc ~/.vimrc

#######################
#        NANO         #
#######################

NANO_SYNTAX_FOLDER=~/.nano/

echo "[nano] installing syntax files for all languages to ${NANO_SYNTAX_FOLDER}"

# create nano syntax file folder, to be compatible to normal installation
if [ ! -d $NANO_SYNTAX_FOLDER ]
then
mkdir $NANO_SYNTAX_FOLDER
fi

for file in $BASE_DIR/nanorc/*.nanorc ; do
    ln -fs $file $NANO_SYNTAX_FOLDER
done

NANORC_FILE=~/.nanorc

if [ ! -f $NANORC_FILE ]
then
  touch $NANORC_FILE
fi

# add all includes from ./nanorc if they're not already there
while read inc; do
  if ! grep -q "$inc" "${NANORC_FILE}"; then
      echo "$inc" >> $NANORC_FILE
  fi
done < $BASE_DIR/nanorc/nanorc

#######################
#        TMUX         #
#######################

echo "[tmux] creating symlink for tmux conf"
ln -fs $BASE_DIR/.tmux_conf ~/.tmux_conf
