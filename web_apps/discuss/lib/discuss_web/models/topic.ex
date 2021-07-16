defmodule DiscussWeb.Topic do
  use Ecto.Schema
  import Ecto.Changeset
  alias DiscussWeb.Topic

  schema "topics" do
    field :title, :string
  end

  @doc false
  def changeset(%Topic{} = topic, attrs \\ %{}) do
    topic
    |> cast(attrs, [:title])
    |> validate_required([:title])
  end
end
