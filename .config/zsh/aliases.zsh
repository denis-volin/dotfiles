# Verbosity and interactivity settings
alias                \
  cp="cp -iv"        \
  mv="mv -iv"        \
  rm="rm -vI"        \
  ln="ln -v"         \
  mkd="mkdir -pv"    \
  rsync="rsync -hP"  \

# Colorize commands when possible
alias                                                   \
  ls="ls -hN --color=auto --group-directories-first"    \
  ll="ls -lAhN --color=auto --group-directories-first"  \
  grep="grep --color=auto"                              \
  diff="diff --color=auto"                              \

# Common commands abbreviation
alias                               \
  e="$EDITOR"                       \
  h="history | less +G"             \
  hs="history | grep"               \
  t="tmux -CC attach || tmux -CC"   \
  s="systemctl"                     \
  j="journalctl"                    \
  d="docker"                        \
  dc="docker compose"               \
  ports="ss -tulpen"                \
  nlr="nft list ruleset"            \

# Dotfiles repo control
alias \
  dot="git --git-dir=$HOME/.config/dotfiles.git/ --work-tree=$HOME" \
  dotg="lazygit --git-dir=$HOME/.config/dotfiles.git/ --work-tree=$HOME"
