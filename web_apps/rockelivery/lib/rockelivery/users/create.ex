defmodule Rockelivery.Users.Create do
  alias Ecto.Changeset
  alias Rockelivery.{
    Error,
    Repo,
    User,
  }

  def call(attrs) do
    cep = Map.get(attrs, "cep")

    with  %Changeset{valid?: true} = changeset <- User.changeset(attrs),
          {:ok, _cep_info} <- client().get_cep_info(cep),
          {:ok, %User{}} = user <- Repo.insert(changeset)
    do
      user
    else
      {:error, %Error{}} = error -> error
      {:error, result} -> {:error, Error.build(:bad_request, result)}
      %Changeset{valid?: false} = changeset -> {:error, Error.build(:bad_request, changeset)}
    end
  end

  defp client do
    :rockelivery
    |> Application.fetch_env!(__MODULE__)
    |> Keyword.get(:via_cep_adapter)
  end
end
