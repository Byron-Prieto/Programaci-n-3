defmodule Estructura do

  def main do

    "Ingrese los datos del cliente: "
    |> Customer.ingresar(:customers)
    |> Customer.generar_mensaje_customers(&generar_mensaje/1)
    |> Util.mostrar_mensaje()
  end

  def generar_mensaje(customer) do

    height = customer.height |> Float.round(2)
    "Hola #{customer.name}, tu edad es de #{customer.age} años y " <>
    "tienes una altura de #{height}\n"
  end
end

Estructura.main()
