#!/bin/env bash

set -euo pipefail
shopt -s nullglob

source ./scripts/bash/log.sh
source ./scripts/bash/XDG_Base_Directories.sh

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

USAGE() {
	echo "Usage: $0 [OPTIONS]"
	echo ""
	echo "Automatically install configuration for new machine"
	echo ""
	echo "Options:"
	echo "  -h, --help	      Show this help message and exit"
	echo "  -l, --no-install    Only configure symlinks"
	echo ""
	echo "Examples:"
	echo "  $0 -l"
	echo "  $0 --no-install"
}

# MAIN
main() {
	home_link
	config_home_link
}

# FLAG
OPTIONS="lh"
LONGOPTIONS="no-install,help"

PARSED_ARGS=$(getopt -o $OPTIONS --long $LONGOPTIONS -- "$@")
if [ $? -ne 0 ]; then
    echo "${RED}Error: Failed to parse options."
    exit 1
fi

# Re-assign parsed arguments to positional parameters
eval set -- "$PARSED_ARGS"

# Run this if no options 
if [ "$1" == "--" ]; then
	main
	bash ./scripts/bash/install.sh
fi
# Process parsed arguments
while [ -n "$1" ]; do
    case "$1" in
        -l|--no-install)
			  main
            shift
            ;;
        -h|--help)
			  USAGE
				exit 0
				shift
            ;;
        --)
            shift # Shift past the -- separator
            break # End of options
            ;;
        *)
            echo "${RED}Internal error or unhandled option: $1"
            exit 1
            ;;
    esac
done

