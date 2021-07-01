compute_istio_home(){
 echo "BASH::Setting Istio HOME"
 local istioctl_path
 istioctl_path="$(asdf which istioctl)"
  if [[ -n "${istioctl_path}" ]]; then
    export ISTIO_HOME
    ISTIO_HOME="$(dirname "$(dirname "${istioctl_path}")")"
  fi
  echo "BASH::Set ISTIO_HOME to $ISTIO_HOME"
}

compute_istio_home