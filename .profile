# Aliases
alias ll="ls -la"
alias llr="ls -ltra"
alias cpr="cp -Rv"

alias ci="cabal install"
alias cip="cabal install --enable-executable-profiling --enable-library-profiling -fprof-auto --ghc-option=-fprof-auto -fprof-auto-calls --ghc-option=-fprof-auto-calls"
alias cimp="cabal install --enable-executable-profiling -fprof-auto-calls --ghc-option=-fprof-auto-calls"
alias cimp2="cabal install --enable-executable-profiling"
alias cdoc="cabal haddock --hoogle; cp dist/doc/html/`basename $PWD`/`basename $PWD`.txt ."

alias g="git"
alias ga="git add"
alias gs="git status"
alias gc="git commit -a -m"
alias gp="git push"
alias gpu="git pull"
alias gl="git log --pretty=format:"%h%x09%an%x09%ad%x09%s%d""

alias h="hg"
alias ha="hg add"
alias hs="hg status"
alias hc="hg commit -m"
alias hp="hg push"
alias hpu="hg pull"

alias v="vim"
alias vv="mvim"

# Hoogle
alias hh="hoogle --color --count=30 +t4a-offer"

export CLICOLOR=1
export TERM="xterm-256color"

export CLOJURE_HOME=$HOME/Projects/clojure/
export PATH=$CLOJURE_HOME:$PATH

export CLOJURESCRIPT_HOME=$HOME/Projects/clojurescript/
export PATH=$CLOJURESCRIPT_HOME/bin:$PATH

# old less version
export PATH=$PATH:/Applications/Less.app/Contents/Resources/engines/bin


# export CLOJURE_OPTS="-XstartOnFirstThread"
# export CLOJURE_OPTS="-d32"

# MacPorts Installer addition on 2011-05-30_at_20:54:38: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH

# add ~/bin to path
export PATH=$HOME/bin:$PATH

export MAGICK_HOME=$HOME/Projects/ImageMagick-6.6.9
export PATH=$MAGICK_HOME/bin:$PATH
export DYLD_LIBRARY_PATH=$MAGICK_HOME/lib/

export PATH=$PATH:/Applications/Lynxlet.app/Contents/Resources/lynx/bin

# cabal executables
export PATH=~/.cabal/bin:$PATH
export PATH=~/Library/Haskell/bin:$PATH

# npm
export PATH=$PATH:/usr/local/share/npm/bin

# Android
export PATH=$PATH:~/Projects/android-sdk-macosx/tools
export PATH=$PATH:~/Projects/android-sdk-macosx/platform-tools

# Setting PATH for Python 2.7
# The orginal version is saved in .profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH

# /usr/local/bin
export PATH=/usr/local/bin:$PATH

# cabal-dev
# export GHC_PACKAGE_PATH=/Library/Frameworks/GHC.framework/Versions/7.6.3-x86_64/usr/lib/ghc-7.6.3/package.conf.d:$HOME/.ghc/x86_64-darwin-7.6.3/package.conf.d:cabal-dev/packages-7.6.3.conf

# RVM stuff
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export EDITOR=vim
export VISUAL=vim

set -o vi
