defmodule MatrizOps do
  # S1: suma de los elementos debajo de la diagonal principal (sin incluir diagonal), recursivo
  def suma_debajo_diagonal(matriz) do
    suma_recursiva(matriz, 1, 0)
  end

  defp suma_recursiva(matriz, i, _j) when i >= length(matriz), do: 0
  defp suma_recursiva(matriz, i, j) when j >= i do
    suma_recursiva(matriz, i + 1, 0)
  end
  defp suma_recursiva(matriz, i, j) do
    valor = matriz |> Enum.at(i) |> Enum.at(j)
    valor + suma_recursiva(matriz, i, j + 1)
  end

  # S2: promedio de los elementos encima de la diagonal principal (sin incluir diagonal)
  def promedio_encima_diagonal(matriz) do
    {suma, cantidad} = recorrer_encima(matriz, 0, 1, 0, 0)
    if cantidad == 0, do: 0, else: suma / cantidad
  end

  defp recorrer_encima(matriz, i, _j, suma, cantidad) when i >= length(matriz), do: {suma, cantidad}
  defp recorrer_encima(matriz, i, j, suma, cantidad) when j >= length(matriz) do
    recorrer_encima(matriz, i + 1, i + 2, suma, cantidad)
  end
  defp recorrer_encima(matriz, i, j, suma, cantidad) do
    valor = matriz |> Enum.at(i) |> Enum.at(j)
    recorrer_encima(matriz, i, j + 1, suma + valor, cantidad + 1)
  end
end

defmodule Main do
  def run do
    matriz = [
      [1, 2, 3],
      [4, 5, 6],
      [7, 8, 9]
    ]

    # Lanzar tareas concurrentes (sin comunicación entre ellas)
    t1 = Task.async(fn -> MatrizOps.suma_debajo_diagonal(matriz) end)
    t2 = Task.async(fn -> MatrizOps.promedio_encima_diagonal(matriz) end)

    # Esperar resultados
    a = Task.await(t1)
    b = Task.await(t2)

    # S3 y S4
    c = a * b
    IO.puts("Resultado (c = a * b): #{c}")
  end
end

# Ejecutar el programa
Main.run()
