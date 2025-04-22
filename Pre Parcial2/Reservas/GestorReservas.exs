defmodule GestorReservas do
  def guardar_reservas_csv(reservas, archivo) do
    encabezado = "Código,FechaReserva,FechaEntrada,Total,TipoHabitación,Cliente,ListaHabitaciones\n"

    datos =
      reservas
      |> Enum.map(&reserva_a_csv/1)
      |> Enum.join("\n")

    File.write!(archivo, encabezado <> datos)
  end

  defp reserva_a_csv(%Reserva{
    codigo: cod,
    fecha_reserva: fr,
    fecha_entrada: fe,
    total: total,
    tipo_habitacion: tipo,
    cliente: %Cliente{nombre: nom, edad: edad, altura: altura},
    habitaciones: habitaciones
  }) do
    cliente_str = "#{nom}-#{edad}-#{altura}"
    habitaciones_str =
      habitaciones
      |> Enum.map(fn %Habitacion{numero: num, tipo: tipo} -> "#{num}-#{tipo}" end)
      |> Enum.join("|")

    "#{cod},#{fr},#{fe},#{total},#{tipo},#{cliente_str},#{habitaciones_str}"
  end
end

cliente1 = %Cliente{nombre: "Ana Pérez", edad: 30, altura: 1.65}
habitaciones = [%Habitacion{numero: 101, tipo: :sencilla}, %Habitacion{numero: 102, tipo: :sencilla}]
reserva1 = %Reserva{
  codigo: "R001",
  fecha_reserva: "2025-04-21",
  fecha_entrada: "2025-05-01",
  total: 450.50,
  tipo_habitacion: :sencilla,
  cliente: cliente1,
  habitaciones: habitaciones
}

GestorReservas.guardar_reservas_csv([reserva1], "reservas.csv")
