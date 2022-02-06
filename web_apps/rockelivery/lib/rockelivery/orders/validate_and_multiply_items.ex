defmodule Rockelivery.Orders.ValidateAndMultiplyItems do
  def call(items, item_ids, items_attrs) do
    items_map = Map.new(items, fn item -> {item.id, item} end)

    item_ids
    |> Enum.map(fn id -> {id, Map.get(items_map, id)} end)
    |> Enum.any?(fn {_id, value} -> is_nil(value) end)
    |> multiply_items(items_map, items_attrs)
  end

  defp multiply_items(true, _items, _items_attrs), do: {:error, "Invalid ids!"}

  defp multiply_items(false, items, items_attrs) do
    items =
      Enum.reduce(items_attrs, [], fn %{"id" => id, "quantity" => quantity}, acc ->
        item = Map.get(items, id)
        List.duplicate(item, quantity) ++ acc
      end)

    {:ok, items}
  end
end
