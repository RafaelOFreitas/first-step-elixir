string = "Hello World!"
# <<1, 1000>>
string = "Hi #{2 * 5}"
IO.inspect string
s_sigils = ~s( hi #{2*5} )
no_int_sigils = ~S( hi #{2*5} )
IO.inspect s_sigils
IO.inspect no_int_sigils
IO.inspect s_sigils <> no_int_sigils
