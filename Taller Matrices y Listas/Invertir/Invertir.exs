defmodule Invertir do

   # Función para invertir la matriz
   def invertir_matriz(matriz) do
    invertir_filas(matriz)
  end

  # Invierte el orden de las filas
  defp invertir_filas([]), do: []

  defp invertir_filas([h | t]) do
    invertir_filas(t) ++ [invertir_fila(h)]
  end

  # Invierte el orden de los elementos de una fila
  defp invertir_fila([]), do: []

  defp invertir_fila([h | t]) do
    invertir_fila(t) ++ [h]
  end

end

matriz = [
  [1, 2, 3],
  [4, 5, 6],
  [7, 8, 9]
]

IO.puts("Matriz original:")
IO.inspect(matriz)

IO.puts("Matriz invertida:")
IO.inspect(Invertir.invertir_matriz(matriz))
