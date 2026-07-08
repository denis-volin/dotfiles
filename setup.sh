#!/bin/sh

main() {
    set -eu

    need_cmd() {
        if ! command -v "$1" >/dev/null 2>&1; then
            echo "Missing required command: $1" >&2
            exit 1
        fi
    }

    clone_if_missing() {
        repo_url="$1"
        target_dir="$2"

        if [ -d "$target_dir/.git" ] || [ -d "$target_dir" ]; then
            echo "Skipping existing directory: $target_dir"
            return
        fi

        git clone "$repo_url" "$target_dir"
    }

    REPO_URL="${REPO_URL:-https://github.com/denis-volin/dotfiles.git}"
    DOTFILES_GIT_DIR="${DOTFILES_GIT_DIR:-$HOME/.local/share/dotfiles.git}"
    PLUGIN_DIR="${PLUGIN_DIR:-$HOME/.local/share/zsh/plugins}"
    LF_INSTALL_DIR="${LF_INSTALL_DIR:-/usr/local/bin}"

    if [ "$(id -u)" -eq 0 ]; then
        SUDO=""
    else
        need_cmd sudo
        SUDO="sudo"
    fi

    need_cmd curl

    mkdir -p "$PLUGIN_DIR"

    if command -v apt >/dev/null 2>&1; then
        $SUDO apt-get update
        $SUDO apt-get install -y zsh neovim fzf git
    else
        echo "Skipping apt packages: apt is not available" >&2
    fi

    need_cmd git
    need_cmd tar

    clone_if_missing "https://github.com/Aloxaf/fzf-tab" "$PLUGIN_DIR/fzf-tab"
    clone_if_missing "https://github.com/jeffreytse/zsh-vi-mode" "$PLUGIN_DIR/zsh-vi-mode"
    clone_if_missing "https://github.com/zdharma-continuum/fast-syntax-highlighting" "$PLUGIN_DIR/fast-syntax-highlighting"

    $SUDO mkdir -p "$LF_INSTALL_DIR"
    curl -fsSL "https://github.com/gokcehan/lf/releases/latest/download/lf-linux-amd64.tar.gz" \
        | $SUDO tar -xz -C "$LF_INSTALL_DIR"

    mkdir -p "$(dirname "$DOTFILES_GIT_DIR")"

    if [ ! -d "$DOTFILES_GIT_DIR" ]; then
        git -C "$(dirname "$DOTFILES_GIT_DIR")" clone --bare --single-branch "$REPO_URL" "$(basename "$DOTFILES_GIT_DIR")"
    else
        echo "Skipping existing bare repo: $DOTFILES_GIT_DIR"
    fi

    git --git-dir="$DOTFILES_GIT_DIR" --work-tree="$HOME" checkout -f
    git --git-dir="$DOTFILES_GIT_DIR" --work-tree="$HOME" rm --cached --ignore-unmatch README.md LICENSE setup.sh
    rm -f "$HOME/README.md" "$HOME/LICENSE" "$HOME/setup.sh"

    if command -v zsh >/dev/null 2>&1; then
        $SUDO chsh -s "$(command -v zsh)" "$(id -un)"
    else
        echo "Skipping chsh: zsh is not installed" >&2
    fi

    echo "Setup finished. Start a new shell session to load zsh."
}

main "$@"
