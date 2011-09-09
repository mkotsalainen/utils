echo "installing nice utils"
apt-get install -y git-core zsh curl htop vim ctags ack-grep

echo "installing oh my zsh"
wget http://github.com/mkotsalainen/oh-my-zsh/raw/master/tools/install.sh -O - | sh

echo "installing vim dotfiles"
wget http://github.com/mkotsalainen/dotvim/raw/master/install.sh -O - | sh
chsh $(pwd | sed 's|/home/||') -s /bin/zsh

echo "installing autojump"
~/utils/install_autojump.sh

echo "all done!"
