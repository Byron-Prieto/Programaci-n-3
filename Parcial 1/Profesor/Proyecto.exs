defmodule Proyecto do

  def main do

    calificaciones = %{juan: [8, 6, 7], ana: [9, 9, 8], luis: [5, 6, 6]}

    _luis = Util.evaluar_proyecto(calificaciones, :luis)
    _juan = Util.evaluar_proyecto(calificaciones, :juan)
    _ana = Util.evaluar_proyecto(calificaciones, :ana)
    _esteban = Util.evaluar_proyecto(calificaciones, :esteban)

  end
end

Proyecto.main()
