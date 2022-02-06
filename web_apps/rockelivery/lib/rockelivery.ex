defmodule Rockelivery do
  # Items functions
  alias Rockelivery.Items.Create, as: ItemCreate
  alias Rockelivery.Items.Delete, as: ItemDelete
  alias Rockelivery.Items.Get, as: ItemGet
  alias Rockelivery.Items.List, as: ItemList
  alias Rockelivery.Items.Update, as: ItemUpdate
  # Users functions
  alias Rockelivery.Users.Create, as: UserCreate
  alias Rockelivery.Users.Delete, as: UserDelete
  alias Rockelivery.Users.Get, as: UserGet
  alias Rockelivery.Users.List, as: UserList
  alias Rockelivery.Users.Update, as: UserUpdate
  # Orders functions
  alias Rockelivery.Orders.Create, as: OrderCreate

  defdelegate create_user(params), to: UserCreate, as: :call
  defdelegate delete_user(id), to: UserDelete, as: :call
  defdelegate get_user_by_id(id), to: UserGet, as: :by_id
  defdelegate list_users, to: UserList, as: :call
  defdelegate update_user(id), to: UserUpdate, as: :call

  defdelegate create_item(params), to: ItemCreate, as: :call
  defdelegate delete_item(id), to: ItemDelete, as: :call
  defdelegate get_item_by_id(id), to: ItemGet, as: :by_id
  defdelegate list_items, to: ItemList, as: :call
  defdelegate update_item(id), to: ItemUpdate, as: :call

  defdelegate create_order(params), to: OrderCreate, as: :call
end
