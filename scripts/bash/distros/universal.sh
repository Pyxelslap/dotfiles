#!/bin/env bash

set -euo pipefail

source ./../log.sh
source ./../XDG_Base_Directories.sh

ARCH=$(uname -m)
RUNTIMEDIR="$XDG_RUNTIME_DIR/dotfiles_installations"
if ! [ -d "$RUNTIMEDIR" ]; then
	mkdir "$RUNTIMEDIR"
fi

installnvim() {
	local PACKAGEDIR="$RUNTIMEDIR/nvim"
	case "$ARCH" in
		"aarch64")
			local LINK="https://github.com/neovim/neovim/releases/latest/download/nvim-linux-arm64.tar.gz"
			local DIRNAME="$PACKAGEDIR/nvim-linux-arm64"
			;;
		"x86_64")
			local LINK="https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz"
			local DIRNAME="$PACKAGEDIR/nvim-linux-x86_64"
			;;
		*)
			Log "${RED}Cannot fetch system architecture!"
			exit 1
			;;
	esac
	Log "$LINK"
	local RAWPACKAGE="$PACKAGEDIR/nvim.tar.gz"

	mkdir "$PACKAGEDIR"
	curl -L "$LINK" -o "$RAWPACKAGE"
	tar xf "$RAWPACKAGE" --directory="$PACKAGEDIR"
	cp "$DIRNAME" "$PREFIX/opt/nvim" # PREFIX variable will return nothing on linux desktop, it's only available on termux
	ln -s "$PREFIX/opt/nvim/bin/nvim" "$PREFIX/usr/bin/local/nvim"
}

