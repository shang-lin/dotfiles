#!/bin/bash

# Installs dotfiles in home directory.

dotfiles=${HOME}/dotfiles
cmd=`basename $0`
ignore="$cmd .git . .."

echo "Changing directories to $dotfiles"
cd $dotfiles

for dotfile in `ls -a`; do
  #if [[ $ignore =~ $dotfile ]]; then
  [[ $ignore =~ $dotfile ]] && echo "Ignoring $dotfile" && continue
  #fi
  # Backup existing version of dotfile.
  echo "Backing up ${dotfile}"
  if [ -e "${HOME}/${dotfile}" ]; then
    mv ${HOME}/${dotfile} ${HOME}/${dotfile}.bak
  fi

  echo "Symlink ${HOME}/${dotfile} => ${dotfile}"
  ln -s ${dotfiles}/${dotfile} ${HOME}/${dotfile}
done
