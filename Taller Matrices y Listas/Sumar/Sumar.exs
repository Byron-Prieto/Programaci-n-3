defmodule Sumar do

  # Función principal que recibe la matriz
  def sumar(matriz) do
    sumar_filas(matriz)
  end

  # Caso base: lista vacía de filas
  defp sumar_filas([]), do: 0

  # Caso recursivo: sumar los elementos de la primera fila y continuar con el resto
  defp sumar_filas([fila | resto]) do
    sumar_fila(fila) + sumar_filas(resto)
  end

  # Sumar los elementos de una fila
  defp sumar_fila([]), do: 0

  defp sumar_fila([fila | resto]) do
    fila + sumar_fila(resto)
  end

end

matriz = [
  [1, 2, 3],
  [4, 5, 6],
  [7, 8, 9]
]

IO.puts("Suma de los elementos: #{Sumar.sumar(matriz)}")

