defmodule Util do

  def ingresar_tipo_envio() do
    mensaje = """
    Ingrese el tipo de envio:
    1. Económico
    2. Express
    3. Internacional
    """
    IO.puts(mensaje)

    case IO.gets("Opción: ") |> String.trim() do
      "1" -> :economico
      "2" -> :express
      "3" -> :internacional
      _ ->
        IO.puts("Error: Opción inválida. Intente de nuevo.")
        ingresar_tipo_envio()
    end
  end

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
end
