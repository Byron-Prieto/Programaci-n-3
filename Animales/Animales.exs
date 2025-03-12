defmodule Animales do

def main do

  lista_animales = []

  lista_animales = Util.agregar_lista(lista_animales, %{name: "Po", weight: 31, age: 7})
  lista_animales = Util.agregar_lista(lista_animales, %{name: "Pepita", weight: 25, age: 5})
  lista_animales = Util.agregar_lista(lista_animales, %{name: "Pe", weight: 40, age: 10})
  lista_animales = Util.agregar_lista(lista_animales, %{name: "Ana", weight: 20, age: 3})
  lista_animales = Util.agregar_lista(lista_animales, %{name: "Arepa", weight: 35, age: 8})
  lista_animales = [%{name: "Arturo", weight: 33, age: 8} | lista_animales]

  promedio = Util.promedio_edades(lista_animales)

  peso_mayor_30 = Util.peso_mayor(lista_animales)

  nombre_empieza_a = Util.nombre_empieza_a(lista_animales)

  IO.inspect(lista_animales)

  lista_animales = Util.eliminar_lista(lista_animales, %{name: "Po", weight: 31, age: 7})

  IO.inspect(lista_animales)
  IO.puts("Promedio de edades: #{promedio}")
  IO.inspect(peso_mayor_30)
  IO.inspect(nombre_empieza_a)
end

end

Animales.main()
