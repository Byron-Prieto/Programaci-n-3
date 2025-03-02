defmodule ConsumoCombustible do

  def main do

    nombre_conductor = "Ingrese el nombre del conductor: "
  |> Util.ingresar_texto(:texto)

  distancia_km = "Ingrese la distancia recorrida en km: "
  |> Util.ingresar_real(:real)

  combustible_consumido = "Ingrese el combustible consumido en litros: "
  |> Util.ingresar_real(:real)

  rendinmiento = calcular_rendimiento(distancia_km, combustible_consumido)

  generar_mensaje(nombre_conductor, rendinmiento)
  |> Util.mostrar_mensaje()

  end

  defp calcular_rendimiento(distancia_km, combustible_consumido) do
    distancia_km / combustible_consumido
  end

  defp generar_mensaje(nombre_conductor, rendinmiento) do

    rendinmiento = rendinmiento |> Float.round(2)

    "El conductor #{nombre_conductor} tiene un rendimiento de #{rendinmiento} km/litro."
  end

end

ConsumoCombustible.main()
