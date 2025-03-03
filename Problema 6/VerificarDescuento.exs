defmodule VerificarDescuento do

  def main do

    "Ingrese los años de antigüedad del cliente: "
    |> Util.ingresar_entero(:entero)
    |> verificar_descuento()
  end

  defp verificar_descuento(años) do
    cond do
      años >= 1 && años <=2 -> "Descuento del 10%"
      años >=3 && años <= 6 -> "Descuento del 14%"
      años > 6 -> "Descuento del 17%"
      true -> "No hay descuento"

    end
    |> Util.mostrar_mensaje()
  end

end

VerificarDescuento.main()
