# --- General ---
autoload -U colors && colors   # Load colors
setopt autocd                  # Automatically cd into typed directory
source "$ZDOTDIR/aliases.zsh"  # Load aliases

# VI mode
source "$XDG_DATA_HOME/zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh"

# Change working directory using lf with CTRL-O
lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp" >/dev/null
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}
bindkey -s '^o' 'lfcd\r'



# --- Prompt ---

# Different promt for root and non-root user
# Cool site for this: https://zsh-prompt-generator.site/
if [[ $EUID -ne 0 ]]; then
  PROMPT="%F{green}[%f%F{green}%n%f%F{yellow}@%f%F{cyan}%M%f %F{magenta}%d%f%F{green}]%f$ "
else
  PROMPT="%F{red}[%f%F{red}%n%f%F{yellow}@%f%F{cyan}%M%f %F{magenta}%d%f%F{red}]%f# "
fi

# Show non-zero exit code of the last command
RPROMPT="%F{red}%(?..%?)%f"



# --- History settings ---

HISTFILE="$XDG_DATA_HOME/zsh/history"
HISTSIZE=100000
SAVEHIST=$HISTSIZE
HISTORY_IGNORE="(ll|lf|lfcd|cd|e|h|g)"

setopt INC_APPEND_HISTORY  # Write to the history file immediately, not when the shell exits
setopt SHARE_HISTORY       # Share history between all sessions
setopt HIST_IGNORE_SPACE   # Don't record an entry starting with a space
setopt HIST_IGNORE_DUPS    # Don't write to the history sequential duplicate commands
setopt HIST_REDUCE_BLANKS  # Strip extra spaces from commands
setopt HIST_FCNTL_LOCK     # Prevent file corruption in concurrent sessions

# Search in history with CTRL+R
function source_fzf() {
  source <(fzf --zsh)
}
zvm_after_init_commands+=(source_fzf)

# Search history by current command prefix with CTRL+J / CTRL+K
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
function setup_history_search_keybindings() {
  zle -N up-line-or-beginning-search
  zle -N down-line-or-beginning-search
  bindkey -M vicmd '^K' up-line-or-beginning-search
  bindkey -M viins '^K' up-line-or-beginning-search
  bindkey -M vicmd '^J' down-line-or-beginning-search
  bindkey -M viins '^J' down-line-or-beginning-search
}
zvm_after_init_commands+=(setup_history_search_keybindings)



# --- Completion settings ---

autoload -Uz compinit; compinit

# Make case-insensitive
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}'

# Include dotfiles in completion
setopt GLOB_DOTS
source "$XDG_DATA_HOME/zsh/plugins/fzf-tab/fzf-tab.plugin.zsh"



# --- Syntax highlighting ---
source "$XDG_DATA_HOME/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh"
