defmodule Rockelivery.CreateTest do
  use Rockelivery.DataCase, async: true

  import Rockelivery.Factory

  alias Rockelivery.{
    Error,
    User,
  }
  alias Rockelivery.Users.Create

  describe "call/1" do
    test "when all params are valid, returns the user" do
      params = build(:user_params)

      response = Create.call(params)

      assert {:ok, %User{}} = response
    end

    test "when there are invalid params, return an error" do
      params = build(:user_params, %{"password" => "123"})

      response = Create.call(params)

      expected_response = %{password: ["should be at least 6 character(s)"]}

      assert {:error, %Error{status: :bad_request, result: changeset}} = response
      assert errors_on(changeset) == expected_response
    end
  end
end
