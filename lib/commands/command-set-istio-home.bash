set -o pipefail

MY_SHELL=$(basename "$MY_SHELL")

compute_istio_home(){
local istioctl_path
istioctl_path="$(asdf which istioctl)"
local istioctl_bin
istioctl_bin="$( cd -P "$( dirname "$istioctl_path" )" && pwd )"
istio_home="$(dirname "$istioctl_bin")"
echo "$istio_home" 
}
case "$MY_SHELL" in
'fish')
 ;;
*)
export ISTIO_HOME="$(compute_istio_home)"
;;
esac