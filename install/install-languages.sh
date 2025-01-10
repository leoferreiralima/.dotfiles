#!/bin/bash

install_zig () {
  curl https://raw.githubusercontent.com/tristanisham/zvm/master/install.sh | bash
  export ZVM_INSTALL="$HOME/.zvm/self"
  export PATH="$PATH:$HOME/.zvm/bin"
  export PATH="$PATH:$ZVM_INSTALL/"

  zvm i --zls 0.13.0 && zvm use 0.13.0
}

