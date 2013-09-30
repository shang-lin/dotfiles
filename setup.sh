#!/bin/bash

# Installs dotfiles in home directory.

dotfiles=${HOME}/dotfiles

for dotfile in `ls $dotfiles`; do
  # Backup existing version of dotfile.
  if [ -f "${HOME}/${dotfile}" ]; then
    mv ${HOME}/${dotfile} ${HOME}/${dotfile}.bak
  fi
  ln -s ${dotfiles}/${dotfile} ${HOME}/${dotfile}
done
