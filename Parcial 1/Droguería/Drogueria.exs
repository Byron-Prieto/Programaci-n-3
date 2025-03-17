defmodule Drogueria do
  def main do

    ventas_diarias = %{dia1: 50000, dia2: 100000, dia3: 150000, dia4: 200000, dia5: 250000}
    _ventas = Util.analizar_ventas(ventas_diarias)



  end
end

Drogueria.main()
