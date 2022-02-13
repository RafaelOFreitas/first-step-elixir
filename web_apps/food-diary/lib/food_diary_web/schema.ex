defmodule FoodDiaryWeb.Schema do
  use Absinthe.Schema

  alias Crudry.Middlewares.TranslateErrors

  import_types FoodDiaryWeb.Schema.Types.Root

  query do
    import_fields :root_query
  end

  mutation do
    import_fields :root_mutation
  end

  subscription do
    import_fields :root_subscription
  end

  def middleware(middleware, _field, _object) do
    middleware ++ [TranslateErrors]
  end
end
