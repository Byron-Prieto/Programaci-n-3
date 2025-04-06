defmodule Matrushka do

  def main(numero) do

    Util.abrir(numero)
    Util.cerrar(numero)

  end
end
Matrushka.main(5)
