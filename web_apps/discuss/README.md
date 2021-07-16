# Discuss

To start your Phoenix server:

- Install dependencies with `mix deps.get`
- Create and migrate your database with `mix ecto.setup`
- Install Node.js dependencies with `npm install` inside the `assets` directory
- Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

- Official website: https://www.phoenixframework.org/
- Guides: https://hexdocs.pm/phoenix/overview.html
- Docs: https://hexdocs.pm/phoenix
- Forum: https://elixirforum.com/c/phoenix-forum
- Source: https://github.com/phoenixframework/phoenix

___

### Phoenix Keywords

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
  
### Conn

- What is Conn?
