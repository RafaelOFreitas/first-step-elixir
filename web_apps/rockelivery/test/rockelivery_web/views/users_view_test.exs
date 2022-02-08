defmodule RockeliveryWeb.UsersViewTest do
  use RockeliveryWeb.ConnCase, async: true

  import Phoenix.View
  import Rockelivery.Factory

  alias RockeliveryWeb.UsersView

  test "renders create.json" do
    user = build(:user)

    response = render(UsersView, "create.json", user: user, token: "")

    expected_response = %{
      token: "",
      user: user,
      message: "User created!"
    }

    assert response == expected_response
  end
end
