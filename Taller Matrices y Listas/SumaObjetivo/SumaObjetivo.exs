defmodule SumaObjetivo do

   # Función principal que recibe la lista y el objetivo
   def todas_combinaciones(lista, objetivo) do
    buscar(lista, objetivo, [], [])
  end

  # Caso base: objetivo alcanzado → guardamos combinación
  defp buscar(_, 0, combinacion_actual, acumuladas) do
    [Enum.reverse(combinacion_actual) | acumuladas]
  end

  # Caso base: lista vacía o objetivo negativo → no válido
  defp buscar([], _, _, acumuladas), do: acumuladas
  defp buscar(_, objetivo, _, acumuladas) when objetivo < 0, do: acumuladas

  # Caso recursivo: probamos con y sin el primer elemento
  defp buscar([h | t], objetivo, combinacion_actual, acumuladas) do

    # Incluir el elemento actual
    con_h = buscar(t, objetivo - h, [h | combinacion_actual], acumuladas)

    # Excluir el elemento actual
    sin_h = buscar(t, objetivo, combinacion_actual, con_h)

    sin_h
  end

end

IO.inspect SumaObjetivo.todas_combinaciones([3, 4, 5, 2], 7)
IO.inspect SumaObjetivo.todas_combinaciones([1, 2, 3, 4, 5], 16)
