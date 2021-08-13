defmodule ExClient do
  use Tesla

  plug(Tesla.Middleware.BaseUrl, "https://api.github.com")
  plug(Tesla.Middleware.Headers, [{"User-Agent", "exclient"}])
  plug(Tesla.Middleware.JSON)

  def get_repos_by_username(user) do
    "/users/#{user}/repos"
    |> get()
    |> handler()
  end

  defp handler({:ok, %Tesla.Env{status: 200, body: body}}) do
    {:ok, body}
  end

  defp handler({:ok, %Tesla.Env{status: 404}}) do
    {:error, "User not found!"}
  end

  defp handler({:error, _reason}) do
    {:error, "Generic error!"}
  end
end
