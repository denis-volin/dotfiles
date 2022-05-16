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
export DOCKER_CONFIG="$XDG_CONFIG_HOME/docker"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export WGETRC="$XDG_CONFIG_HOME/wgetrc"
export GRADLE_USER_HOME="$XDG_DATA_HOME/gradle"
export PASSWORD_STORE_DIR="$XDG_DATA_HOME/pass"
export HISTFILE="$XDG_DATA_HOME/zsh/history"
export LESSHISTFILE="-"
export SQLITE_HISTORY=""

# For Winbox
export FREETYPE_PROPERTIES="truetype:interpreter-version=35"
export DYLD_FALLBACK_LIBRARY_PATH="/usr/lib:/opt/X11/lib:$DYLD_FALLBACK_LIBRARY_PATH"

# `less` syntax highlighting
export LESSOPEN="| /usr/bin/highlight -O ansi %s 2>/dev/null"
export LESS=' -R '
