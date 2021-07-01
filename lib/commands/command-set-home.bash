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
echo "My Shell is $MY_SHELL"

case "$MY_SHELL" in
'bash')
    echo "bash"
    "$SHELL $(basedir)/shells/set-home.bash"
  ;;
'fish')
  echo "fish"
  "$SHELL $(basedir)/shells/set-home.fish"
  ;;
'zsh')
    echo "zsh"
    "$SHELL $(basedir)/shells/set-home.zsh"
  ;;
*)
  echo "Shell no supported"
  exit 0
  ;;
esac 
