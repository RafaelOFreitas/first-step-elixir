defmodule Mix.Tasks.Start do
  use Mix.Task

  @shortdoc "Start [CRUD APP]"
  def run(_), do: CrudApp.init()
end
