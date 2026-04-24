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
  h="history 0 | less +G"           \
  hs="history 0 | grep"             \
  t="tmux -CC attach || tmux -CC"   \
  s="systemctl"                     \
  j="journalctl"                    \
  d="docker"                        \
  dc="docker compose"               \
  ports="ss -tulpn"                 \
  nlr="nft list ruleset"            \

# Dotfiles repo control
alias dot="git --git-dir=$HOME/.local/share/dotfiles.git/ --work-tree=$HOME"
