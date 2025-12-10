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

