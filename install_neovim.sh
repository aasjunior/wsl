#!/bin/bash

# Instalação utilizando gerenciador de pacotes winget
winget install Neovim -y

# Configurando variavel de ambiente
setx PATH "$env:PATH;C:\Program Files\Neovim\bin"