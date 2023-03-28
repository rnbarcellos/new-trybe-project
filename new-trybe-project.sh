#!/bin/zsh -e

if [ $# -eq 0 ]; then
  echo "Informe o endereço SSH do repositório como argumento."
  exit 1
fi

ssh_repo="$1"

# Extrai o nome do projeto do caminho do repositório
project_name=$(basename "$ssh_repo" .git)

# Remove o prefixo "sd-000-x-" do nome do projeto usando uma expressão regular
project_name=$(echo "$project_name" | sed 's/sd-000-x-//')

# Cria o nome da nova branch com base no padrão "nome-do-projeto"
new_branch_name="seu-nome-${project_name}"

# Converte o nome do projeto para título de Pull Request
project_name_title=$(echo "$project_name" | sed -e 's/\b\w/\u&/g' | sed 's/-/ /g')
pr_title="[Seu Nome] $project_name_title"

# Clone o repositório
git clone "$ssh_repo"

# Entre no diretório clonado
cd "sd-000-x-$project_name"

# Instala as dependências
npm i

# Cria uma nova branch
git checkout -b "$new_branch_name"

# Faz um commit vazio
git commit --allow-empty -m "starting project"

# Faz push da nova branch para o repositório remoto
git push -u origin "$new_branch_name"

# Cria o Pull Request
gh pr create -a "@me" -t "$pr_title"
