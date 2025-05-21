defmodule IPlocal do

  def main() do
    Util.mostrar_mensaje("Proceso principal")

    crear_servicio()
    |> producir_elementos()

    recibir_respuestas()
  end
  def producir_elementos(servicio) do
    {:mayusculas, "Juan"}   |> enviar_mensaje(servicio)
    {:minusculas, "Pedro"}  |> enviar_mensaje(servicio)
    {:mayusculas, "Maria"}  |> enviar_mensaje(servicio)
    {&String.reverse/1, "Julian"} |> enviar_mensaje(servicio)

    "Uniquindio" |> enviar_mensaje(servicio)
    :fin |> enviar_mensaje(servicio)
end

defp crear_servicio(),
do: spawn(IPlocal, :activar_servicio, [])

defp enviar_mensaje(mensaje, servicio) do
   send(servicio,{self(), mensaje})
end

def activar_servicio() do
  receive do
    {productor, :fin} -> send(productor, :fin)

    {productor, {:mayusculas, mensaje}} ->
      send(productor, String.upcase(mensaje))
      activar_servicio()

    {productor, {:minusculas, mensaje}} ->
        send(productor, String.downcase(mensaje))
        activar_servicio()

    {productor, {funcion, mensaje}} ->
          send(productor, funcion.(mensaje))
          activar_servicio()

    {productor, mensaje} -> send(productor, "El mensaje \"#{mensaje}\" es desconocido.")
      activar_servicio()

  end
end

def recibir_respuestas() do
  receive do
    :fin ->
      :ok

    mensaje ->
      Util.mostrar_mensaje("\t -> \"#{mensaje}")
      recibir_respuestas()
  end
end
end

IPlocal.main()
