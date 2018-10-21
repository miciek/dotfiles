# dotfiles
This repo contains all my settings and scripts used in day-to-day electronic life. The basic setup:
- Lubuntu 16.04 with i3 and oh-my-zsh
- Mac OSX with iTerm2 and oh-my-zsh

There are also some scripts used to mount backup local ftp server and remote shell.

## asdf
`.tool-versions` file is the configuration file for [asdf](https://github.com/asdf-vm/asdf). Each plugin needs to be added manually using `asdf plugin-add` and only then `asdf install` can install and/or synchronize all versions.

Note that some `asdf` plugins require `gpg` tool and imported keys. Execute `bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring` before running `asdf install`.

## Provisioning
The files in this repository are used to automatically provision my workstation from scratch. See [my-machine-provisioning repo](https://github.com/miciek/my-machine-provisioning) for more information.

