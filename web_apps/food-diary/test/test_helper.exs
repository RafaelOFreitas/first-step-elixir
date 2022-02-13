ExUnit.start()
Ecto.Adapters.SQL.Sandbox.mode(FoodDiary.Repo, :manual)

defmodule TestHelper do
  import Phoenix.ConnTest
  use ExUnit.Case

  @endpoint FoodDiaryWeb.Endpoint

  def post_query(conn, query, variables \\ %{}, opts \\ %{}) do
    params =
      opts
      |> Map.put(:query, query)
      |> Map.put(:variables, variables)

    conn
    |> post("/api/graphql", params)
    |> json_response(200)
  end
end
