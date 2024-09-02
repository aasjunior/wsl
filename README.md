# Guia Passo a Passo: Configurando Ubuntu no WSL2 e Acesso Remoto via RDP

Este guia descreve como configurar o Ubuntu no Windows Subsystem for Linux (WSL2) e conectar-se a ele via Remote Desktop Protocol (RDP).

## 1. Ativando o WSL2

1. Abra o **Painel de Controle** do Windows.
2. Vá para **Programas** > **Ativar ou desativar recursos do Windows**.
3. Marque a opção **Subsistema do Windows para Linux** e clique em **OK**.
4. Reinicie o computador se necessário.

## 2. Instalando o Ubuntu no WSL2

1. Abra o **Windows Terminal** ou **Prompt de Comando**.
2. Execute o comando para instalar a distribuição padrão do Linux (geralmente o Ubuntu):
   ```bash
   wsl --install
   ```

## 3. Configurando o SSH no Ubuntu

1. Abra o terminal do Ubuntu no WSL2.
2. Atualize a lista de pacotes do sistema:
   ```bash
   sudo apt update && sudo apt upgrade
   ```
3. Instale o servidor SSH (OpenSSH Server):
   ```bash
   sudo apt install openssh-server
   ```
4. Inicie o serviço SSH e habilite-o para iniciar automaticamente com o sistema:
   ```bash
   sudo service ssh start
   sudo systemctl enable ssh
   ```

## 4. Configurando o Firewall e a Porta RDP

1. Desative temporariamente o firewall do Ubuntu (se necessário):
   ```bash
   sudo ufw disable
   ```
2. Permita conexões na porta 3389 (RDP) via TCP:
   ```bash
   sudo ufw allow 3389/tcp
   ```
3. Verifique se a regra foi aplicada corretamente:
   ```bash
   sudo ufw status
   ```

## 5. Instalando e Configurando o XRDP

1. No terminal do Ubuntu, instale o XRDP:
   ```bash
   sudo apt install xrdp
   ```
2. Inicie o serviço XRDP e habilite-o para iniciar automaticamente no boot:
   ```bash
   sudo systemctl start xrdp
   sudo systemctl enable xrdp
   ```

## 6. Conectando-se via RDP

1. No Windows, abra **Área de Trabalho Remota** (digite `mstsc` no menu Iniciar).
2. Insira o endereço IP do seu Ubuntu (use `localhost` ou o IP específico encontrado via `ip addr` no Ubuntu).
3. Conecte-se com suas credenciais do Ubuntu.

## 7. Alterando a Distribuição Padrão do WSL

1. Abra o **Prompt de Comando** ou **Windows Terminal**.
2. Defina o Ubuntu como a distribuição padrão:
   ```bash
   wsl --setdefault Ubuntu
   ```

## 8. Configurando o Acesso Remoto via SSH (Opcional)

1. No terminal do Ubuntu, verifique o endereço IP:
   ```bash
   ip addr
   ```
2. No **Painel de Controle do Windows**, vá para **Sistema e Segurança** > **Firewall do Windows**.
3. Clique em **Permitir um aplicativo ou recurso pelo Firewall do Windows**.
4. Marque **OpenSSH Server** para permitir conexões em redes privadas e públicas.
