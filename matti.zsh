set -o emacs

alias c='clear'
alias o='open'
alias e='vim'
alias h='history'
alias hg='history | grep'
alias g='git'

alias ....= 'cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias .......='cd ../../../../../..'

#we reset the prompt since the zsh formatting codes messes up the debug page otherwise
alias rs='PS1="" ./manage.py runserver'
alias sp='./manage.py shell_plus --use-pythonrc'
alias p='bpython'
alias ipython='nocorrect ipython'
alias bpython='nocorrect bpython'

alias tx='tar -xvzf'
alias tc='tar -cvzf'

#misc
alias v='vagrant'
alias vagrant='nocorrect vagrant'
alias tree='nocorrect tree'
alias gx='gitx --all'
alias gk='gitk --all &'
alias ack='nocorrect ack'

#http://tooky.github.com/2010/04/08/there-was-a-problem-with-the-editor-vi-git-on-mac-os-x.html
export EDITOR=/usr/bin/vim

alias ll='ls -lh'
alias la='ls -lAh'
alias l='ls -lh'
alias gc='open /Applications/Google\ Chrome.app'
alias tig='tig status'

#drupal
#alias dr='drush'
#alias ddl='drush dl'
#alias den='drush en'
#alias dcca='drush cc all'

alias drush='nocorrect drush'

alias a='fasd -a'        # any
alias s='fasd -si'       # show / search / select
alias d='fasd -d'        # directory
#alias f='fasd -f'        # file
alias sd='fasd -sid'     # interactive directory selection
alias sf='fasd -sif'     # interactive file selection
alias j='fasd_cd -d'     # cd, same functionality as j in autojump
alias J='fasd_cd -d -i' # cd with interactive selection

alias ag='nocorrect ag'
alias agp='ag -f -G .py'
alias agh='ag -f -G .html'
alias cheat='nocorrect cheat'

alias wn='workon'
alias da='deactivate'

newdir() {
  mkdir -p $1 && cd $1
}
alias f='mdfind -name'

httpless() {
    # `httpless example.org'
http --pretty=all --print=hb "$@" | less -R;
}

alias bd='. bd -s'

alias s="osascript ~/utils/SpotifyControl.scpt"

# This is required or NERDTree won't work
export LC_ALL=en_US.utf-8
export LANG="$LC_ALL"
