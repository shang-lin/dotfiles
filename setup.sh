#!/bin/bash

dotfiles=${HOME}/dotfiles

if [ -f "$dotfiles/screenrc" ]
then
  if [ -f "${HOME}/.screenrc" ]
  then
    mv ${HOME}/.screenrc ${HOME}/.screenrc.bak
  fi
  ln -s ${dotfiles}/screenrc ${HOME}/.screenrc
fi

