defmodule Util do

  def mostrar_mensaje(mensaje) do
    mensaje
    |> IO.puts()
  end

  def ingresar_texto(mensaje, :texto) do
    mensaje
    |> IO.gets()
    |> String.trim()
  end

  #ingresar entero
  def ingresar_entero(mensaje, :entero), do: ingresar(mensaje, &String.to_integer/1, :entero)

  # ingresar real
  def ingresar_real(mensaje, :real), do: ingresar(mensaje, &String.to_float/1, :real)

  def mostrar_error(mensaje) do
    System.cmd("java", ["Mensaje", mensaje])
  end

  defp ingresar(mensaje, parser, tipo_dato) do
    try do
    mensaje
    |> ingresar_texto(:texto)
    |> parser.()
    rescue
    ArgumentError ->
    "Error, se espera que ingrese un número #{tipo_dato}\n"
    |> mostrar_error()
    mensaje
    |> ingresar(parser, tipo_dato)
    end
  end

  def ingresar_tipo_vehiculo() do
    mensaje = """
    Seleccione el tipo de Vehiculo:
    1. Carro
    2. Moto
    3. Camion
    """
    IO.puts(mensaje)

    case IO.gets("Opción: ") |> String.trim() do
      "1" -> :carro
      "2" -> :moto
      "3" -> :camion
      _ ->
        IO.puts("Error: Opción inválida. Intente de nuevo.")
        ingresar_tipo_vehiculo()
    end
  end


end
