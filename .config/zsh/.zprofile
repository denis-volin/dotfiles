#!/bin/zsh

# --- PATH (single source of truth) ---
# Prepend user binaries
export PATH="$HOME/.local/bin:$PATH"

# --- Environment variables ---
export EDITOR="nvim"
export VISUAL="nvim"
export PAGER="less"

# --- Locale (important for many CLI tools) ---
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# --- XDG base dirs (modern standard) ---
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
