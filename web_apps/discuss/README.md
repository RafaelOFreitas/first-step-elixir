# Discuss

- Um CRUD simples utilizando `Postgres`;
- Utilzação de SSR.
- Autenticação via GitHub;
- Criação de Plugins para controle de requisição AAA (autenticação/autorização).
- Criação de WebSocket para transmição de mensagens (comentários de posts) clientes conectados.

## Para iniciar seu servidor Phoenix

- Crie seu aplicativo GitHub e baixe as chaves de API seguindo as instruções: [create-github-app-guide.md](https://github.com/dwyl/elixir-auth-github/blob/master/create-github-app-guide.md)
- Disponibilizei o arquivo `docker-compose.yml`, para que você não precise configurar o banco de dados `Postgres` ou o client `pgAdim`.
  - Execute `docker-compose up` na raiz do projeto, com o `docker` inicializado.
- Instale dependências com `mix deps.get`
- Crie e migre seu banco de dados com `mix ecto.setup`
- Instale as dependências do Node.js com `npm install` dentro do diretório `assets`
- Inicie o endpoint Phoenix com `mix phx.server`

Agora você pode visitar [`localhost:4000`](http://localhost:4000) do seu navegador.

___

## Phoenix Keywords

Na minha visão essa é uma ótima definição sobre esse conjunto de palavras chaves.

- `Import`
  - Tire todas as funções deste módulo e dê-as a este outro módulo.
- `Alias`
  - Dê-me um atalho para este outro módulo, meus dedos são preguiçosos.
- `Use`
  - Eu quero fazer uma configuração muito, muito ... muito chique.

___

### Entendendo compartilhamento de código no Phoenix

- Todos os nossos `Controllers` obtêm comportamento de
  - Phoenix.Controller
    - Discuss.Repo
    - Ecto
    - Ecto.Query
    - DiscussWeb.Router.Helpers
    - DiscussWeb.Gettext
- Todos os nossos `Models` obtêm comportamento de
  - Ecto.Schema
    - Ecto
    - Ecto.Changeset
    - Ecto.Query
- Todas as nosssas `Views` obtêm comportamento de
  - Phoenix.View
    - Phoenix.Controller
    - Controller.HTML
    - DiscussWeb.Router.Helpers
  
___

### Fluxo Request Phoenix

1. Solicitação de entrada;
2. Verificação de solicitação HTML;
3. Verificação de sessão;
4. Verificação de segurança;
5. Inclusão de cabeçalhos HTTP ao navegador;
6. Verificação de acesso da solicitação;
7. Formulação de solicitação de retorno.

___

### Validação de dados

- Struct
  - Um hash que contém alguns dados.
  - Representa um registro (ou um registro que queremos salvar) no banco de dados.
- Params
  - Um hash que contém as propriedades com as quais queremos atualizar a estrutura.
- Cast
  - Produz um conjunto de alterações (Changeset).
- Validators
  - Adiciona erros ao conjunto de alterações (Changeset).
- Changeset
  - Sabe dos dados que estamos tentando salvar e se há ou não problemas de validação com eles.
- [Veja mais aqui](https://hexdocs.pm/phoenix/ecto.html).

___

## Saber mais

- Official website: https://www.phoenixframework.org/
- Guides: https://hexdocs.pm/phoenix/overview.html
- Docs: https://hexdocs.pm/phoenix
- Forum: https://elixirforum.com/c/phoenix-forum
- Source: https://github.com/phoenixframework/phoenix
- [Phoenix-bootcamp](https://www.udemy.com/course/the-complete-elixir-and-phoenix-bootcamp-and-tutorial/)
  
Have fun! ❤️
