defmodule Diagonal do
  def recorrer_diagonal([], _), do: :ok
  def recorrer_diagonal([fila | resto], indice) do
    IO.puts("Elemento en la diagonal: #{Enum.at(fila, indice)}")
    recorrer_diagonal(resto, indice + 1)
  end
end

matriz = [
  [1, 2, 3],
  [4, 5, 6],
  [7, 8, 9]
]

Diagonal.recorrer_diagonal(matriz, 0)
