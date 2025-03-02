defmodule Saludo do
  def saludar do
    "Bienvenidos a la empresa Once Ltda"
    |> Util.mostrar_mensaje()
  end
end

Saludo.saludar()
