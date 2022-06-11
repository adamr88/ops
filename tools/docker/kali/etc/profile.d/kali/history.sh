mkdir -p /mnt/shm

export RESULTS_DIR=/mnt/shm
export HISTCONTROL=ignoredups
export HISTIGNORE="&:ls:[bf]g:exit:history:clear"
export HISTTIMEFORMAT='%m/%d/%y %T '
export HISTSIZE=10000
export HISTFILESIZE=10000
export HISTFILE=$RESULTS_DIR/.history

# share history
setopt share_history

# search history
# bindkey -v
# bindkey '^R' history-incremental-search-backward

# autocomplete from history
# autoload -U compinit; compinit
# zstyle ":completion:*:commands" rehash 1
