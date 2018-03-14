#!/bin/bash

# Remove existing folder 
# rm -Rf ~/.tmux

# Copy files to your profile
cp -Rf .tmux ~/
cp -f .tmux.conf.local ~/

# Check if the file exist
# Create a soft link so that it would pick it up.
if [ -e ~/.tmux/.tmux.conf ]
then
    # then create symlink
    ln -s -f ~/.tmux/.tmux.conf ~/.tmux.conf
fi

# Have to set tmp directory to user profile instead of system wide /tmp
if ! grep -Fxq "export TMUX_TMPDIR=~/.tmux/tmp" ~/.bashrc 
then
    # add it to the file
    echo "export TMUX_TMPDIR=~/.tmux/tmp" >> ~/.bashrc
fi
