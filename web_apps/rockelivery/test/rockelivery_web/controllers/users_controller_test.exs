defmodule Rockelivery.UsersControllerTest do
  use RockeliveryWeb.ConnCase, async: true

  import Rockelivery.Factory

  describe "create/2" do
    test "when all params are valid, create the user", %{conn: conn} do
      params = params_for(:user)

      response =
        conn
        |> post(Routes.users_path(conn, :create, params))
        |> json_response(:created)

      assert %{
        "message" => "User created!",
        "user" => %{
          "address" => _address,
          "age" => _age,
          "cpf" => _cpf,
          "email" => _email,
          "id" => _id,
          "name" => _name
        }
      } = response
    end

    test "when there is some error, return the error", %{conn: conn} do
      params = %{
        "name" => "Rafael",
        "password" => "123"
      }

      response =
        conn
        |> post(Routes.users_path(conn, :create, params))
        |> json_response(:bad_request)

      expected_response = %{
        "message" => %{
          "address" => ["can't be blank"],
          "age" => ["can't be blank"],
          "cep" => ["can't be blank"],
          "cpf" => ["can't be blank"],
          "email" => ["can't be blank"],
          "password" => ["should be at least 6 character(s)"]
        }
      }

      assert response == expected_response
    end
  end

  describe "delete/2" do
    test "when there is a user with the given id, deletes the user", %{conn: conn} do
      user = insert(:user)

      response =
        conn
        |> delete(Routes.users_path(conn, :delete, user.id))
        |> response(:no_content)

      assert response == ""
    end

    test "when given an id with non-existent user, return error message", %{conn: conn} do
      response =
        conn
        |> get(Routes.users_path(conn, :delete, "adfd41c3-773d-4737-99f7-d69cb2cbfdec"))
        |> json_response(:not_found)

      expected_response = %{"message" => "User not found"}

      assert response == expected_response
    end
  end

  describe "show/2" do
    test "when there is a user with the given id, shows the user", %{conn: conn} do
      user = insert(:user)

      response =
        conn
        |> get(Routes.users_path(conn, :show, user.id))
        |> json_response(:ok)

      expected_response = %{
        "address" => user.address,
        "age" => user.age,
        "cpf" => user.cpf,
        "email" => user.email,
        "id" => user.id,
        "name" => user.name
      }

      assert response == expected_response
    end

    test "when given an id with non-existent user, return error message", %{conn: conn} do
      response =
        conn
        |> get(Routes.users_path(conn, :show, "adfd41c3-773d-4737-99f7-d69cb2cbfdec"))
        |> json_response(:not_found)

      expected_response = %{"message" => "User not found"}

      assert response == expected_response
    end

    test "when given an invalid id format, return error message", %{conn: conn} do
      response =
        conn
        |> get(Routes.users_path(conn, :show, "adfd41c3773d473799f7d69cb2cbfdec"))
        |> json_response(:bad_request)

      expected_response = %{"message" => "Invalid id format"}

      assert response == expected_response
    end
  end

  describe "update/2" do
    test "when there is a user with the given id, updates the user", %{conn: conn} do
      user = insert(:user)

      update_params = %{"name" => "Florentina Das Flores"}

      response =
        conn
        |> put(Routes.users_path(conn, :update, user.id), update_params)
        |> json_response(:ok)

        expected_response = %{
          "address" => user.address,
          "age" => user.age,
          "cpf" => user.cpf,
          "email" => user.email,
          "id" => user.id,
          "name" => Map.get(update_params, "name")
        }

        assert response == expected_response
    end

    test "when given an id with non-existent user, return error message", %{conn: conn} do
      update_params = %{"name" => "Florentina Das Flores"}

      response =
        conn
        |> get(Routes.users_path(conn, :update, "adfd41c3-773d-4737-99f7-d69cb2cbfdec"), update_params)
        |> json_response(:not_found)

      expected_response = %{"message" => "User not found"}

      assert response == expected_response
    end
  end
end
