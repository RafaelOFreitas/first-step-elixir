defmodule Exlivery.Orders.CreateOrUpdateTest do
  use ExUnit.Case

  import Exlivery.Factory

  alias Exlivery.Orders.Agent, as: OrderAgent
  alias Exlivery.Orders.CreateOrUpdate
  alias Exlivery.Users.Agent, as: UserAgent

  describe "call/1" do
    setup do
      UserAgent.start_link(%{})
      OrderAgent.start_link(%{})

      user_cpf = "12345678900"
      user = build(:user, cpf: user_cpf)
      UserAgent.save(user)

      item_1 = %{
        category: :pizza,
        description: "Pizza de peperoni",
        quantity: 1,
        unity_price: "35.50"
      }

      item_2 = %{
        category: :pizza,
        description: "Pizza de Calabresa",
        quantity: 1,
        unity_price: "31.50"
      }

      {:ok, user_cpf: user_cpf, item_1: item_1, item_2: item_2}
    end

    test "when all params are valid, saves the order", %{
      user_cpf: user_cpf,
      item_1: item_1,
      item_2: item_2
    } do
      response = CreateOrUpdate.call(%{user_cpf: user_cpf, items: [item_1, item_2]})

      assert {:ok, _uuid} = response
    end

    test "when there is no user with giver cpf, returns an error", %{
      item_1: item_1,
      item_2: item_2
    } do
      response = CreateOrUpdate.call(%{user_cpf: "00000000", items: [item_1, item_2]})

      expected_response = {:error, "User not found"}

      assert response == expected_response
    end

    test "when there are invalid items, returns an error", %{
      user_cpf: user_cpf,
      item_1: item_1,
      item_2: item_2
    } do
      response =
        CreateOrUpdate.call(%{user_cpf: user_cpf, items: [%{item_1 | quantity: 0}, item_2]})

      expected_response = {:error, "Invalid items"}

      assert response == expected_response
    end

    test "when there are no items, returns an error", %{user_cpf: user_cpf} do
      response = CreateOrUpdate.call(%{user_cpf: user_cpf, items: []})

      expected_response = {:error, "Invalid parameters"}

      assert response == expected_response
    end
  end
end
