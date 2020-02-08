SHELL_DIR=$HOME/.config/shell

ZSH_THEME="spaceship"

# Settings
setopt autocd                   # Auto cd when executing directory
setopt auto_pushd               # Automatically use pushd
setopt pushd_ignore_dups        # Pushd will ignore duplicates
setopt pushdminus               # Allow numbers
setopt hist_expire_dups_first   # Delete duplicates when HISTFILE is full
setopt hist_ignore_dups         # Ignore duplicates
setopt histignorespace          # Don't write to history when prepended by space
setopt hist_verify              # Show with history expansion before executing
setopt inc_append_history       # Add in order of execution
setopt auto_menu                # Show completion menu on tab
setopt complete_in_word         # Completion from both ends
setopt always_to_end            # Move cursor to end on completion

# Source
source $SHELL_DIR/variables.sh
source $SHELL_DIR/functions.sh
source $SHELL_DIR/aliases.sh
source $ZSH/oh-my-zsh.sh

plugins=(
    git
    battery    
    command-not-found
    extract
    git-auto-fetch
    jsontools
    man
    ripgrep
    rsync
    screen
    sudo
    vi-mode
    zsh-autosuggestions
)

# Completion
zmodload -i zsh/complist
WORDCHARS=''
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion::complete:*' cache-path $ZSH_CACHE_DIR
zstyle ':completion::complete:*' use-cache 1
