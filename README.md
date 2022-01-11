# asdf-vm plugin for Istio

The [asdf-vm](https://asdf-vm.com/) plugin to install and manage multiple [Istio]( https://istio.io) versions.

## Pre-requisites

- [asdf-vm](https://asdf-vm.com/)
- [bash v5.0](https://www.gnu.org/software/bash/)
- [wget](https://www.gnu.org/software/wget/)

## Install

```shell
asdf plugin-add istio https://github.com/solo-io/asdf-istio
```

## List Installable Istio versions

```shell
asdf list-all istio
```

## Download and install latest

```shell
asdf install istio latest
```

## Download and install specific version

```shell
asdf install istio 1.11.5
```

## Use

To make your Istio/Kubernetes projects use a specific version of Istio, run the following command from the root of project:

```shell
# e.g. asdf local istio 1.11.5
asdf local istio <istio-verison>
```

The command will create a `.tools-version` in the local project directory pointing to the Istio version passed argument. The path will now be adjusted to use the Istio version used in the command

To set a Istio version globally, run:

```shell
asdf global istio <istio-version>
```

Once you have set the Istio version using `asdf global` or `asdf local` commands, you can set the `ISTIO_HOME` variable using the command,

```shell
export ISTIO_HOME=$(asdf where istio)
```

## License

[Apache License v2](./LICENSE)
