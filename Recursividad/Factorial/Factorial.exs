defmodule Factorial do

  #modulo para hacer el factorial de un numero dado

  def of(0), do: 1
  def of(n), do: n * of(n - 1)
  
end

IO.puts Factorial.of(0)
