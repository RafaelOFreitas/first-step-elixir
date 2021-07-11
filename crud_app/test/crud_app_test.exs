defmodule CrudAppTest do
  use ExUnit.Case
  doctest CrudApp

  test "greets the world" do
    assert CrudApp.hello() == :world
  end
end
