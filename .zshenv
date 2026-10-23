# Local executable paths
typeset -U path PATH
path=(
    $path
    "$HOME/.local/bin"
    "$HOME/.local/bin/scripts"
)

# v2rayN proxy
export HTTP_PROXY="http://127.0.0.1:10808"
export HTTPS_PROXY="http://127.0.0.1:10808"
export ALL_PROXY="socks5://127.0.0.1:10808"
export NO_PROXY="localhost,127.0.0.1,::1"

# SSH agent
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

# Claude Code
# export CLAUDE_CODE_DISABLE_ALTERNATE_SCREEN=1
