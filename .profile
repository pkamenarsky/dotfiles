# Aliases
alias ll="ls -la"
alias llr="ls -ltra"
alias cpr="cp -Rv"

alias g='grep --colour -Rnif /dev/stdin src <<<'

alias ga="git add"
alias gap="git add -p"
alias gs="git status"
alias gc="git commit"
alias gca="git commit -a -m"
alias gco="git checkout"
alias gp="git push"
alias gpu="git pull"
alias gl="git log --pretty=format:"%h%x09%an%x09%ad%x09%s%d""

alias git-todos-hs="git grep --line-number -e TODO -e FIXME -e NOTE -- '*.hs'"

alias h="hg"
alias ha="hg add"
alias hs="hg status"
alias hc="hg commit -m"
alias hp="hg push"
alias hpu="hg pull"

alias v="vim"
alias vv="mvim"

# npm
alias npm-exec='PATH=$(npm bin):$PATH'

# Hoogle
alias hh="hoogle --color --count=30 +t4a-offer"

export CLICOLOR=1
export TERM="xterm-256color"

# add ~/bin to path
export PATH=$HOME/bin:$PATH

export EDITOR=vim
export VISUAL=vim

set -o vi

# /usr/local/bin
export PATH=/usr/local/bin:$PATH

# /usr/.local/bin
export PATH=$HOME/.local/bin:$PATH

### Convert mov to gif
movtogif() {
    ffmpeg -i "$1" -vf scale=800:-1 -r 10 -f image2pipe -vcodec ppm - |\
    convert -delay 5 -layers Optimize -loop 0 - "${1%.*}.gif"
}

# gems
export GEM_HOME=~/.gem
export GEM_PATH=~/.gem
