defmodule Cliente do
  defstruct nombre: "", edad: 0, altura: 0.0
end

defmodule Habitacion do
  defstruct numero: 0, tipo: :sencilla  # Puede ser :sencilla o :doble
end

defmodule Reserva do
  defstruct codigo: "",
            fecha_reserva: "",
            fecha_entrada: "",
            total: 0.0,
            tipo_habitacion: :sencilla,
            cliente: %Cliente{},
            habitaciones: []
end
