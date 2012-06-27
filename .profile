export CLICOLOR=1
export TERM="xterm-256color"

export CLOJURE_HOME=$HOME/Projects/clojure/
export PATH=$CLOJURE_HOME:$PATH

export CLOJURESCRIPT_HOME=$HOME/Projects/clojurescript/
export PATH=$CLOJURESCRIPT_HOME/bin:$PATH

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

export PATH=$PATH:~/Library/Haskell/ghc-7.0.3/lib/yesod-1.0.1.6/bin
export PATH=$PATH:~/Library/Haskell/ghc-7.0.3/lib/hlint-1.8.29/bin
