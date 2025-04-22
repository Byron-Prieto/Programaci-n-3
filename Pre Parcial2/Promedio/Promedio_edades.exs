defmodule Promedio do

  def callcula_promedio([edad]), do: edad

  def calcular_promedio(edades) do

    total = Enum.reduce(edades, 0, fn edad, acc -> acc + edad end)
    promedio = total / length(edades)
    IO.puts("El promedio de las edades es: #{promedio}")
    promedio


  end
end

edades = [20, 30, 40, 50, 60]
Promedio.calcular_promedio(edades)
