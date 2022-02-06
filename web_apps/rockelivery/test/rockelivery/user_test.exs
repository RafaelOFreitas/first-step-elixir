defmodule Rockelivery.UserTest do
  use Rockelivery.DataCase, async: true

  import Rockelivery.Factory

  alias Ecto.Changeset
  alias Rockelivery.User

  describe "changeset/2" do
    test "when all params are valid, returns a valid changeset" do
      params = params_for(:user)

      response = User.changeset(params)

      assert %Changeset{valid?: true} = response
    end

    test "when updating a changeset, returns a valid changeset with the given changes" do
      user = build(:user)

      update_params = %{name: "Rafael Freitas"}

      response = User.update_changeset(user, update_params)

      assert %Changeset{changes: %{name: "Rafael Freitas"}, valid?: true} = response
    end

    test "when there are some error, returns an invalid changeset" do
      params = %{
        address: 2,
        age: 12,
        cep: "1234567",
        cpf: "123456789",
        email: "error",
        password: "112",
        name: 1
      }

      response = User.changeset(params)

      expected_response = %{
        password: ["should be at least 6 character(s)"],
        cep: ["should be 8 character(s)"],
        cpf: ["should be 11 character(s)"],
        email: ["has invalid format"],
        address: ["is invalid"],
        name: ["is invalid"]
      }

      assert errors_on(response) == expected_response
    end
  end
end
