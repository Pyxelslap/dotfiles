#!/bin/env bash

set -euo pipefail

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

# Colors
RED="\033[38;5;9m"
GREEN="\033[38;5;10m"
YELLOW="\033[38;5;11m"
GRAY="\033[38;5;15m"
DEFAULTCOLOR="\033[0m"

Log() {
	printf "[$(date "+%Y-%m-%d %H:%M:%S %Z")] ${GRAY}$1\n${DEFAULTCOLOR}"
}

config_home_link() {
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
config_home_link
