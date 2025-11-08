#!/bin/env bash

set -euo pipefail
shopt -s nullglob

source ./scripts/bash/log.sh

# User Directories
XDG_CONFIG_HOME="$HOME/.config"
XDG_CACHE_HOME="$HOME/.cache"
XDG_DATA_HOME="$HOME/.local/share"
XDG_STATE_HOME="$HOME/.local/state"
XDG_RUNTIME_DIR=$(
if [ -d /tmp ]; then
	echo "/tmp"
else
	echo "$TMPDIR"
fi
)

# System Directories
XDG_DATA_DIRS="/usr/share"
XDG_CONFIG_DIRS="/etc"


home_link() {
	Log "${DEFAULTCOLOR}Make symlinks at \"$HOME\""
	local PATH_ARRAY=("$PWD/HOME/"* "$PWD/HOME/".*) #BE CAREFUL! ts return * when there's any files start with dot (if nullglob is disabled)
	for DIR in "${PATH_ARRAY[@]}"; do
		local LINK_NAME=$(basename "$DIR")
		if [ -e "$HOME/$LINK_NAME" ]; then
			Log "${RED}File exist, Could not create \"$LINK_NAME\" symlink"
		else
			local LNCMD=$(ln -s "$DIR" "$HOME" 2>&1)
			if [ $? -eq 0 ]; then
				Log "$DIR -> $HOME/$LINK_NAME"
			else
				Log "${RED}$LNCMD\nStatus code: $?"
			fi
		fi
	done
}

config_home_link() {
	Log "${DEFAULTCOLOR}Make symlinks at \"$XDG_CONFIG_HOME\""
	local PATH_ARRAY=("$PWD/CONFIG_HOME/"*)
	for DIR in "${PATH_ARRAY[@]}"; do
		local LINK_NAME=$(basename "$DIR")
		if [ -e "$XDG_CONFIG_HOME/$LINK_NAME" ]; then
			Log "${RED}File exist, Could not create \"$LINK_NAME\" symlink"
		else
			local LNCMD=$(ln -s "$DIR" "$XDG_CONFIG_HOME" 2>&1)
			if [ $? -eq 0 ]; then
				Log "$DIR -> $XDG_CONFIG_HOME/$LINK_NAME"
			else
				Log "${RED}$LNCMD\nStatus code: $?"
			fi
		fi
	done
}

data_home_link() {
	Log "${DEFAULTCOLOR}Make symlinks at \"$XDG_DATA_HOME\""
	local PATH_ARRAY=("$PWD/DATA_HOME/"*)
	for DIR in "${PATH_ARRAY[@]}"; do
		local LINK_NAME=$(basename "$DIR")
		if [ -e "$XDG_DATA_HOME/$LINK_NAME" ]; then
			Log "${RED}File exist, Could not create \"$LINK_NAME\" symlink"
		else
			local LNCMD=$(ln -s "$DIR" "$XDG_DATA_HOME" 2>&1)
			if [ $? -eq 0 ]; then
				Log "$DIR -> $XDG_DATA_HOME/$LINK_NAME"
			else
				Log "${RED}$LNCMD\nStatus code: $?"
			fi
		fi
	done
}

# MAIN
home_link
config_home_link
