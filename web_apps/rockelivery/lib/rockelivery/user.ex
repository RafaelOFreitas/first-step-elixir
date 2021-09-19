defmodule Rockelivery.User do
  use Ecto.Schema
  import Ecto.Changeset

  alias Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}

  @required_params [:address, :age, :cep, :cpf, :email, :password, :name]

  @update_required_params @required_params -- [:password]

  @derive {Jason.Encoder, only: [:id, :age, :cpf, :address, :email, :name]}

  schema "users" do
    field :address, :string
    field :age, :integer
    field :cep, :string
    field :cpf, :string
    field :email, :string
    field :password, :string, virtual: true
    field :password_hash, :string
    field :name, :string

    timestamps()
  end

  def changeset(attrs) do
    %__MODULE__{}
    |> cast(attrs, @required_params)
    |> base_changeset(@required_params)
  end

  def update_changeset(struct, attrs) do
    struct
    |> cast(attrs, @update_required_params)
    |> base_changeset(@update_required_params)
  end

  defp base_changeset(changeset, fields) do
    changeset
    |> validate_required(fields)
    |> validate_length(:password_hash, min: 6)
    |> validate_length(:cep, is: 8)
    |> validate_length(:cpf, is: 11)
    |> validate_format(:email, ~r/@/)
    |> unique_constraint([:email])
    |> unique_constraint([:cpf])
    |> put_password_hash()
  end

  defp put_password_hash(%Changeset{valid?: true, changes: %{password: password}} = changeset) do
    change(changeset, Pbkdf2.add_hash(password))
  end

  defp put_password_hash(changeset), do: changeset
end
