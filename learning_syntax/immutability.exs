total = 876

defmodule Mutant do
  def mutate(value) do
    IO.puts("internal A: #{value}")
    value = 1
    IO.puts("internal B: #{value}")
    value
  end
end

Mutant.mutate(total)
IO.puts("external A: #{total}")

# rebinding
total = Mutant.mutate(total)
IO.puts("external B: #{total}")
