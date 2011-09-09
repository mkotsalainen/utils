cd
wget https://github.com/downloads/joelthelion/autojump/autojump_v16.tar.gz
tar -xvzf autojump_v16.tar.gz
cd autojump_v16
sudo ./install.zsh
echo "source /etc/profile.d/autojump.zsh" >> ~/.zshrc
cd
rm -rf autojump_v16
