apt-get install -y git-core zsh curl htop vim ctags ack-grep
wget http://github.com/mkotsalainen/oh-my-zsh/raw/master/tools/install.sh -O - | sh
wget http://github.com/mkotsalainen/dotvim/raw/master/install.sh -O - | sh
chsh $(whoami) -s /bin/zsh

#install autojump
wget https://github.com/downloads/joelthelion/autojump/autojump_v16.tar.gz
tx autojump_v16.tar.gz
cd autojump_v16
./install.zsh
