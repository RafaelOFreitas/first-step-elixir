defmodule FoodDiaryWeb.SchemaTest do
  use FoodDiaryWeb.ConnCase, async: true
  use FoodDiaryWeb.SubscriptionCase

  alias FoodDiary.{
    User,
    Users,
  }

  describe "users query" do
    setup :create_user

    test "when a valid id is given, return the user", %{conn: conn, user: %{id: user_id}} do
      assert %{
        "data" => %{
          "user" => %{
            "email" => "rafael@email.com",
            "name" => "Rafael"
          }
        }
      } == post_query(conn, user_query(), id: user_id)
    end

    test "when the user does not exists, returns an error", %{conn: conn} do
      assert %{
        "data" => %{
          "user" => nil
        },
        "errors" => [
          %{
            "locations" => [%{"column" => 3, "line" => 2}],
            "message" => "User not found",
            "path" => ["user"]
          }
        ]
      } == post_query(conn, user_query(), id: -1)
    end

    defp user_query do
      """
      query($id: ID!) {
        user(id: $id) {
          name
          email
        }
      }
      """
    end
  end

  describe "users mutation" do
    test "when all params are valid, creates the user", %{conn: conn} do
      params = %{email: "rafael@email.com", name: "Rafael"}

      assert %{
        "data" => %{
          "createUser" => %{
            "email" => "rafael@email.com",
            "name" => "Rafael"
          }
        }
      } == post_query(conn, user_mutation(), input: params)
    end

    test "when params are invalid, returns an error", %{conn: conn} do
      params = %{email: "rafael", name: ""}

      assert %{
        "data" => %{
          "createUser" => nil
        },
        "errors" => [
          %{
            "locations" => [%{"column" => 3, "line" => 2}],
            "message" => "email has invalid format",
            "path" => ["createUser"]
          },
          %{
            "locations" => [%{"column" => 3, "line" => 2}],
            "message" => "name can't be blank",
            "path" => ["createUser"]
          }
        ]
      } == post_query(conn, user_mutation(), input: params)
    end

    defp user_mutation do
      """
      mutation($input: CreateUserInput!) {
        createUser(input: $input) {
          name
          email
        }
      }
      """
    end
  end

  describe "subscriptions" do
    setup :create_user

    test "meals subscription", %{socket: socket, user: %{id: user_id}} do
      socket_ref = push_doc(socket, meal_subscription())
      assert_reply socket_ref, :ok, %{subscriptionId: subscriptionId}

      params_meal = %{user_id: user_id, description: "description", calories: 1.0, category: "FOOD"}
      socket_ref = push_doc(socket, meal_mutation(), variables: %{input: params_meal})
      assert_reply socket_ref, :ok, mutation_response

      assert %{
        data: %{
          "createMeal" => %{
            "id" => received_meal_id
          }
        }
      } = mutation_response

      assert_push "subscription:data", subscription_response

      assert %{
        result: %{
          data: %{
            "newMeal" => %{
              "id" => received_meal_id
            }
          }
        },
        subscriptionId: subscriptionId
      } == subscription_response
    end

    defp meal_mutation do
      """
      mutation($input: CreateMealInput!) {
        createMeal(input: $input) {
          id
          description
          calories
          category
        }
      }
      """
    end

    defp meal_subscription do
      """
      subscription {
        newMeal {
          id
        }
      }
      """
    end
  end

  defp create_user(_) do
    params_user = %{email: "rafael@email.com", name: "Rafael"}
    {:ok, %User{} = user} = Users.Create.call(params_user)

    [user: user]
  end
end
