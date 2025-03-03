defmodule VerificarGuards do

  def main do

    "ingrese el numero de cedula: "
    |> Util.ingresar_entero(:entero)
    |> verificar_cedula()
  end

  defp verificar_cedula(numero_cedula) when rem(numero_cedula, 1991) == 0, do: IO.puts("Se puede aplicar el descuento")
  defp verificar_cedula(numero_cedula) when rem(numero_cedula, 1991) != 0, do: IO.puts("No se puede aplicar el descuento")
end

VerificarGuards.main()
