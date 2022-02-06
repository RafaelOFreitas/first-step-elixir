defmodule Rockelivery.Item do
  use Ecto.Schema
  import Ecto.Changeset

  alias Ecto.Enum
  alias Rockelivery.Order

  @primary_key {:id, :binary_id, autogenerate: true}

  @required_params [:category, :description, :price, :photo]
  @update_required_params @required_params

  @items_categories [:food, :drink, :desert]

  @derive {Jason.Encoder, only: @required_params ++ [:id]}

  schema "items" do
    field :category, Enum, values: @items_categories
    field :description, :string
    field :price, :decimal
    field :photo, :string

    many_to_many :orders, Order, join_through: "orders_items"

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
    |> validate_length(:description, min: 6)
    |> validate_number(:price, greater_than: 0)
  end
end
