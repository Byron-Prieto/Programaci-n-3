defmodule Util do

  def analizar_ventas(ventas_diarias) do
    ventas = Map.values(ventas_diarias)
    total_ventas = Enum.reduce(ventas, 0, &(&1 + &2))
    promedio = total_ventas/length(ventas)
    dia_mejor_venta = Enum.max_by(ventas_diarias, fn {_k, v} -> v end)

    case total_ventas do
        0 -> IO.inspect({0, 0, "No hay datos"})
        _ -> IO.inspect({total_ventas, promedio, dia_mejor_venta})

    end

  end
end
