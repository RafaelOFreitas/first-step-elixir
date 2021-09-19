defmodule Rockelivery.Factory do
  use ExMachina.Ecto, repo: Rockelivery.Repo

  alias Faker.Address.PtBr, as: FakerAddress
  alias Faker.Internet, as: FakerInternet
  alias Faker.Person.PtBr, as: FakerPerson
  alias Faker.String, as: FakerString
  alias Faker.UUID, as: FakerUUID
  alias Rockelivery.User

  def user_factory do
    %User{
      address: FakerAddress.street_address(),
      age: Faker.random_between(10, 100),
      cep: Faker.Util.format("%8d"),
      cpf: Faker.Util.format("%11d"),
      email: FakerInternet.email(),
      password: FakerString.base64(8),
      name: FakerPerson.name(),
      id: FakerUUID.v4()
    }
  end

  def user_params_factory do
    %{
      "address" => FakerAddress.street_address(),
      "age" => Faker.random_between(10, 100),
      "cep" => Faker.Util.format("%8d"),
      "cpf" => Faker.Util.format("%11d"),
      "email" => FakerInternet.email(),
      "password" => FakerString.base64(8),
      "name" => FakerPerson.name()
    }
  end
end
