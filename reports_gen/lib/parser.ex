defmodule ReportsGen.Parser do
@available_month %{
  1 => "Janeiro",
  2 => "Fevereiro",
  3 => "Março",
  4 => "Abril",
  5 => "Maio",
  6 => "Junho",
  7 => "Julho",
  8 => "Agosto",
  9 => "Setembro",
  10 => "Outubro",
  11 => "Novembro",
  12 => "Dezembro"
}

  def build(filename) do
    File.stream!("reports/#{filename}")
    |> Stream.map(fn line -> parse_line(line) end)
  end

  defp parse_line(line) do
    String.trim(line)
    |> String.split(",")
    |> List.update_at(3, fn month -> month = String.to_integer(month) 
    @available_month[month] 
    end)
    |> line_update(1)
    |> line_update(2)
    |> line_update(4)

  end

  #def line_update(line, index) when index <= 1 do
  #  List.update_at(line, index, fn elem -> String.to_integer(elem) end)
  #end

  defp line_update(line, index) do
    List.update_at(line, index, fn elem -> String.to_integer(elem) end)
   # |> line_update(index - 1)
  end
end
