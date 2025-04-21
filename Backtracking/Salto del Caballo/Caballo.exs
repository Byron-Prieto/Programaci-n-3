defmodule Caballo do
  @movimientos [
    {2, 1}, {1, 2}, {-1, 2}, {-2, 1},
    {-2, -1}, {-1, -2}, {1, -2}, {2, -1}
  ]

  # Inicializa un tablero de nxn lleno de ceros
  defp inicializar_tablero(n) do
    List.duplicate(List.duplicate(0, n), n)
  end

  # Verifica si el movimiento es válido
  defp movimiento_valido?(tablero, x, y) do
    x >= 0 and y >= 0 and
      x < length(tablero) and
      y < length(tablero) and
      Enum.at(Enum.at(tablero, y), x) == 0
  end

  # Intenta realizar el recorrido completo
  defp realizar_salto(tablero, x, y, paso, n) when paso == n * n do
    {:ok, actualizar_tablero(tablero, x, y, paso)}
  end

  defp realizar_salto(tablero, x, y, paso, n) do
    if movimiento_valido?(tablero, x, y) do
      tablero = actualizar_tablero(tablero, x, y, paso)

      Enum.reduce_while(@movimientos, :error, fn {dx, dy}, acc ->
        nx = x + dx
        ny = y + dy

        case realizar_salto(tablero, nx, ny, paso + 1, n) do
          {:ok, resultado} -> {:halt, {:ok, resultado}}
          :error -> {:cont, acc}
        end
      end)
    else
      :error
    end
  end

  # Actualiza una posición del tablero con el paso actual
  defp actualizar_tablero(tablero, x, y, paso) do
    List.update_at(tablero, y, fn fila ->
      List.update_at(fila, x, fn _ -> paso end)
    end)
  end

  # Muestra el tablero
  defp imprimir_tablero(tablero) do
    Enum.each(tablero, fn fila ->
      fila
      |> Enum.map(&String.pad_leading(Integer.to_string(&1), 2, "0"))
      |> Enum.join(" ")
      |> IO.puts()
    end)
  end

  # Punto de entrada
  def iniciar(n \\ 8) do
    tablero = inicializar_tablero(n)
    IO.puts("Iniciando el Caballo en la posición (0, 0) en un tablero de #{n}x#{n}\n")

    case realizar_salto(tablero, 0, 0, 1, n) do
      {:ok, resultado} ->
        IO.puts("¡Recorrido exitoso!\n")
        imprimir_tablero(resultado)

      :error ->
        IO.puts("No se encontró una solución.")
    end
  end
end

# Ejecuta el algoritmo con un tablero de 8x8
Caballo.iniciar(8)
