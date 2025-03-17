defmodule Util do

  def actualizar_inventario(inventario, producto, cantidad) do
    case Map.get(inventario, producto) do

      nil -> IO.puts("Producto no encontrado")
      inventario
      x -> Map.put(inventario, producto, x + cantidad)

    end
  end



end
