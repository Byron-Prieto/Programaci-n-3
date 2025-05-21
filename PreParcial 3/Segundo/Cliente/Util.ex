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
  IO.puts("Error: #{mensaje}")
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
end
