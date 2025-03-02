defmodule Util do
  # Mostrar mensaje con JOptionPane
  def mostrar_mensaje(mensaje) do
    System.cmd("java", ["Mensaje", mensaje])
  end

  # Pedir un número entero con JOptionPane en Java
  def ingresar(mensaje, :entero) do
    case ingresar_con_java(mensaje) do
      {:ok, numero} -> numero
      {:error, _} ->
        mostrar_error("Error: Se esperaba un número entero.")
        ingresar(mensaje, :entero)  # Vuelve a pedir el número
    end
  end

  # Ejecuta el programa Java para pedir un número
  defp ingresar_con_java(mensaje) do
    {resultado, 0} = System.cmd("java", ["Mensaje", "input", mensaje])

    resultado
    |> String.trim()
    |> Integer.parse()
    |> case do
      {numero, _} -> {:ok, numero}
      :error -> {:error, "Entrada inválida"}
    end
  rescue
    _ -> {:error, "Error al ejecutar Java"}
  end

  def mostrar_error(mensaje) do
    System.cmd("java", ["Mensaje", mensaje]) # Muestra el error en JOptionPane
  end
end

