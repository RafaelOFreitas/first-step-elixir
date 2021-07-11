defmodule CrudApp.CLI.Menu.Items do
  alias CrudApp.CLI.Menu

  def all,
    do: [
      %Menu{label: "Register a friend", id: :create},
      %Menu{label: "List friends", id: :read},
      %Menu{label: "Update a friend", id: :update},
      %Menu{label: "Delete a friend", id: :delete}
    ]
end
