#!/usr/bin/env bash

set -euo pipefail

HELP="
asdf istio COMMAND
COMMANDS
   set istio home   -   Set the environment variable ISTIO_HOME set to the current Istio install that is used.
   help             -   Show this help
"

_asdf_istio_absolute_dir_path() {
    local absolute_path
    absolute_path="$( cd -P "$( dirname "$1" )" && pwd )"
    echo "$absolute_path"
}

set_istio_home() {
  local my_shell
  my_shell=$(basename "$SHELL")
  local istioctl_path
  istioctl_path="$(asdf which istioctl)"
  ISTIO_HOME_PATH="$(_asdf_istio_absolute_dir_path "${istioctl_path}")"
  if [[ -n "${istioctl_path}" ]]; then
    case "$my_shell" in 
    'fish')
      $SHELL set -gx ISTIO_HOME "$ISTIO_HOME_PATH"
      ;;
    *)
    ISTIO_HOME="$ISTIO_HOME_PATH"
    esac
  fi
}

case "$*" in
'set istio home')
    export ISTIO_HOME
    set_istio_home
    ;;
*)
    echo "$HELP"
    exit 0
    ;;
esac