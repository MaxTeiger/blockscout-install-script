#!/bin/bash

# Update repos
sudo apt-get update && sudo apt-get upgrade -y

# Install deb dependencies
sudo apt install -y git \
    automake \
    libtool \
    gcc \
    libgmp10 \
    libgmp-dev \
    make \
    g++ \
    wget
build-essential

sudo apt-get install -y inotify-tools cargo build-essential autoconf m4 libncurses5-dev libwxgtk3.0-gtk3-dev libwxgtk-webview3.0-gtk3-dev libgl1-mesa-dev libglu1-mesa-dev libpng-dev libssh-dev unixodbc-dev xsltproc fop libxml2-utils libncurses-dev openjdk-11-jdk

# Install rust
curl https://sh.rustup.rs -sSf | sh -s -- -y

# Download asdf
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.10.2
echo ". $HOME/.asdf/asdf.sh" > ~/.bashrc
source ~/.bashrc

# Add plugin node / erlang / elixir
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf plugin add erlang https://github.com/asdf-vm/asdf-erlang.git
asdf plugin add elixir https://github.com/asdf-vm/asdf-elixir.git
