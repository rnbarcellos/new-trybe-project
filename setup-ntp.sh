#!/bin/bash

# Verifica se o GitHub CLI está instalado
if ! command -v gh &> /dev/null
then
    echo "O GitHub CLI não está instalado. Instale-o primeiro antes de continuar."
    exit
fi

# Cria o nome do diretório
project_dir="$HOME/$(whoami)/ntp"

# Cria o diretório se ele não existir
mkdir -p "$project_dir"

# Copia o arquivo new-trybe-project.sh para o diretório do usuário
cp "new-trybe-project.sh" "$project_dir"

# Adiciona o diretório do usuário ao PATH
shell=$(basename "$SHELL")
if [[ "$shell" == "bash" ]]; then
  echo "export PATH=\$PATH:$project_dir" >> "$HOME/.bashrc"
elif [[ "$shell" == "zsh" ]]; then
  echo "export PATH=\$PATH:$project_dir" >> "$HOME/.zshrc"
fi

# Adiciona um alias para o script no arquivo de configuração do shell
echo "alias ntp='$project_dir/new-trybe-project.sh'" >> "$HOME/.$shell"rc

# Mensagem de sucesso
echo "Ambiente configurado com sucesso. Execute 'source ~/.${shell}rc' ou abra um novo terminal para carregar as configurações do shell."
