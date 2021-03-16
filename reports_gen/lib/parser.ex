defmodule ReportsGen.Parser do
  def parse_line(line) do
    line
    |> String.trim()
    |> String.split(",")
    |> line_update(4)
  end

  def line_update(line, index) when index <= 1 do
    List.update_at(line, index, fn elem -> String.to_integer(elem) end)
  end

  def line_update(line, index) do
    List.update_at(line, index, fn elem -> String.to_integer(elem) end)
    |> line_update(index - 1)
  end
end
