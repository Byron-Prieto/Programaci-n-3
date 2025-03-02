defmodule Temperatura do
  def main do
  temperatura = "Ingrese la temperatura en celsius: "
  |> Util.ingresar_real(:real)

  fahrenheit = calcularTempFahrenheit (temperatura)

  kelvin = calcularTempKelvin (temperatura)

  generar_mensaje(fahrenheit, kelvin)
  |> Util.mostrar_mensaje()

  end

  defp generar_mensaje(fahrenheit, kelvin) do
  fahrenheit = fahrenheit |> Float.round(1)
  kelvin = kelvin |> Float.round(1)

  "La temperatura en grados fahrenheit es #{fahrenheit} y en grados kelvin es #{kelvin}"
  end

  defp calcularTempFahrenheit (temperatura) do
  (temperatura * 9/5) + 32
  end

  defp calcularTempKelvin (temperatura) do
  temperatura + 273.15
  end

end

Temperatura.main()
