defmodule Fibonacci do

  #modulo para hacer la secuencia de Fibonacci de un numero dado

  def of(0), do: 0
  def of(1), do: 1
  def of(n), do: of(n - 1) + of(n - 2)

end

IO.puts Fibonacci.of(20)

