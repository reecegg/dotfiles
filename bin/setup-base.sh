#!/usr/bin/env bash

packages=(
  ## base package group (base install)
  base
  grub
  linux
  linux-firmware
  linux-headers
  ## base-devel package group (base install)
  autoconf
  automake
  bison
  fakeroot
  flex
  gcc
  groff
  libtool
  m4
  make
  patch
  pkgconf
  sudo
  texinfo
  which
  ## xorg package group (base GUI install)
  xf86-video-intel
  xf86-video-vesa
  xorg-bdftopcf
  xorg-docs
  xorg-font-util
  xorg-fonts-100dpi
  xorg-fonts-75dpi
  xorg-fonts-encodings
  xorg-iceauth
  xorg-mkfontscale
  xorg-server
  xorg-server-common
  xorg-server-devel
  xorg-server-xephyr
  xorg-server-xnest
  xorg-server-xvfb
  xorg-sessreg
  xorg-setxkbmap
  xorg-smproxy
  xorg-x11perf
  xorg-xauth
  xorg-xbacklight
  xorg-xcmsdb
  xorg-xcursorgen
  xorg-xdpyinfo
  xorg-xdriinfo
  xorg-xev
  xorg-xgamma
  xorg-xhost
  xorg-xinit
  xorg-xinput
  xorg-xkbcomp
  xorg-xkbevd
  xorg-xkbutils
  xorg-xkill
  xorg-xlsatoms
  xorg-xlsclients
  xorg-xmodmap
  xorg-xpr
  xorg-xprop
  xorg-xrandr
  xorg-xrdb
  xorg-xrefresh
  xorg-xset
  xorg-xsetroot
  xorg-xvinfo
  xorg-xwayland
  xorg-xwd
  xorg-xwininfo
  xorg-xwud
  ## base install (stuff you are always going to install)
  efibootmgr
  networkmanager
  os-prober
  preloader-signed
  ## desktop environment
  i3-gaps
  i3lock
  i3status
  alsa-utils 
  arandr
  autorandr
  clipmenu
  displaylink
  dmenu
  dunst
  evdi
  git
  gnome-keyring
  libqalculate
  light-locker
  lightdm
  lightdm-gtk-greeter
  pavucontrol
  polkit-gnome
  pulseaudio
  pulseaudio-alsa
  pulsemixer
  maim
  ## desktop environment - launcher
  rofi
  rofi-1pass
  rofi-calc
  ## desktop environment - applets
  pasystray
  network-manager-applet
  volumeicon
  ## desktop environment - themeing and fonts
  moka-icon-theme-git
  ## general
  1password  # password manager
  discord
  dolphin
  firefox
  nautilus
  spotify
  teams
  visual-studio-code-bin
  vlc
  xst
  xterm
  ## development
  docker
  docker-compose
  ## development - php
  composer
  php
  ## development - dotnet
  dotnet-runtime
  dotnet-sdk
  nuget
  ## development - python
  bandit
  flake8
  mypy
  python-black
  python-isort
  python-pylint
  semgrep-bin
  ## development - node
  nodejs
  npm
  nvm
  # cli tools
  bat
  htop
  neovim
  nmap
  ranger
  spotify-tui-bin
  tldr
  tmux
  tmuxp
  tree
  usbutils
  vim
  wget
  xclip
  xsel
  zip
  # misc
  etcher-bin
  feh
  # unknown
  dosfstools
  fuse2
  kdegraphics-thumbnailers
  mtools
  percona-server-clients
  # device
  # sof-firmware
)

paru -S --needed ${packages[@]}
