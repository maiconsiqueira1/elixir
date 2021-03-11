defmodule ReportsGeneratorStream do
  def build(filename) do
    filename
    |> ReportsGenerator.Parser.parse_line()
    |> Enum.reduce(map_acc(), fn [id, _food, price], report ->
    Map.put(report, id, report[id] + price)
    end)
  end

  defp map_acc do
    Enum.into(1..30, %{}, fn x -> {Integer.to_string(x), 0} 
  end)
  end
end