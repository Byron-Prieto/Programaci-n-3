defmodule VerificarIf do

  def main do

    "ingrese el numero de cedula: "
    |> Util.ingresar_entero(:entero)
    |> verificar_cedula()
  end

  defp verificar_cedula(numero_cedula) do
    if rem(numero_cedula, 1991) == 0 do
      IO.puts("El descuento se puede aplicar")
    else
      IO.puts("El descuento no se puede aplicar")
    end
  end
end

VerificarIf.main()
