compute_istio_home() {
  echo "ZSH::Setting Istio HOME"
  local istioctl_path
  istioctl_path="$(asdf which istioctl)"
  if [[ -n "${istioctl_path}" ]]; then
    export ISTIO_HOME
    ISTIO_HOME="$(dirname "$(dirname "${istioctl_path:A}")")"
  fi
  echo "ZSH::Set ISTIO_HOME=$ISTIO_HOME"
}

compute_istio_home