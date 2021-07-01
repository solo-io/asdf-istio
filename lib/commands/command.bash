#!/usr/bin/env bash

set -euo pipefail

HELP="
asdf istio COMMAND
COMMANDS
   set istio home   -   Set the environment variable ISTIO_HOME set to the current Istio install that is used.
   help             -   Show this help
"

function _asdf_istio_absolute_dir_path {
    local absolute_path
    absolute_path="$( cd -P "$( dirname "$1" )" && pwd )"
    echo "$absolute_path"
}

function set_istio_home() {
  local istioctl_path
  istioctl_path="$(asdf which istioctl)"
  if [[ -n "${iistioctl_path}" ]]; then
    export ISTIO_HOME
    ISTIO_HOME="$(dirname "$(_asdf_istio_absolute_dir_path "${istioctl_path}")")"
  fi
}

case "$*" in
'set istio home')
    set_istio_home
    ;;
*)
    echo "$HELP"
    exit 0
    ;;
esac