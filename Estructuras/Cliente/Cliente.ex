defmodule Cliente do

  defstruct nombre: "", edad: 0, altura: 0.0

  def crear(nombre, edad, altura) do

    %Cliente{nombre: nombre, edad: edad, altura: altura}
  end

  def ingresar(mensaje) do

    mensaje
    |> Util.mostrar_mensaje()

    nombre = "Ingrese su nombre: "
    |> Util.ingresar_texto(:texto)

    edad = "Ingrese su edad: "
    |> Util.ingresar_entero(:entero)

    altura = "Ingrese su altura: "
    |> Util.ingresar_real(:real)
    crear(nombre, edad, altura)
  end
end
