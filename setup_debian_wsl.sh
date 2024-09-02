#!/bin/bash

# Listar distros disponíveis
echo "Listando distribuições disponíveis..."
wsl -l -o

# Ativar o WSL2 e instalar o Debian
echo "Instalando Debian no WSL..."
wsl --install -d Debian

# Atualizar e instalar dependências
echo "Atualizando pacotes..."
sudo apt update && sudo apt upgrade -y

# Instalação do ambiente de desktop (XFCE)
echo "Instalando o ambiente de desktop XFCE..."
sudo apt install xfce4 xfce4-goodies -y

# Instalação do xrdp
echo "Instalando o xrdp..."
sudo apt install xrdp -y

# Configurar o xrdp para usar o XFCE
echo "Configurando o xrdp para usar o XFCE..."
echo "xfce4-session" > ~/.xsession

# Iniciar e habilitar o serviço xrdp
echo "Iniciando e habilitando o serviço xrdp..."
sudo systemctl start xrdp
sudo systemctl enable xrdp

# Configurar o firewall (se necessário)
sudo ufw allow 3389/tcp

# Mensagem final
echo "Configuração concluída! Você pode acessar o Debian via RDP."
echo "Use o cliente de Conexão de Área de Trabalho Remota e conecte-se ao IP do WSL."
