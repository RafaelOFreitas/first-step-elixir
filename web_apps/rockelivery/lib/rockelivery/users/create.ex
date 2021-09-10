defmodule Rockelivery.Users.Create do
  alias Rockelivery.{
    User,
    Repo
  }

  def call(attrs) do
    attrs
    |> User.changeset()
    |> Repo.insert()
    |> handle_insert()
  end

  defp handle_insert({:ok, %User{}} = result), do: result

  defp handle_insert({:error, result}) do
    {:error, %{status: :bad_request, result: result}}
  end
end
