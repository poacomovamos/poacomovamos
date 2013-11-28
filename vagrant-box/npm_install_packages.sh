#!/bin/sh

if karma --version 2>/dev/null; then
  echo "Karma already installed"
else
  echo "Installing Karma"
  npm install -g karma@canary
fi

if phantomjs --version 2>/dev/null; then
  echo "PhantomJS already installed"
else
  echo "Installing PhantomJS"
  sudo apt-get -y install fontconfig
  npm install -g phantomjs
fi