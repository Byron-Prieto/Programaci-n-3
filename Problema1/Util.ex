defmodule Util do
  def mostrar_mensaje(mensaje) do
    System.cmd("java", ["-cp", ".", "Mensaje", mensaje])
  end
  def ingresar(mensaje) do
    {salida, _} = System.cmd("java", ["-cp", ".", "Mensaje", "input", mensaje])
  end
end
