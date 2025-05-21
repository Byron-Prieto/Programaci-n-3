defmodule ProcesoMensajes do
  def iniciar_proceso do

    pid = spawn(fn -> loop() end)
    pid
  end

  defp loop do
    # Esperar mensajes
    receive do
      {:mensaje, contenido} ->
        IO.puts("Inicio del proceso para el mensaje: #{contenido}")
        :timer.sleep(1000) # Simular un tiempo de procesamiento
        IO.puts("Fin del proceso para el mensaje: #{contenido}")
        loop() # Continuar escuchando mensajes

      :detener ->
        IO.puts("Proceso detenido.")

      _otro ->
        IO.puts("Mensaje no reconocido.")
        loop() # Continuar escuchando mensajes
    end
  end

  def loop_usuario(pid) do
    comando = IO.gets("Escriba 'iniciar' para enviar un mensaje o 'terminar' para detener el proceso: ") |> String.trim()

    case comando do
      "iniciar" ->
        mensaje = IO.gets("Ingrese un mensaje: ") |> String.trim()
        send(pid, {:mensaje, mensaje})
        loop_usuario(pid) # Continuar el bucle

      "terminar" ->
        send(pid, :detener)
        IO.puts("El proceso ha sido terminado.")

      _ ->
        IO.puts("Comando no reconocido. Intente nuevamente.")
        loop_usuario(pid) # Continuar el bucle
    end
  end
end

defmodule Main do
  def main do
    pid = ProcesoMensajes.iniciar_proceso()
    ProcesoMensajes.loop_usuario(pid)
  end
end

Main.main()
