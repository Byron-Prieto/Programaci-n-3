defmodule EntradaEnteros do
  def main do
    valor_total = Util.ingresar("Ingrese el valor total de la factura:", :entero)
    valor_entregado = Util.ingresar("Ingrese el valor entregado para el pago:", :entero)

    case calcular_devuelta(valor_entregado, valor_total) do
      {:ok, devuelta} ->
        Util.mostrar_mensaje("El valor a devolver es: $#{devuelta}")

      {:error, mensaje} ->
        Util.mostrar_error(mensaje)
    end
  end

  defp calcular_devuelta(valor_entregado, valor_total) do
    if valor_entregado >= valor_total do
      {:ok, valor_entregado - valor_total}
    else
      {:error, "Error: El valor entregado es menor que el total de la factura."}
    end
  end
end

EntradaEnteros.main()
