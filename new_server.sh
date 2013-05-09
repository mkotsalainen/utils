cd ~

echo "installing nice utils"
sudo apt-get install -y git-core zsh curl htop vim ctags ack-grep tig make

echo "installing oh my zsh"
wget --no-check-certificate https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh

echo "getting utils"
git clone https://github.com/mkotsalainen/utils.git ~/utils

echo "install custom zsh stuff"
ln -s ~/utils/matti.zsh ~/.oh-my-zsh/custom/
ln -s ~/utils/matti.zsh-theme ~/.oh-my-zsh/themes/

sed 's/^ZSH_THEME.*/ZSH_THEME="matti"/' -i .zshrc
sed 's/^plugins.*/plugins=(git virtualenv django fabric cp brew autoenv fasd rsync)/' -i .zshrc


echo "installing Vundle. do :BundleInstall to download vim plugins"
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
ln -s ~/utils/.vimrc ~

echo "Installing fasdd"
wget https://github.com/clvv/fasd/archive/1.0.1.tar.gz
tar xvf 1.0.1.tar.gz
cd fasd-1.0.1/
sudo make install
cd ..
rm -rf fasd-1.0.1/ 1.0.1.tar.gz

sudo chsh $(whoami) -s /bin/zsh


echo "all done!"
