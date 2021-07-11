value = %{"language" => "Elixir", "vm" => "BEAM"}
value = %{language: "Elixir", vm: "BEAM"}
IO.puts value[:language]
IO.puts value.vm
IO.inspect value[:non_existent]
#IO.inspect value.non_existent

new_value = %{value | language: "Erlang", vm: "BEAM"}
IO.inspect new_value
