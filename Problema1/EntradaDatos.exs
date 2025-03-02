defmodule EntradaDatos do
  def main do
    "ingrese el nombre del empleado: "
    |> Util.ingresar()
    |> generar_mensaje()
    |> Util.mostrar_mensaje()
  end
  defp generar_mensaje(nombre) do
    "Bienvenido #{nombre} a la empresa Once ltda"
  end
end

EntradaDatos.main()
