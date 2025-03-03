defmodule VerificarCase do

  def main do

    "ingrese el numero de cedula: "
    |> Util.ingresar_entero(:entero)
    |> verificar_cedula()
  end

  defp verificar_cedula(numero_cedula) do
    case  rem(numero_cedula, 1991) do
      0 -> IO.puts("Se puede aplicar el descuento")
      1 -> IO.puts("No se puede aplicar el descuento")

    end
  end
end

VerificarCase.main()
