#!/bin/bash

# Atualizar e instalar dependências
sudo apt update
sudo apt install -y wget tar

# Ativar o WSL2
wsl --install

# Baixar e instalar o NixOS para WSL
wget https://github.com/nix-community/NixOS-WSL/releases/download/21.11/nixos-wsl.tar.gz -O /tmp/nixos-wsl.tar.gz
wsl --import NixOS C:\NixOS C:\NixOS\tmp\nixos-wsl.tar.gz --version 2

# Iniciar o NixOS
wsl -d NixOS -- sudo nix-env -iA nixos.xrdp

# Configurar e iniciar o XRDP
wsl -d NixOS -- sudo systemctl start xrdp
wsl -d NixOS -- sudo systemctl enable xrdp

# Configurar o firewall para permitir conexões RDP
wsl -d NixOS -- sudo ufw allow 3389

echo "Instalação e configuração concluídas. Você pode se conectar ao NixOS via RDP em localhost:3389."

# executar os comandos
# chmod +x setup_nixos_wsl.sh
# ./setup_nixos_wsl.sh