#!/data/data/com.termux/files/usr/bin/env bash

source ./../log.sh

PACKAGES=("neovim" "vim" "ripgrep")

pkg install ${PACKAGES[@]} -y
