# Cards

Segunda lib com Elixir, foram utilizados conceitos bases, como:

- Utilização de lib para documentação;
- Criação de testes unitários;
- Criação de testes unitários por meio da documentação gerada.

## Para rodar o projeto

- Vamos começar baixando as depêndencias necessárias para o projeto.
  
  ```terminal
    mix deps.get
  ```

- Foi utilizada a seguinte dependência:
  - [ex_doc](https://github.com/elixir-lang/ex_doc)
  
  ```elixir
    defp deps do
      [
        {:ex_doc, "~> 0.24"}, # ExDoc é uma ferramenta para gerar documentação para seus projetos Elixir.
      ]
    end
  ```

- Para geração da documentação, basta executar o seguinte comando:
  
  ```elixir
    mix docs
  ```

- Para executar os testes, , basta executar o seguinte comando:

  ```elixir
    mix test
  ```

- Para inicializar o projeto, basta executar as seguintes instruções:
  
  ```elixir
    iex -S mix 
    Cards.create_deck
  ```

`OBS: Leia a documentação para saber como utilizar a lib`

Have fun! ❤️
