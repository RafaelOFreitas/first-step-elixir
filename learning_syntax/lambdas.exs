#mad_printer = fn initial_string ->
#  initial_string
#  |> String.reverse()
#  |> IO.puts()
#end

mad_printer = &(&1 |> String.reverse() |> IO.puts())

Enum.each ["hello", "there", "friend"], fn(s) -> IO.puts s end
Enum.each ["hello", "there", "friend"], &IO.puts/1
mad_printer.("Hello there friend!")
