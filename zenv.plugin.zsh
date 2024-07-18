#!/usr/bin/env zsh

# https://wiki.zshell.dev/community/zsh_plugin_standard#zero-handling
0="${ZERO:-${${0:#$ZSH_ARGZERO}:-${(%):-%N}}}"
0="${${(M)0:#/*}:-$PWD/$0}"

ZENV_BASE_DIR=${0:h}

ZENV_CACHE_DIR=${ZENV_CACHE_DIR:-${XDG_CONFIG_HOME:-$HOME/.cache}/zenv}
ZENV_FILE=${ZENV_FILE:-.zenv}
ZENV_DEPTH=${ZENV_DEPTH:=0}

fpath+=("${0:h}/functions")

autoload -Uz zenv
autoload -Uz _zenv_entered
autoload -Uz _zenv_completion
compdef _zenv_completion zenv

if [[ -n $ZENV ]]; then
    _zenv_entered
fi
