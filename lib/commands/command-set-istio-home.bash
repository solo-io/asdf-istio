#!/usr/bin/env bash

set -euo pipefail

istioctl_path="$(asdf which istioctl)"
export ISTIO_HOME
ISTIO_HOME="$( cd -P "$( dirname "$istioctl_path" )" && pwd )"