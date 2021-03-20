#! /bin/bash
set -euxo pipefail

sudo apt update

# install and setup `zsh` as default
sudo apt-get install zsh -y
sudo chsh -s $(which zsh) $(whoami)

# install ohmyzsh and plugins
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
sed -i 's/_THEME=\"\(.*\)\"/_THEME=\"bira\"/g' ~/.zshrc
sed -i 's/\(^plugins=([^)]*\)/\1 zsh-autosuggestions zsh-syntax-highlighting z extract/' ~/.zshrc

# install vim and link .vimrc
sudo apt-get install vim -y
cp .vimrc ~/.vimrc
source ~/.vimrc

# install tmux and link .tmux.conf
sudo apt-get install tmux -y
cp .tmux.conf ~/.tmux.conf
# tmux source-file ~/.tmux.conf
