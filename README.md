# Primeiros passos com Elixir e Programação Funcional

## Erlang

- Linguagem de programação funcional introduzida em 1986 por Ericsson;
  - Sistemas de telecomunicações.
- Destina-se a construir sistemas confiáveis, de alto desempenho, escalonáveis ​​e tolerantes a falhas;
  - Usado no WhatsApp, Heroku, RabbitMQ.
- Orientado para simultaneidade:
  - Pode ter milhares de processos isolados;
  - BEAM (Erlang VM) usa agendadores e distribui a execução do processo;
  - Processos se comunicam com mensagens assíncronas.
- O código Erlang é compilado em bytecode executado pelo BEAM;
  - O BEAM cuida de todo o processo, isolamento etc.
- Incorpora a estrutura Open Telecom Platform (OTP);
  - Ferramentas para construir sistemas simultâneos, detecção de erros, empacotamento de código e mais.
- Fornece outras ferramentas prontas para usar:
  - ETS / DETS;
  - Banco de dados Mnesia NoSQL.
  
___

## Elixir

- [Elixir](https://elixir-lang.org/) é uma [Linguagem de programação](https://github.com/elixir-lang/elixir) funcional para a construção de aplicativos escaláveis ​​e de fácil manutenção;
  - Apresentada em 2012 por José Valim [@josevalim](https://github.com/josevalim).
- Elixir aproveita o [Erlang VM](http://erlang.org/faq/implementations.html), conhecido por executar sistemas de baixa latência, distribuídos e tolerantes a falhas;
- Permite escrever um código mais limpo e expressivo;
  - O código é geralmente dividido em muitas funções pequenas.
- Você ainda tem acesso a todos os recursos do Erlang;
- Fornecido com ferramenta mix para inicializar novos projetos, compilar código etc;
- O gerenciador de pacotes Hex é usado para instalar pacotes adicionais;
  - hex.pm.
- O Elixir é usado com sucesso em desenvolvimento web, software embarcado, ingestão de dados e processamento de multimídia em uma ampla gama de indústrias;
- Tem uma estrutura web MVC com Phoenix;
- Erlang e Elixir não são muito rápidos;
  - Foi criado para resolver outros problemas e gira em torno de escalabilidade e simultaneidade.
- O ecossistema em geral não é tão grande;
  - Comparando, por exemplo, com a comunidade do javascript, python ou ruby, por exemplo.
- Todos os dados são imutáveis;
  - Muito importante devido à natureza orientada para a simultaneidade do Elixir;
  - Se você precisar alterar os dados, você produz sua cópia;
  - Basicamente, você transforma os dados e a programação funcional trata-se disso.
- Não há ciclo (apenas recursão);
- Elixir suporta metaprogramação;
- Elixir é dinâmico, então a variável não precisa ser declarada;
- O nome da variável deve começar com undescore ou caractere minúsculo;
- Variáveis ​​são geralmente escritas em minúsculo com palavras separadas por undescores;
- Os nomes podem conter `!` E `?`:
  - grand_total;
  - _options;
  - my_file;
  - valid?.
- [Introdução completa](https://elixir-lang.org/getting-started/introduction.html).
  
___

## Princípios da Programação Funcional

- O que é [programação funcional](https://sookocheff.com/post/fp/what-is-functional-programming/);
- [First-class functions (Funções de primeira classe)](https://culttt.com/2016/05/09/functions-first-class-citizens-elixir/);
- [Pure functions (Funções pura)](https://medium.com/pragmatic-programmers/pure-vs-impure-functions-2122251a928);
- [Immutable variables (Variáveis ​​imutáveis)](https://darioghilardi.com/immutability-in-elixir/);
- [Recursion (Recursão)](https://damonvjanis.medium.com/recursive-functions-in-elixir-93a118c69db7);
- [Non-strict evaluation (Avaliação não rigorosa)](https://www.sciencedirect.com/science/article/abs/pii/S0096055101000066);
- [Pattern matching (Correspondência de padrões)](https://medium.com/flatiron-labs/perfect-match-pattern-matching-in-elixir-9d49ced20b07).

___

## Instalação do Elixir

- As instruções para instalação em cada sistema operacional podem ser encontradas em Elixir-lang.org na aba [Install](https://elixir-lang.org/install.html);
- Para mais informações clique [aqui](https://elixirschool.com/pt/lessons/basics/basics/#primeiros-passos).

___

### Olá Mundo

- Na pasta `learning_sintax` do projeto temos o arquivo say.ex, onde podemos testar nosso primeiro fonte com Elixir;
- Para compilar o arquivo para `BEAM` Erlang VM, executamos a seguinte instrução no terminal;

  ```terminal
      ╰─ user: elixirc say.ex 
  ```

- Para executar basta utilizar o modo interativo [IEx](https://elixirschool.com/pt/lessons/basics/basics/#modo-interativo) e chamar a função criada, assim teremos nosso querido `Hello World!`.

  ```terminal
      ╰─ user: iex
      ╰─ iex(1)> Say.hello
      "Hello World!"
      ╰─ iex(2)>
  ```

___

### Elixirc

- Binário que permite a compilação de código Elixir;
- Os arquivos devem possuir a extensão `.ex`;
  
  `say.ex -> elixirc say.ex -> Elixir.Say.beam`

- Use o `.exs` para código de scripting, sem compilação prévia;
- Na raiz do projeto temos o arquivo `hello.exs`, nosso segundo fonte com `Elixir`;
- Para executar basta no terminal executar a seguinte instrução.

  ```terminal
  ╰─ elixir hello.exs                                 
  Hello World!
  ```

___

### Funcionamento geral do Elixir

- O Elixir é baseado em Módulos e Funções;
- Módulos:
  - É a forma usada para agrupar diversas funções. Exemplo:
    - [String](https://hexdocs.pm/elicir/String.html);
    - [IO](https://hexdocs.pm/elixir/IO.html).
- Funções:
  - São as ações de fato:
    - IO.puts("Hello World!");
    - IO.puts "Hello World!" `#Parênteses são opcionais`.
  - Aridade das funções:
    - Quantidade de argumentos de uma função;
    - IO.puts/1.

___

### Conhecendo um pouco mais o IEx

- Para saber mais clique [aqui](https://hexdocs.pm/iex/IEx.html);
- Existem diversos `Helpers no IEx` que podem ser acessados ditando-se o `h()`:
  - Todos os `helpers` são mostrados com a sua respectiva aridade da função;
  - Podemos `pedir ajuda` sobre qualquer módulo ou função, bastando para isso invocar o `h(<nome do módulo ou função>)`. Ex: h(Enum) ou h(Enum.map);
  - Podemos `inspecionar` qualquer valor usando `i(<valor>)`. Ex: i("olá");
  - Existem vários outros helpers como o `i/1` para `inspecionar` um elemento ou o `r/1`, que nesse caso permite `recompilar` um módulo informado;
  - Você pode `pedir ajuda` sobre os próprios helpers, bastando para isso invocar `h(<helper>)` para conhecê-lo. Ex: h(v/o).
- Use `CRTL+K` ou `clear/0` para `limpar o terminal`;
- Podemos usar a tecla `TAB` para `autocompletar` o nome de módulos ou funções;
- Para `sair do IEx`:
  - Você pode pressionar `CRTL+C` duas vezes;
  - Pressionar `CRTL+C` e em seguida `q`;
  - Ou ainda pode pressionar `CRTL+\`.

___

### Tudo é uma expressão

- No Elixir tudo é uma expressão;
- Expressão != Instrução;
- Toda expressão possui retorno;
  
  ```elixir
    IO.puts("Hello")
    hello
    :ok
  ```

- Esse é um princípio da programação funcional (Statements).
  
___

### Conhecendo os Tipos Básicos

- Aprenda mais [aqui](https://elixirschool.com/pt/lessons/basics/basics/#tipos-b%C3%A1sicos).

  | Valor         | Tipo            |
  | ------------- | --------------- |
  | iex> 1        | # integer       |
  | iex> 1.0      | # float         |
  | iex> 0x1F     | # integer       |
  | iex> true     | # boolean       |
  | iex> :atom    | # atom / symbol |
  | iex> "elixir" | # string        |
  | iex> [1,2,3]  | # list          |
  | iex> {1,2,3}  | # tuple         |

- Funções para manipulação de integers/floats

  | Função           | Resultado                    |
  | ---------------- | ---------------------------- |
  | iex> div(10,3)   | # resultado sem casa decimal |
  | iex> rem(10,3)   | # resto da divisão           |
  | iex> round(3.58) | # arredondar número          |
  | iex> trunc(3.58) | # `truncar´ número           |

- Funções para checar os tipos (is_integer, is_string, is_atom, etc)
- Para saber mais sobre as operações básicas clique [aqui](https://elixirschool.com/pt/lessons/basics/basics/#opera%C3%A7%C3%B5es-b%C3%A1sicas).

___

### Visão dos primeiros fontes com Elixir

- Contact Book
  - Lib que gerencia uma lista de amigos;
  - CRUD simples utilizando CSV;
  - Manipulação dos dados pelo terminal;
  - Para saber mais clique [aqui](/apps/contact_book/README.md).

- Cards
  - Lib que funciona como um dealer para jogos de cartas;
  - Funcionalidades simples, com testes unitários e documentação que sugere a técnica de BDD.
  - Para saber mais clique [aqui](/apps/cards/README.md).

- Identicon
  - Lib que gera Identicon's;
  - Funcionalidades simples, com manipulação de imagens.
  - Para saber mais clique [aqui](/apps/identicon/README.md).
  
___

### Phoenix Framework Visão geral

Phoenix é uma estrutura de desenvolvimento web escrita em Elixir que implementa o padrão Model View Controller (MVC) do lado do servidor.
Muitos de seus componentes e conceitos parecerão familiares para aqueles de nós com experiência em outros frameworks web, como Ruby on Rails ou Django do Python.
Para continuar com o `Overview` completo clique [aqui](https://hexdocs.pm/phoenix/overview.html).

- Para entender mais sobre o framework, leia a [documentação](https://hexdocs.pm/phoenix/Phoenix.html)

___

### Referências

- [Elixir and The Beam: How Concurrency Really Works](https://medium.com/flatiron-labs/elixir-and-the-beam-how-concurrency-really-works-3cc151cddd61);
- [Courser](https://elixir-lang.org/learning.html#courses);
- [Learn With Me: Elixir](https://inquisitivedeveloper.com/tag/lwm-elixir/);
- [Learn Elixir: The Ultimate Guide](https://serokell.medium.com/learn-elixir-the-ultimate-guide-2ce49b78f20b);
- [Introduction to Erlang](https://serokell.io/blog/introduction-to-erlang);
- [Why developers are falling in love with functional programming](https://towardsdatascience.com/why-developers-are-falling-in-love-with-functional-programming-13514df4048e).

Have fun! ❤️
