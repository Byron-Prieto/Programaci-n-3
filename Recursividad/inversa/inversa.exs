defmodule StringReverser do
  def reverse(str) do
    str
    |> String.to_charlist()
    |> reverse_list()
    |> List.to_string()
  end

  defp reverse_list([]), do: []
  defp reverse_list([head | tail]), do: reverse_list(tail)++[head]
end

IO.puts(StringReverser.reverse("Hola"))
