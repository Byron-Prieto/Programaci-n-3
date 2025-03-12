defmodule Util do

  def agregar_lista(lista, animal_nuevo)do

    lista ++ [animal_nuevo]

  end

  def promedio_edades(lista) do

    edades = Enum.map(lista, fn animal -> animal[:age] end)
    Enum.reduce(edades, 0, fn edad, acumulador -> edad + acumulador end) / length(edades)

  end

  def peso_mayor(lista) do

    Enum.filter(lista, fn animal -> animal[:weight] > 30 end)

  end

  def nombre_empieza_a(lista) do

    Enum.filter(lista, fn animal -> String.at(String.downcase(animal[:name]), 0) == "a" end)

  end

  def eliminar_lista(lista, animal) do

    animal = Enum.find(lista, fn a -> a == animal end)
    lista -- [animal]

  end


end
