defmodule Rockelivery.Items.List do

  alias Rockelivery.{
    Item,
    Repo,
  }

  def call, do: {:ok, Repo.all(Item)}
end
