defmodule Rockelivery.Users.Create do
  alias Ecto.Changeset
  alias Rockelivery.{
    Error,
    Repo,
    User,
  }
  alias Rockelivery.ViaCep.Client

  def call(%{"cep" => cep} = attrs) do
    with  %Changeset{valid?: true} = changeset <- User.changeset(attrs),
          {:ok, _cep_info} <- Client.get_cep_info(cep),
          {:ok, %User{} = user} <- Repo.insert(changeset)
    do
      user
    else
      {:error, %Error{}} = error -> error
      {:error, result} -> {:error, Error.build(:bad_request, result)}
      %Changeset{valid?: false} = changeset -> {:error, Error.build(:bad_request, changeset)}
    end
  end
end
