#!/bin/bash

# ======================
# Pop!_OS Setup Script
# Lightweight Dev & Gaming + Security + Custom GUI
# ======================

set -e

# Update and upgrade
sudo apt update && sudo apt upgrade -y

# ------------------
# Shells & Utilities
# ------------------
sudo apt install -y bash-completion zsh git curl wget neofetch unzip ufw

# Optional: Set Zsh as default shell
chsh -s $(which zsh)

# ------------------
# Firewall & Anonymity Tools
# ------------------
sudo apt install -y ufw
sudo ufw enable
sudo ufw default deny incoming
sudo ufw default allow outgoing

# Anonsurf-like tools
sudo apt install -y tor proxychains
# Basic Tor + Proxychains setup; further config can be added later

# ------------------
# Desktop Environment (XFCE with Deepin-like look)
# ------------------
sudo apt install -y xfce4 xfce4-goodies plank arc-theme papirus-icon-theme

# Note: XFCE can be selected at login screen; customize later for Deepin-like look

# ------------------
# Developer Tools (Rust, Node, Embedded, Databases)
# ------------------

# Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
source $HOME/.cargo/env

# Rust tools
cargo install rust-analyzer

# Node + NPM + Yarn
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
sudo apt install -y nodejs
sudo npm install -g yarn

# Tauri prerequisites
sudo apt install -y libwebkit2gtk-4.0-dev build-essential curl wget libssl-dev libgtk-3-dev squashfs-tools

# Rust Web Frameworks
cargo install trunk
cargo install wasm-pack

# Embedded Dev Tools (AVR, ARM, ESP, Raspberry Pi, STEM boards)
sudo apt install -y gcc-avr avr-libc avrdude gcc-arm-none-eabi gdb-multiarch openocd minicom esptool picocom

# Arduino CLI
curl -fsSL https://raw.githubusercontent.com/arduino/arduino-cli/master/install.sh | sh
sudo mv bin/arduino-cli /usr/local/bin/

# Raspberry Pi toolchain
sudo apt install -y cmake ninja-build

# ------------------
# IDEs & Editors
# ------------------
sudo apt install -y sublime-text neovim

# Neovim plugin tools
sudo apt install -y python3-pip
pip3 install pynvim

# Prettier & IntelliSense (Neovim)
sudo npm install -g prettier eslint

# ------------------
# Databases
# ------------------
sudo apt install -y sqlite3 mysql-server postgresql

# ------------------
# Media Tools
# ------------------
sudo apt install -y vlc gimp inkscape obs-studio shotcut

# ------------------
# Web Browsers
# ------------------
sudo apt install -y firefox

# ------------------
# Optional: Cleaning
# ------------------
sudo apt autoremove -y

# ------------------
# Done
# ------------------
echo "\n✅ Setup complete. Reboot your system and select XFCE from the login screen gear icon."
echo "➡️  Use plank for a dock. Apply Papirus icons and Arc theme from XFCE settings for a Deepin-like look."
echo "➡️  Anonsurf-style setup ready with Tor + proxychains."
echo "➡️  Rust, Node, Embedded Dev, media tools, and databases installed."
