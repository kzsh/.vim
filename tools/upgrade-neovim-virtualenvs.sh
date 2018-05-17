#!/bin/bash
set -e

main() {
  export PYENV_ROOT=$HOME/.pyenv
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
  pyenv activate neovim2
  install_packages
  pyenv deactivate

  pyenv activate neovim3
  install_packages
  pyenv deactivate
}

install_packages() {
  pip install --upgrade neovim
  pip install --upgrade vim-vint
}

main "$@"
