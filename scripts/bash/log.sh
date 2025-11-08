#!/bin/env bash

# Colors
RED="\033[38;5;9m"
GREEN="\033[38;5;10m"
YELLOW="\033[38;5;11m"
GRAY="\033[38;5;15m"
DEFAULTCOLOR="\033[0m"

Log() {
	printf "[$(date "+%Y-%m-%d %H:%M:%S %Z")] ${GRAY}$1\n${DEFAULTCOLOR}"
}
