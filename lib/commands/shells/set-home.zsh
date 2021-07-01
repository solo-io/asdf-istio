compute_istio_home() {
  local istioctl_path
  istioctl_path="$(asdf which istioctl)"
  if [[ -n "${istioctl_path}" ]]; then
    export ISTIO_HOME
    ISTIO_HOME="$(dirname "$(dirname "${istioctl_path:A}")")"
  fi
}

autoload -U add-zsh-hook
add-zsh-hook precmd compute_istio_home