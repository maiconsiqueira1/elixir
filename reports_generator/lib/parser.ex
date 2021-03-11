defmodule ReportsGenerator.Parser do
  def build(filename) do
    "reports/#{filename}"
    |> File.stream!()
    |> Stream.map(fn line -> parse_line(line) end)
  end

  defp parse_line(line) do
    line
    |> String.trim()
    |> String.split(",")
    |> List.update_at(2, &String.to_integer/1)
   #|> List.update_at(2, fn elem -> String.to_integer(elem) end)
  end
end