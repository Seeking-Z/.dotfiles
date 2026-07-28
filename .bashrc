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

export PATH


set -o vi
