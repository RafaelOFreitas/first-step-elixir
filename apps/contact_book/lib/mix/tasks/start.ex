defmodule Mix.Tasks.Start do
  use Mix.Task

  @shortdoc "Start [ContactBook APP]"
  def run(_), do: ContactBook.init()
end
