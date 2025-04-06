defmodule Transposicion do

  #caso base: matriz vacía o con filas vacías
  def transponer([]), do: []
  def transponer([[] | _]), do: []

  #caso recursivo: extraer la primera columna y transponer el resto
  def transponer(matriz) do
    [primer_columna(matriz) | transponer(resto_columnas(matriz))]
  end

  # Extrae la primera columna de la matriz
  defp primer_columna([]), do: []
  defp primer_columna([fila | resto]), do: [hd(fila) | primer_columna(resto)]

  # Extrae el resto de columnas de la matriz
  defp resto_columnas([]), do: []
  defp resto_columnas([fila | resto]), do: [tl(fila) | resto_columnas(resto)]

end

matriz = [
  [1, 2, 3],
  [4, 5, 6],
  [7, 8, 9]
]

IO.puts("Matriz original:")
IO.inspect(matriz)

IO.puts("Matriz transpuesta:")
IO.inspect(Transposicion.transponer(matriz))
