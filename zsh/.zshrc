PROMPT="%n@%m %2~ $ "

# =================================================
# Completion
# =================================================
autoload -Uz compinit
compinit -d "$XDG_CACHE_HOME/zsh/zcompdump"
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zmodload zsh/complist
_comp_options+=(globdots)   # Include hidden files.

# =================================================
# History
# =================================================
HISTFILE="$XDG_STATE_HOME/zsh/history"
HISTSIZE=100000
SAVEHIST=100000

setopt APPEND_HISTORY           # Appends to the file instead of overwriting it.
setopt SHARE_HISTORY            # Share history between all sessions.
setopt HIST_IGNORE_DUPS         # Do not record an event that was just recorded again.
setopt HIST_IGNORE_SPACE        # Do not record an event starting with a space.
setopt HIST_EXPIRE_DUPS_FIRST   # Expire a duplicate event first when trimming history.
setopt HIST_FIND_NO_DUPS        # Do not display a previously found event.

setopt EXTENDED_HISTORY         # Write the history file in the ':start:elapsed;command' format.
setopt INC_APPEND_HISTORY       # Write to history file immediately, not just on exit.
setopt HIST_VERIFY              # Don't execute immediately upon history expansion.
setopt HIST_IGNORE_ALL_DUPS     # Delete an old recorded event if a new event is a duplicate.
setopt HIST_SAVE_NO_DUPS        # Do not write a duplicate event to the history file.

# =================================================
# Shell Behaviour
# =================================================
setopt AUTOCD
setopt NOBEEP
setopt NUMERIC_GLOB_SORT  # Sort file10 after file9,not after file1

# =================================================
# Alias
# =================================================
alias nvm="nvim"
alias ls='ls --color=auto'
alias lsa='ls -a --color=auto'
alias grep='grep --color=auto'

alias install='sudo pacman -S'
alias update='sudo pacman -Syu'
alias update-except='sudo pacman -Syu --ignore'
alias uninstall='sudo pacman -Rns'
alias search='pacman -Ss'
alias cleanup='sudo pacman -Sc'
