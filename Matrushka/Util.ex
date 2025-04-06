defmodule Util do

  def abrir_cerrar(numero) when numero >= 0 do
    abrir(numero)
    cerrar(numero)
  end

  defp abrir(numero) when numero >= 0 do

    IO.puts("Abriendo Matrushka #{numero}")
    abrir(numero - 1)
  end

  defp cerrar(numero) when numero > 0 do

    cerrar(numero - 1)
    IO.puts("Cerrando Matrushka #{numero}")
  end

end
