#
# ~/.bashrc
#


# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '


# v2rayN proxy
export HTTP_PROXY="http://127.0.0.1:10808"
export HTTPS_PROXY="http://127.0.0.1:10808"
export ALL_PROXY="socks5://127.0.0.1:10808"
export NO_PROXY="localhost,127.0.0.1,::1"


# SSH_AUTH_SOCK
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

# Add path
path_append() {
    case ":$PATH:" in
        *":$1:"*) ;;
        *) PATH="$PATH:$1" ;;
    esac
}

path_append "$HOME/.local/bin/scripts"
path_append "$HOME/.local/bin/"

export PATH


# Disable alternate screen buffer for Claude Code (restore v2.1.89 behavior)
export CLAUDE_CODE_DISABLE_ALTERNATE_SCREEN=1

set -o vi

# llm via cc-switch with Nvidia model
llm-nvidia() {
    llm openai endpoint http://127.0.0.1:15721/v1 -m nvidia/nemotron-3-ultra-550b-a55b "$@"
}
