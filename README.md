# Dotfiles

A few simple config files for tools that I use on servers.

## Setup

### Automatic

With a script:

```sh
curl -fsSL https://raw.githubusercontent.com/denis-volin/dotfiles/main/setup.sh | sh
```

Or with an Ansible Playbook:

```sh
ansible-playbook -i inventory.yml playbook.yml
```

### Manual

```sh
# Install requirements

apt install git tar zsh neovim fzf

git clone https://github.com/Aloxaf/fzf-tab ~/.local/share/zsh/plugins/fzf-tab
git clone https://github.com/jeffreytse/zsh-vi-mode ~/.local/share/zsh/plugins/zsh-vi-mode
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting ~/.local/share/zsh/plugins/fast-syntax-highlighting

curl -L https://github.com/gokcehan/lf/releases/latest/download/lf-linux-amd64.tar.gz | tar xzC /usr/local/bin

# Clone dotfiles repo

git -C ~/.local/share clone --bare --single-branch https://github.com/denis-volin/dotfiles.git
git --git-dir=$HOME/.local/share/dotfiles.git --work-tree=$HOME checkout -f
git --git-dir=$HOME/.local/share/dotfiles.git --work-tree=$HOME rm --cached README.md

chsh -s $(which zsh)
exit
```
