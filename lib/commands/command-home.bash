set -o pipefail
set +x

MY_SHELL=$(basename "$MY_SHELL")

zsh_compute_istio_home() {
  echo "2"
  local istioctl_path
  istioctl_path="$(asdf which istioctl)"
  if [[ -n "${istioctl_path}" ]]; then
    export ISTIO_HOME
    ISTIO_HOME="$(dirname "$(dirname "${istioctl_path:A}")")"
    echo "3"
  fi
}

bash_compute_istio_home(){
 local istioctl_path
 istioctl_path="$(asdf which istioctl)"
  if [[ -n "${istioctl_path}" ]]; then
    export ISTIO_HOME
    ISTIO_HOME="$(dirname "$(dirname "${istioctl_path:A}")")"
  fi
}

case "$MY_SHELL" in
'fish')
 ;;
'zsh')
  echo "1"
  autoload -U add-zsh-hook
  add-zsh-hook precmd zsh_compute_istio_home
 ;;
*)
bash_compute_istio_home
;;
esac  