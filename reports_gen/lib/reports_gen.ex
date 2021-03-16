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

  @available_month [
    1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12
  ]

  @available_years [
    2016, 
    2017, 
    2018, 
    2019, 
    2020
  ]

  def readfile(file_name) do
    File.stream!("reports/#{file_name}")
    # |> Enum.map(fn line -> Parser.parse_line(line) end)
    |> Enum.reduce(map_users(), fn line, acc ->
      [user, hr, _dia, _mes, _ano] = Parser.parse_line(line)
      Map.put(acc, user, hr + acc[user])
    end)
  end

  def map_users do
    users = Enum.into(@available_users, %{}, fn x -> {x, 0} end)
    month = Enum.into(@available_month, %{}, fn x -> {x, 0} end)
    years = Enum.into(@available_years, %{}, fn x -> {x, 0} end)

    %{
      "users" => users,
      "month" => month,
      "years" => years
    }
  end

end
