#!/usr/bin/env bash

basedir() {
  # Default is current directory
  local script=${BASH_SOURCE[0]}

  # Resolve symbolic links
  if [ -L "$script" ]; then
      if readlink -f "$script" >/dev/null 2>&1; then
          script=$(readlink -f "$script")
      elif readlink "$script" >/dev/null 2>&1; then
          script=$(readlink "$script")
      elif realpath "$script" >/dev/null 2>&1; then
          script=$(realpath "$script")
      else
          printf "ERROR: Cannot resolve symbolic link %s" "$script"
          exit 1
      fi
  fi

  local dir
  dir=$(dirname "$script")
  local full_dir
  full_dir=$(cd "${dir}" && pwd)
  echo "${full_dir}"
}

MY_SHELL="$(basename "$SHELL")"
# echo "My Shell is $MY_SHELL"

case "$MY_SHELL" in
'bash')
    echo "bash"
    export ISTIO_HOME
    ISTIO_HOME="$(asdf where istio)"
    echo "BASH::Set ISTIO_HOME to $ISTIO_HOME"
  ;;
'fish')
  echo "fish"
   #TODO
  ;;
'zsh')
    echo "zsh"
    $SHELL export ISTIO_HOME="$(asdf where istio)"
    $SHELL -c "echo ZSH::Set ISTIO_HOME to $ISTIO_HOME"
  ;;
*)
  echo "Shell no supported"
  exit 0
  ;;
esac 
