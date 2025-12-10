#!/bin/env bash

source ./log.sh
# cat ../../profiles/bash.txt >> $HOME/.bashrc

if [ -f /etc/os-release ]; then
    . /etc/os-release
    if [ -n "$ID" ]; then
        case "$ID" in
            ubuntu|debian)
                Log "Detected Debian-based system: $PRETTY_NAME"
					 source ./distros/universal.sh
					 installnvim
                ;;
            fedora|centos|rhel)
                Log "Detected RHEL-based system: $PRETTY_NAME"
                ;;
            arch)
                Log "Detected Arch Linux: $PRETTY_NAME"
                ;;
            alpine)
                Log "Detected Alpine Linux: $PRETTY_NAME"
                ;;
            *)
                Log "Detected other Linux distribution: $PRETTY_NAME (ID: $ID)"
                ;;
        esac
    else
        Log "Could not determine distribution ID from /etc/os-release."
    fi
elif type lsb_release >/dev/null 2>&1; then
    # Fallback for older systems without /etc/os-release, using lsb_release
    DISTRO=$(lsb_release -si)
    Log "Detected distribution via lsb_release: $DISTRO"
elif [ -f /etc/redhat-release ]; then
    Log "Detected RedHat-based system via /etc/redhat-release."
elif [ -f /etc/debian_version ]; then
    Log "Detected Debian-based system via /etc/debian_version."
elif [ -f /etc/arch-release ]; then
    Log "Detected Arch Linux via /etc/arch-release."
elif [ -n $OSTYPE ]; then
	case "$OSTYPE" in
		"linux-android")
			Log "${GREEN}Detected Android"
			;;
	esac
else
    Log "Could not determine Linux distribution."
fi
