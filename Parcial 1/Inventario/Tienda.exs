defmodule Tienda do

  def main do

    inventario = %{celular: 10, laptop: 5, tablet: 3}

    inventario = Util.actualizar_inventario(inventario, :celular, 5)
    inventario = Util.actualizar_inventario(inventario, :tablet, 2)
    inventario = Util.actualizar_inventario(inventario, :laptop, 1)
    inventario = Util.actualizar_inventario(inventario, :monitor, 3)

    IO.inspect(inventario)

  end

end

Tienda.main()
