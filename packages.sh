#!/bin/bash

echo "+++++++++++Installing additional packages+++++++++++"
sudo pacman -S vim awesome-terminal-fonts otf-font-awesome fish ttf-font-awesome neovim powerline tumbler viewnior thunar thunar-archive-plugin thunar-volman ttf-cascadia-code 
echo "+++++++++++Installing oh-my-fish+++++++++++"
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
echo "+++++++++++Installing budspencer fish theme+++++++++++"
omf install budspencer
set -U budspencer_nogreeting
echo "+++++++++++Finished Installing packages+++++++++++"
