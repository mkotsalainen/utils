echo "installing nice utils"
sudo apt-get install -y git-core zsh curl htop vim ctags ack-grep tig

echo "installing oh my zsh"
wget --no-check-certificate https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh

#echo "installing vim dotfiles"
#wget http://github.com/mkotsalainen/dotvim/raw/master/install.sh -O - | sh
#sudo chsh $(pwd | sed 's|/home/||') -s /bin/zsh

echo "getting utils"
git clone git://github.com/mkotsalainen/utils.git ~/utils

echo "install custom zsh stuff"
ln -s ~/utils/matti.zsh ~/.oh-my-zsh/custom/
ln -s ~/utils/matti.zsh-theme ~/.oh-my-zsh/themes/

echo "installing Vundle. do :BundleInstall to download vim plugins"
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
ln -s ~/utils/.vimrc ~

#echo "installing autojump"
#~/utils/install_autojump.sh

echo "all done!"
