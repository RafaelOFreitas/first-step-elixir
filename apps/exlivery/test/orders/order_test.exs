defmodule Exlivery.Orders.OrderTest do
  use ExUnit.Case

  import Exlivery.Factory

  alias Exlivery.Orders.Order

  describe "build/2" do
    test "when all params are valid, return an order" do
      user = build(:user)

      items = [
        build(:item),
        build(:item,
          description: "Temaki de atum",
          category: :japonesa,
          quantity: 2,
          unity_price: Decimal.new("20.50")
        )
      ]

      response = Order.build(user, items)

      expected_response = {:ok, build(:order)}

      assert response == expected_response
    end
  end
end
