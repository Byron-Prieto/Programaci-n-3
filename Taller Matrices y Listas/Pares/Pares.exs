defmodule Pares do

  # Función principal que recibe la matriz
  def sumar_pares(matriz) do
    sumar_pares_filas(matriz)
  end

  # Caso base: lista vacía de filas
  defp sumar_pares_filas([]), do: 0

  # Caso recursivo: sumar los pares de la primera fila y continuar con el resto
  defp sumar_pares_filas([fila | resto]) do
    sumar_pares_fila(fila) + sumar_pares_filas(resto)
  end

  # Sumar los pares de una fila
  defp sumar_pares_fila([]), do: 0

  defp sumar_pares_fila([fila | resto]) do
    if rem(fila, 2) == 0 do
      fila + sumar_pares_fila(resto)
    else
      sumar_pares_fila(resto)
    end
  end

end

matriz = [
  [1, 2, 3],
  [4, 5, 6],
  [7, 8, 9]
]

IO.puts("Suma de los elementos pares: #{Pares.sumar_pares(matriz)}")
