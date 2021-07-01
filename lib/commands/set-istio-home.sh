#!/usr/bin/env bash

function _asdf_istio_absolute_dir_path {
    local absolute_path
    absolute_path="$( cd -P "$( dirname "$1" )" && pwd )"
    echo "$absolute_path"
}

function _asdf_istio_update_istio_home() {
  local isito_home_path
  isito_home_path="$(asdf which istio)"
  if [[ -n "${isito_home_path}" ]]; then
    export ISTIO_HOME
    ISTIO_HOME="$(dirname "$(_asdf_istio_absolute_dir_path "${isito_home_path}")")"
  fi
}

_asdf_istio_update_istio_home