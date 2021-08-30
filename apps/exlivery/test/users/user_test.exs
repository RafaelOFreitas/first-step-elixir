defmodule Exlivery.Users.UserTest do
  use ExUnit.Case

  import Exlivery.Factory

  alias Exlivery.Users.User

  describe "build/5" do
    test "when all params are valid, returns the user" do
      response =
        User.build(
          "Rafael",
          "rafael.freitas@test.com",
          "Rua das flores",
          "00123456789",
          23
        )

      expected_response = {:ok, build(:user)}

      assert response == expected_response
    end

    test "when there is an invalid age, return an error" do
      response =
        User.build(
          "Rafael",
          "rafael.freitas@test.com",
          "Rua das flores",
          "00123456789",
          17
        )

      expected_response = {:error, "Invalid parameters"}

      assert response == expected_response
    end
  end
end
