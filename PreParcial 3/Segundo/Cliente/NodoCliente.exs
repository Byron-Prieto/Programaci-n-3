defmodule NodoCliente do
  @nombre_remoto :servidor_trabajos
  @nodo_servidor :"servidor@DESKTOP-J55V73V"

  def main do
    IO.puts("Conectando al nodo servidor...")

    case Node.connect(@nodo_servidor) do
      true ->
        IO.puts("Conexión exitosa con #{@nodo_servidor}")
        esperar_y_usar_servicio()

      false ->
        IO.puts("No se pudo conectar al nodo #{@nodo_servidor}")
    end
  end

  defp esperar_y_usar_servicio do
    # Espera breve para asegurar que el proceso remoto esté disponible
    Process.sleep(500)

    case :rpc.call(@nodo_servidor, Process, :whereis, [:servidor_trabajos]) do
      nil ->
        IO.puts("No se encontró el proceso registrado como :servidor_trabajos en #{@nodo_servidor}")
      pid ->
        iniciar_interaccion(pid)
    end
  end

  defp iniciar_interaccion(servidor) do
    send(servidor, {self(), :listar_trabajos})

    trabajos =
      receive do
        {:respuesta_trabajos, trabajos} -> trabajos
      end

    IO.puts("\nTrabajos disponibles:")
    Enum.with_index(trabajos)
    |> Enum.each(fn {t, i} -> IO.puts("#{i + 1}. #{t.titulo}") end)

    IO.puts("\nSeleccione un número:")
    seleccion = IO.gets("> ") |> String.trim() |> String.to_integer()
    titulo = Enum.at(trabajos, seleccion - 1).titulo

    send(servidor, {self(), {:autores_de, titulo}})

    receive do
      {:respuesta_autores, autores} ->
        IO.puts("\nAutores del trabajo \"#{titulo}\":\n")
        Enum.each(autores, fn a ->
          IO.puts("#{a.nombre} #{a.apellidos} - #{a.titulo} en #{a.programa} (Cédula: #{a.cedula})")
        end)

      {:error, msg} ->
        IO.puts("Error: #{msg}")
    end
  end
end

NodoCliente.main()
