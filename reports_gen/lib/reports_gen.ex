defmodule ReportsGen do
  alias ReportsGen.Parser

  @available_users [
    "Cleiton",
    "Daniele",
    "Danilo",
    "Diego",
    "Giuliano",
    "Jakeliny",
    "Joseph",
    "Mayk",
    "Rafael",
    "Vinicius"
  ]

  def readfile(file_name) do
    File.stream!("reports/#{file_name}")
    #|> Enum.map(fn line -> Parser.parse_line(line) end)
    |> Enum.reduce(map_users(), fn line, acc -> 
      [user, hr, _dia, _mes, _ano] = Parser.parse_line(line)
      Map.put(acc, user, hr + acc[user]) 
      end)
  end

  def map_users() do
    Enum.into(@available_users, %{}, fn x -> {x, 0} end)
  end

end
