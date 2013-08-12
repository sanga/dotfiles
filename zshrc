# load our own completion functions
fpath=(~/.zsh/completion $fpath)

# completion
autoload -U compinit
compinit

# use incremental search
bindkey "^R" history-incremental-search-backward

# add some readline keys back
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line

# handy keybindings
bindkey "^P" history-search-backward

# expand functions in the prompt
setopt prompt_subst

# ignore duplicate history entries
setopt histignoredups

# keep TONS of history
export HISTSIZE=4096

# automatically pushd
setopt auto_pushd
export dirstacksize=5

# awesome cd movements from zshkit
#setopt AUTOCD
#setopt AUTOPUSHD PUSHDMINUS PUSHDSILENT PUSHDTOHOME
#setopt cdablevars

# Try to correct command line spelling
setopt CORRECT CORRECT_ALL

# Enable extended globbing
setopt EXTENDED_GLOB

# aliases
[[ -f ~/.aliases ]] && source ~/.aliases

# Local config
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local

# Path to your oh-my-zsh configuration.
plugins=(git github python pip history-substring-search)
ZSH=$HOME/.oh-my-zsh
export ZSH_THEME=pygmalion #bira # jreese might be better
source $ZSH/oh-my-zsh.sh
# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
#plugins=(git github python)

# Customize to your needs...
# TIM'S EDITS UNDER HERE
export LESS=' -R '
export LESSOPEN="| /usr/share/source-highlight/src-hilite-lesspipe.sh %s"
export PATH=$PATH:$HOME/bin
export GOROOT=$HOME/usr/local/go
export GOPATH=$HOME/Code/go_have_fun
export PATH=$PATH:/$GOROOT/bin
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Code
source /usr/local/bin/virtualenvwrapper.sh

autoload -U compinit
compinit

autoload -U bashcompinit
bashcompinit

_nosetests()
{
    cur="${COMP_WORDS[COMP_CWORD]}"
    COMPREPLY=(`nosecomplete ${cur} 2>/dev/null`)
}
_nose2()
{
    cur="${COMP_WORDS[COMP_CWORD]}"
    COMPREPLY=(`nose2complete ${cur} 2>/dev/null`)
}

complete -o nospace -F _nosetests nosetests
complete -o nospace -F _nose2 nose2

man() {
        env \
                LESS_TERMCAP_mb=$(printf "\e[1;31m") \
                LESS_TERMCAP_md=$(printf "\e[1;31m") \
                LESS_TERMCAP_me=$(printf "\e[0m") \
                LESS_TERMCAP_se=$(printf "\e[0m") \
                LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
                LESS_TERMCAP_ue=$(printf "\e[0m") \
                LESS_TERMCAP_us=$(printf "\e[1;32m") \
                        man "$@"
}

