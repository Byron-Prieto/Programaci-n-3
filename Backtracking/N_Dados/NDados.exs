defmodule NDados do
  def lanzar_dados(n, objetivo) do
    IO.puts("Comenzando búsqueda con #{n} dados y objetivo #{objetivo}")
    soluciones = backtrack(n, objetivo, [])

    if soluciones == [] do
      IO.puts("No hay combinaciones posibles.")
    else
      IO.puts("Combinaciones encontradas:")
      Enum.each(soluciones, fn comb -> IO.puts("{#{Enum.join(comb, ", ")}}") end)
    end
  end

  defp backtrack(0, 0, combinacion) do
    [Enum.reverse(combinacion)]
  end

  defp backtrack(0, _objetivo, _combinacion), do: []

  defp backtrack(n, objetivo, combinacion) do
    Enum.reduce(1..6, [], fn cara, acc ->
      if objetivo - cara >= 0 do
        acc ++ backtrack(n - 1, objetivo - cara, [cara | combinacion])
      else
        acc
      end
    end)
  end
end

defmodule Main do
  def ejecutar do
    IO.puts("=== Algoritmo N Dados con Backtracking ===")

    n = Util.ingresar_entero("Ingrese el número de dados: ", :entero)
    objetivo = Util.ingresar_entero("Ingrese la suma objetivo: ", :entero)

    NDados.lanzar_dados(n, objetivo)
  end
end


Main.ejecutar()
