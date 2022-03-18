#!/bin/zsh

HOMEBREW="/opt/homebrew/bin:/opt/homebrew/sbin"
PYTHON="/opt/homebrew/opt/python/libexec/bin"
JAVA="/opt/homebrew/opt/openjdk/bin"

# Locale fix
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

export PATH="$HOMEBREW:$PYTHON:$JAVA:$PATH:$HOME/.local/bin"
export EDITOR="nvim"
export PAGER="less"

# Move stuff from $HOME
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export PYTHONSTARTUP="$XDG_CONFIG_HOME/python/pythonrc"
export HISTFILE="$XDG_DATA_HOME/zsh/history"
export LESSHISTFILE="-"
export SQLITE_HISTORY=""
export PASSWORD_STORE_DIR="$XDG_DATA_HOME/pass"

# For Winbox
export FREETYPE_PROPERTIES="truetype:interpreter-version=35"
export DYLD_FALLBACK_LIBRARY_PATH="/usr/lib:/opt/X11/lib:$DYLD_FALLBACK_LIBRARY_PATH"

# `less` syntax highlighting
export LESSOPEN="| /usr/bin/highlight -O ansi %s 2>/dev/null"
export LESS=' -R '
