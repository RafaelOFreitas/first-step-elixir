# Identicon

Um Identicon é uma representação visual de um valor hash, geralmente de números IP, servindo para identificar um usuário sistema; semelhante a avatares. O Identicon original consiste de uma gráfico de 9 blocos, que então foi estendido a outros gráficos por outras criações, algumas usando MD5 em vez do endereço de IP.

Terceira lib com Elixir, foram utilizados conceitos bases, como:

- Utilização de structs para modelagem de dados;
- Utilização de Maps e funções de manipulação desta estrutura;
- Manipulação de funções do `Erlang` (`:crypto.hash`, `:binary`);
- Manipulação de comandos do `SO`.
- Manipulação de imagens com o módulo [egd](http://erlang.org/documentation/doc-6.1/lib/percept-0.8.9/doc/html/egd.html) do `Erlang`.
  
## Para rodar o projeto

- Vamos começar baixando as depêndencias necessárias.
  
  ```terminal
    mix deps.get
  ```

- Foi utilizada a seguinte dependência:
  - [ex_doc](https://github.com/elixir-lang/ex_doc)
  
  ```elixir
    defp deps do
      [
        {:egd, github: "erlang/egd"}, # Módulo Erlang para manipulação gráfica.
      ]
    end
  ```

- Para inicializar o projeto, basta executar as seguintes instruções:
  
  ```elixir
    iex -S mix 
    Identicon.main "banana"
  ```

`OBS: Com isso um novo Identicon será gerado na pasta generated.`

Have fun! ❤️