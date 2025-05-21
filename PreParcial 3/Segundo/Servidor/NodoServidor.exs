defmodule NodoServidor do
  @nombre_servicio_local :servidor_trabajos

  def main do
    IO.puts("Nombre del nodo: #{inspect(Node.self())}")
    IO.puts("Iniciando servidor de trabajos de grado...")
    Process.register(self(), @nombre_servicio_local)
    procesar_mensajes(cargar_datos())
  end

  defp cargar_datos do
    trabajos = [
      %{
        titulo: "Sistema Académico",
        fecha: ~D[2023-01-01],
        descripcion: "Gestión de estudiantes",
        autores: ["123", "456"]
      },
      %{
        titulo: "Vigilancia Inteligente",
        fecha: ~D[2023-06-15],
        descripcion: "Monitoreo con IA",
        autores: ["789", "456"]
      },
      %{
        titulo: "Red Estudiantil",
        fecha: ~D[2022-12-10],
        descripcion: "Conectar estudiantes",
        autores: ["123", "101"]
      }
    ]

    autores = %{
      "123" => %{nombre: "Ana", apellidos: "Gómez", cedula: "123", programa: "Sistemas", titulo: "Ingeniera"},
      "456" => %{nombre: "Luis", apellidos: "Pérez", cedula: "456", programa: "Industrial", titulo: "Ingeniero"},
      "789" => %{nombre: "Sara", apellidos: "López", cedula: "789", programa: "Electrónica", titulo: "Ingeniera"},
      "101" => %{nombre: "Carlos", apellidos: "Ramírez", cedula: "101", programa: "Administración", titulo: "Administrador"},
      "202" => %{nombre: "Lucía", apellidos: "Martínez", cedula: "202", programa: "Derecho", titulo: "Abogada"}
    }

    %{trabajos: trabajos, autores: autores}
  end

  defp procesar_mensajes(state) do
    receive do
      {remitente, :listar_trabajos} ->
        send(remitente, {:respuesta_trabajos, state.trabajos})
        procesar_mensajes(state)

      {remitente, {:autores_de, titulo}} ->
        case Enum.find(state.trabajos, fn t -> t.titulo == titulo end) do
          nil ->
            send(remitente, {:error, "Trabajo no encontrado"})
          trabajo ->
            autores = Enum.map(trabajo.autores, fn ced -> state.autores[ced] end)
            send(remitente, {:respuesta_autores, autores})
        end
        procesar_mensajes(state)

      {_, :fin} ->
        IO.puts("Finalizando servidor.")
        :ok
    end
  end
end

NodoServidor.main()
