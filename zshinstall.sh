#!/bin/bash
read -p 'Home path {/home/USER/}: ' HomePath
chsh -s /bin/zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
git clone https://github.com/denysdovhan/spaceship-prompt.git "$HomePath.oh-my-zsh/themes/spaceship-prompt"
ln -s "$HomePath.oh-my-zsh/themes/spaceship-prompt/spaceship.zsh-theme" "$HomePath.oh-my-zsh/themes/spaceship.zsh-theme"
cp zshrc ~/.zshrc
