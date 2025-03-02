defmodule CostoEnvio do

  def calcular_costo() do

    cliente = Util.ingresar_texto("Ingrese el nombre del cliente: ", :texto)
    peso = Util.ingresar_real("Ingrese el peso del paquete en kg: ", :real)
    tipo_envio = Util.ingresar_tipo_envio()

    costo =
      case tipo_envio do
        :economico -> peso * 5000
        :express -> peso * 8000
        :internacional ->
          if peso <= 5 do
            peso * 15000
          else
            peso * 12000
          end
      end

    Util.mostrar_mensaje("Cliente: #{cliente}")
    Util.mostrar_mensaje("Peso del paquete: #{peso}")
    Util.mostrar_mensaje("Tipo de envío: #{tipo_envio}")
    Util.mostrar_mensaje("Costo total: #{costo}")

    {cliente, peso, tipo_envio, costo}
  end
end

CostoEnvio.calcular_costo()
