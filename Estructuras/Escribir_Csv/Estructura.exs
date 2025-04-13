defmodule Estructura do

  def main do
    clientes = "\nIngrese los datos del cliente: "
    |> Cliente.ingresar(:clientes)
    titulos = "nombre,edad,altura\n"
    CSV.escribir_csv(clientes, "clientes.csv", titulos, &Cliente.convertir_cliente_linea_csv/1)
  end
end

Estructura.main()
