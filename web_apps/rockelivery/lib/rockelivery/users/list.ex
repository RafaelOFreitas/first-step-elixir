defmodule Rockelivery.Users.List do

  alias Rockelivery.{
    Repo,
    User,
  }

  def call, do: {:ok, Repo.all(User)}
end
