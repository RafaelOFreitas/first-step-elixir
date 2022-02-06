defmodule RockeliveryWeb.ItemsView do
  use RockeliveryWeb, :view

  alias Rockelivery.Item

  def render("create.json", %{item: %Item{} = item}) do
    %{
      message: "Item created!",
      item: item
    }
  end

  def render("item.json", %{item: %Item{} = item}), do: render_one(item, RockeliveryWeb.ItemsView, "item.json")
  def render("item.json", %{items: items}) when is_list(items), do: render_many(items, RockeliveryWeb.ItemsView, "item.json")
  def render("item.json", %{items: %Item{} = item}), do: item
end
