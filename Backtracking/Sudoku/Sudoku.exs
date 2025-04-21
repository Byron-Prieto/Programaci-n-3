defmodule Sudoku do

  @moduledoc """
  Módulo que implementa un solucionador de Sudoku utilizando el algoritmo de backtracking.
  Soporta tableros de cualquier tamaño NxN, siempre que N sea un cuadrado perfecto (como 4, 9, 16).

  Las celdas vacías deben representarse con el número `0`.
  """

  @doc """
  Punto de entrada principal. Recibe un tablero de Sudoku y trata de resolverlo.

  ## Parámetros
    - `board`: Lista de listas de enteros (matriz NxN) representando el tablero de Sudoku.

  ## Salidas
    - Imprime en consola el resultado del intento de resolución.
  """

  def main(board) do

    case Sudoku.solve(board) do
      {:ok, solved} ->
        IO.puts("¡Sudoku resuelto!")
        Sudoku.print_board(solved)

      {:error, :invalid_board} ->
        IO.puts("El tablero inicial es inválido.")

      :error ->
        IO.puts("No se pudo resolver el Sudoku.")
    end

  end

  @doc """
  Intenta resolver un tablero de Sudoku.

  ## Parámetros
    - `board`: Tablero a resolver.

  ## Retorna
    - `{:ok, solved_board}` si se resuelve con éxito.
    - `{:error, :invalid_board}` si el tablero inicial no es válido.
    - `:error` si no se pudo resolver.
  """

  def solve(board) do
    size = length(board)

    if valid_board?(board, size) do
      do_solve(board, size, box_size(size))
    else
      {:error, :invalid_board}
    end
  end

   @doc """
  Resuelve el Sudoku utilizando el algoritmo de backtracking.

  ## Parámetros

    - `board`: Tablero actual.
    - `size`: Tamaño del tablero.
    - `box`: Tamaño del bloque interno (e.g., 3 para 9x9).

  ## Retorna

    - `{:ok, board}` si se resuelve exitosamente.
    - `:error` si no hay solución.
  """

  defp do_solve(board, size, box) do
    case find_empty(board, size) do
      nil -> {:ok, board}
      {row, col} ->
        Enum.find_value(1..size, fn num ->
          if valid?(board, num, row, col, size, box) do
            new_board = put(board, row, col, num)
            case do_solve(new_board, size, box) do
              {:ok, solved} -> {:ok, solved}
              _ -> false
            end
          else
            false
          end
        end) || :error
    end
  end

  @doc """
  Verifica que el tablero cumpla lo siguiente:

    - Es cuadrado (NxN).
    - Cada fila tiene la longitud correcta.
    - Los valores están entre 0 y N.
    - No hay conflictos en filas, columnas ni bloques.

  """

  defp valid_board?(board, size) do
    box = box_size(size)
    is_square?(size) and
      Enum.all?(board, fn row -> length(row) == size end) and
      Enum.all?(List.flatten(board), fn val -> val in 0..size end) and
      no_conflicts?(board, size, box)
  end

  @doc """
  Verifica que no haya números repetidos en filas, columnas ni bloques.
  """

  defp no_conflicts?(board, size, box) do
    Enum.all?(0..(size - 1), fn i ->
      valid_group?(Enum.at(board, i)) and
      valid_group?(Enum.map(board, &Enum.at(&1, i))) and
      valid_group?(box_values(board, i, size, box))
    end)
  end

  @doc """
  Verifica que una lista no contenga valores repetidos (ignorando ceros).
  """

  defp valid_group?(values) do
    values
    |> Enum.reject(&(&1 == 0))
    |> then(&(&1 == Enum.uniq(&1)))
  end

  @doc """
  Devuelve todos los valores dentro de una caja (subcuadro) del Sudoku.
  """

  defp box_values(board, index, _size, box) do
    row_start = div(index, box) * box
    col_start = rem(index, box) * box

    for r <- row_start..(row_start + box - 1),
        c <- col_start..(col_start + box - 1),
        do: Enum.at(Enum.at(board, r), c)
  end

  @doc """
  Encuentra la primera celda vacía en el tablero (valor 0).
  """

  defp find_empty(board, _size) do
    Enum.with_index(board)
    |> Enum.find_value(fn {row, r_idx} ->
      Enum.with_index(row)
      |> Enum.find_value(fn {val, c_idx} ->
        if val == 0, do: {r_idx, c_idx}, else: nil
      end)
    end)
  end

  @doc """
  Verifica si es válido colocar un número en una celda específica.
  """

  defp valid?(board, num, row, col, _size, box) do
    not in_row?(board, num, row) and
    not in_col?(board, num, col) and
    not in_box?(board, num, row, col, box)
  end

  @doc """
  Verifica si el número ya está en la fila.
  """

  defp in_row?(board, num, row), do: Enum.member?(Enum.at(board, row), num)

    @doc """
  Verifica si el número ya está en la columna.
  """

  defp in_col?(board, num, col) do
    board
    |> Enum.map(&Enum.at(&1, col))
    |> Enum.member?(num)
  end

    @doc """
  Verifica si el número ya está en la caja correspondiente.
  """

  defp in_box?(board, num, row, col, box) do
    box_start_row = div(row, box) * box
    box_start_col = div(col, box) * box

    values_in_box =
      for r <- box_start_row..(box_start_row + box - 1),
          c <- box_start_col..(box_start_col + box - 1),
        do: Enum.at(Enum.at(board, r), c)

    Enum.member?(values_in_box, num)
  end

  @doc """
  Crea una nueva versión del tablero con un número insertado en la posición dada.
  """

  defp put(board, row, col, num) do
    List.update_at(board, row, fn r ->
      List.update_at(r, col, fn _ -> num end)
    end)
  end

   @doc """
  Imprime el tablero de Sudoku en la consola con formato legible.
  """

  def print_board(board) do
    Enum.each(board, fn row ->
      row
      |> Enum.map(&Integer.to_string/1)
      |> Enum.join(" ")
      |> IO.puts()
    end)
  end

  @doc """
  Calcula el tamaño de cada bloque (caja) del tablero a partir del tamaño total.
  """

  defp box_size(size) do
    root = :math.sqrt(size)
    if root == trunc(root), do: trunc(root), else: raise "El tamaño del tablero no es válido para Sudoku"
  end

  @doc """
  Verifica si un número es un cuadrado perfecto.
  """

  defp is_square?(n) do
    :math.sqrt(n) |> trunc() |> then(&(&1 * &1 == n))
  end
end


board = [
  [ 1,  0,  0,  0,   0,  0,  0,  0,   0,  0,  0,  0,   0,  0,  0,  2],
  [ 0,  0,  0,  0,   0,  0,  0,  0,   0,  0,  0,  0,   0,  0,  0,  0],
  [ 0,  0,  3,  0,   0,  0,  0,  0,   0,  0,  0,  0,   0,  0,  4,  0],
  [ 0,  0,  0,  0,   0,  0,  0,  5,   0,  0,  0,  0,   0,  0,  0,  0],

  [ 0,  0,  0,  0,   6,  0,  0,  0,   0,  0,  7,  0,   0,  0,  0,  0],
  [ 0,  0,  0,  0,   0,  8,  0,  0,   0,  0,  0,  9,   0,  0,  0,  0],
  [ 0,  0,  0,  0,   0,  0, 10,  0,   0, 11,  0,  0,   0,  0,  0,  0],
  [ 0,  0,  0,  0,   0,  0,  0, 12,   0,  0,  0,  0,   0, 13,  0,  0],

  [ 0, 14,  0,  0,   0,  0,  0,  0,   0,  0, 15,  0,   0,  0,  0,  0],
  [ 0,  0,  0,  0,   0,  0, 16,  0,   0,  0,  0,  0,   0,  0,  0,  0],
  [ 0,  0,  0,  0,   0,  0,  0,  0,   1,  0,  0,  0,   0,  0,  0,  0],
  [ 0,  0,  0,  0,   0,  0,  0,  0,   0,  2,  0,  0,   0,  0,  0,  0],

  [ 3,  0,  0,  0,   0,  0,  0,  0,   0,  0,  0,  0,   4,  0,  0,  0],
  [ 0,  0,  0,  0,   0,  0,  0,  0,   0,  0,  0,  0,   0,  0,  0,  0],
  [ 0,  0,  0,  0,   0,  0,  0,  0,   0,  0,  0,  0,   0,  0,  0,  0],
  [ 0,  0,  0,  5,   0,  0,  0,  0,   0,  0,  0,  0,   0,  0,  0,  6]
]

Sudoku.main(board)
