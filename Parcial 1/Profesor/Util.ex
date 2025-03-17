defmodule Util do

  def evaluar_proyecto(calificaciones, nombre) do

    case Map.get(calificaciones, nombre) do

      nil -> IO.inspect({0, "No encontrado"})
      calificaciones
      x -> promedio = Enum.reduce(x, 0, &(&1 + &2))/length(x)
      promedio2 = Float.round(promedio, 1)
      if promedio2 >= 6 do
        IO.inspect({promedio2, "Aprobado"})
      else
        IO.inspect({promedio2, "Reprobado"})
      end

    end
  end
end
