defmodule Rockelivery.Orders.Create do
  import Ecto.Query

  alias Rockelivery.{
    Error,
    Item,
    Order,
    Repo,
  }
  alias Rockelivery.Orders.ValidateAndMultiplyItems

  def call(%{"items" => items_attrs} = attrs) do
    item_ids = Enum.map(items_attrs, & &1["id"])

    query = from item in Item, where: item.id in ^item_ids

    query
    |> Repo.all()
    |> ValidateAndMultiplyItems.call(item_ids, items_attrs)
    |> handle_items(attrs)
  end

  defp handle_items({:ok, items}, params) do
    params
    |> Order.changeset(items)
    |> Repo.insert()
    |> handle_insert()
  end

  defp handle_items({:error, result}, _params), do:  {:error, Error.build(:bad_request, result)}

  defp handle_insert({:ok, %Order{}} = result), do: result
  defp handle_insert({:error, result}), do: {:error, Error.build(:bad_request, result)}
end
