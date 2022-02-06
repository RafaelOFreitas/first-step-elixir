defmodule Rockelivery.Factory do
  use ExMachina.Ecto, repo: Rockelivery.Repo

  alias Faker.Address.PtBr, as: FakerAddress
  alias Faker.Food, as: FakerFood
  alias Faker.Internet, as: FakerInternet
  alias Faker.Person.PtBr, as: FakerPerson
  alias Faker.String, as: FakerString
  alias Faker.Util, as: FakerUtil
  alias Faker.UUID, as: FakerUUID
  alias Rockelivery.{
    Item,
    User,
  }

  def user_factory do
    %User{
      address: FakerAddress.street_address(),
      age: Faker.random_between(10, 100),
      cep: FakerUtil.format("%8d"),
      cpf: FakerUtil.format("%11d"),
      email: FakerInternet.email(),
      password: FakerString.base64(8),
      name: FakerPerson.name(),
      id: FakerUUID.v4(),
    }
  end

  def item_factory do
    %Item{
      category: :food,
      description: FakerFood.description(),
      price: Faker.random_between(10, 100),
      photo: "food.png",
      id: FakerUUID.v4(),
    }
  end
end
