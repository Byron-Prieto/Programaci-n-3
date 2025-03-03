defmodule VerificarCond do

  def main do

    "ingrese el numero de cedula: "
    |> Util.ingresar_entero(:entero)
    |> verificar_cedula()
  end

  defp verificar_cedula(numero_cedula) do
    cond do
      rem(numero_cedula, 1991) == 0 -> IO.puts("Se puede aplicar el descuento")
      true -> IO.puts("No se puede aplicar el descuento")
    end
  end
end

VerificarCond.main()
