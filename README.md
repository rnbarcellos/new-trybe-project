# ntp - new-trybe-project

Ferramenta Shel Script para inicialização de projetos individuais da Trybe

## Dependências externas

### GitHub CLI

A primeira dependência para utilizar a ferramenta é o **GitHub CLI**, a interface para linha de comando oficial do GitHub. Usamos ela principalmente para agilizar a criação do novo repositório onde ficará seu código.

1. Siga as instruções do [site oficial](https://cli.github.com/) para a instalação adequada ao seu Sistema Operacional;
2. Após a instalação, faça login com o comando `gh auth login`. Esse processo pode ser um pouco confuso :dizzy_face:, mas seguindo as dicas abaixo ficará tudo bem :green_heart:

<details>
<summary style='font-size: 25px'>Clique aqui para ver dicas para o comando <tt>gh auth login</tt> :eyes: </summary>

- Você receberá a opção entre `Github.com` e `Enterprise Server`: escolha `Github.com`;
- Você receberá a opção entre `HTTPS` e `SSH`: escolha `SSH`;
- Você receberá a opção de escolher o arquivo com a chave `SSH` configurada no seu computador, que deve ser algo semelhante a `~/.ssh/id_rsa.pub` ou `~/.ssh/id_ed25519`: escolha o arquivo oferecido;
- Você receberá a opção de definir um título para a chave SSH: aperte `Enter` para escolher a opção padrão;
- Você receberá a opção entre `Login with a web browser` e `Paste an authentication Token`: escolha `Login with a web browser`;
- Você receberá um código no formato `XXXX-XXXX` e a ferramenta aguardará você apertar `Enter`;
- Após apertar `Enter` será aberta uma janela no seu navegador para inserir o código anterior, e seguir com o login padrão do GitHub;
- Após finalizar o login no navegador, o terminal aguardará  você apertar `Enter`;
- Fim. :tada:
</details>

Para validar se deu tudo certo, utilize o comando a seguir:

```bash
gh auth status
```

---

## Configuração do `ntp`

Além do GitHub CLI, também é necessário configurar a própria ferramenta `ntp`:

1. Faça o clone deste repositório;
2. Entre na pasta gerada;
3. Execute o script de configuração _(e siga as instruções)_.

Para executar os 3 passos anteriores de forma rápida, basta copiar o comando a seguir:
```sh
git clone git@github.com:rnbarcellos/new-trybe-project.git ~/new-trybe-project && \
cd ~/new-trybe-project && \
bash setup-ntp.sh
```

4. Reinicie o seu terminal fechando-o e abrindo novamente ou executando o seguinte comando

```sh
source ~/.bashrc
```
ou
```sh
source ~/.zshrc
```

5. Configure o seu nome no script, por exemplo:

```sh
sed -i 's/seu-nome/joao-silva/g;s/\[Seu Nome\]/\[João Silva\]/g' "$HOME/ntp/new-trybe-project.sh"
```

## Como utilizar

1. Acesse na sua máquina o diretório dos seus projetos da Trybe. Exemplo:

```bash
cd trybe/projetos/sd-00-x-project-zoo-functions
```

2. Execute o seguinte comando, substituindo os parâmetros

```bash
ntp <ssh-do-repositorio>
```

O script irá clonar o repositório, acessá-lo, instalar as dependências e abrir um PR no formato [Seu Nome] Nome do Projeto.

---

## Entendo os scripts

### Script `ntp`

**Esse é o script principal** que fará todo o processo de clonar o repositório do projeto e abertura do PR.

Os seguintes passos acontecem:

- Clona o repositório para o diretório em que o comando foi executado;
- Instala as dependências do projeto
- Cria uma nova branch no padrão `seu-nome-projeto`
- Faz um commit inicial
- Executa o primeiro git push
- Abre um novo pull request

> [ :warning: **Importante** :warning: ] Para que o comando funcione, é PRECISO passar um SSH como argumento. HTTPS e CLI não funcionarão.

### Script `setup-ntp.sh`

Este é um script auxiliar para criar o comando `ntp` e não precisar digitar todo o caminho do diretório que o `new-trybe-project.sh` estiver.

Ele executa apenas duas ações:

1. Adiciona o caminho do script `ntp` ao PATH do arquivo de configuração do Shell;

2. Criar um alias para que possamos executar um comando curto e mais simples.

É isso! Faça bom proveito :wink: