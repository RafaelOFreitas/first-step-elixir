defmodule Rockelivery.Factory do
  use ExMachina.Ecto, repo: Rockelivery.Repo

  alias Faker.Address.PtBr, as: FakerAddress
  alias Faker.Food, as: FakerFood
  alias Faker.Internet, as: FakerInternet
  alias Faker.Person.PtBr, as: FakerPerson
  alias Faker.Util, as: FakerUtil
  alias Faker.UUID, as: FakerUUID
  alias Rockelivery.{
    Item,
    Order,
    User,
  }

  @password "12345678"
  @password_hash Pbkdf2.add_hash(@password).password_hash
  @payment_methods [:money, :credit_card, :debit_card]

  def user_factory do
    %User{
      address: FakerAddress.street_address(),
      age: Faker.random_between(10, 100),
      cep: FakerUtil.format("%8d"),
      cpf: FakerUtil.format("%11d"),
      email: FakerInternet.email(),
      password_hash: @password_hash,
      password: @password,
      name: FakerPerson.name(),
      id: FakerUUID.v4(),
    }
  end

  def item_factory do
    %Item{
      category: :food,
      description: sequence("Food description "),
      price: Faker.random_between(10, 100),
      photo: "food.png",
      id: FakerUUID.v4(),
    }
  end

  def order_factory do
    %Order{
      address: FakerAddress.street_address(),
      comments: "With #{FakerFood.ingredient()}",
      payment_method: @payment_methods |> Faker.Util.pick() |> to_string(),
      user: build(:user),
    }
  end

  def cep_info_factory do
    %{
      "cep" => "01001-000",
      "logradouro" => "Praça da Sé",
      "complemento" => "lado ímpar",
      "bairro" => "Sé",
      "localidade" => "São Paulo",
      "uf" => "SP",
      "ibge" => "3550308",
      "gia" => "1004",
      "ddd" => "11",
      "siafi" => "7107"
    }
  end
end
