#!/usr/bin/env bash

mkdir /tmp/paru-install
cd /tmp/paru-install
sudo pacman -S --needed base-devel git
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
