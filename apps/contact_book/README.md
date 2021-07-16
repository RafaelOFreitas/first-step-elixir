# Contact Book

Primeira lib com Elixir, foram utilizados conceitos bases, como:

- Utilização de structs para modelagem de dados;
- Utilização de Maps e funções de manipulação desta estrutura;
- Utilização de Listas e funções de manipulação desta estrutura;
- Manipulação de arquivo `.csv`;
- Manipulação de comandos do `SO`;
- Manipulação de erros com Pattern matching;
- Definição de tasks;
- Dentre outros...

## Para rodar o projeto

- Vamos começar baixando as depêndencias necessárias para o projeto.
  
  ```terminal
    mix deps.get
  ```

- Para o projeto foram utilizadas as seguintes `deps`:
  - [nimble_csv](https://github.com/dashbitco/nimble_csv)
  - [faker](https://github.com/elixirs/faker)
  - [scribe](https://github.com/codedge-llc/scribe)
  
  ```elixir
    defp deps do
      [
        {:nimble_csv, "~> 1.1"}, # Manipulação de arquivos `.csv`.
        {:faker, "~> 0.16"}, # Criação de dados fakes para teste.
        {:scribe, "~> 0.10"} # Exibição de tabelas formatadas com recurso de paginação.
      ]
    end
  ```

- Para criação de dados fakes, basta executar o seguinte comando:
  
  ```elixir
    mix utils.fake_friends
  ```

`OBS: Os dados não são alterados ao rodar este comando e sim inseridos (append).`
`OBS: Na raiz do projeto no arquivo friends.csv disponibilizei alguns dados.`

- Para inicializar o projeto, basta executar as seguintes instrunções:
  
  ```elixir
    iex -S mix 
    ContactBook.init
  ```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)

Have fun! ❤️