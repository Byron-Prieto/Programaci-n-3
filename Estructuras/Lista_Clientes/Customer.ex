defmodule Customer do

  defstruct name: "", age: 0, height: 0.0

  def create(name, age, height) do

    %Customer{name: name, age: age, height: height}
  end

  def ingresar(mensaje) do

    mensaje
    |> Util.mostrar_mensaje()

    name = "Ingrese su nombre: "
    |> Util.ingresar_texto(:texto)

    age = "Ingrese su edad: "
    |> Util.ingresar_entero(:entero)

    height = "Ingrese su altura: "
    |> Util.ingresar_real(:real)
    create(name, age, height)
  end

  def ingresar(mensaje, :customers) do
    mensaje
    |> ingresar([], :customers)
  end

  def ingresar(mensaje, lista, :customers) do
    customer =
    mensaje
    |> ingresar()
    nueva_lista = lista ++ [customer]
    mas_customers =
    "\nIngresar más clientes (s/n): "
    |> Util.ingresar(:boolean)
    case mas_customers do
      true ->
      mensaje
      |> ingresar(nueva_lista, :customers)
      false ->
      nueva_lista
    end
  end

  def generar_mensaje_customers(lista_customers, parser) do
    lista_customers
    |> Enum.map(parser)
    |> Enum.join()
  end
end
