set -o pipefail

MY_SHELL=$(basename "$MY_SHELL")

case "$MY_SHELL" in
'fish')
 ;;
*)
istioctl_path="$(asdf which istioctl)"
export ISTIO_HOME
ISTIOCTL_BIN="$( cd -P "$( dirname "$istioctl_path" )" && pwd )"
ISTIO_HOME="$(dirname "$ISTIOCTL_BIN")"
;;
esac