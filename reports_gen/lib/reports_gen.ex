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
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12
  ]

  @available_years [
    2016,
    2017,
    2018,
    2019,
    2020
  ]

  def build do
    Parser.build("gen_report.csv")
    # |> Enum.map(fn line -> Parser.parse_line(line) end)
    |> Enum.reduce(map_users(), fn line, acc -> calc_values(line, acc) end)
  end

  def fetch_higher(acc) do
    Enum.max_by(acc, fn {_key, value} -> value end)
  end

  def calc_values(
        [user_name, _hr_rate, _day_rate, mes_rate, ano_rate],
        %{"users" => users, "month" => month, "years" => years} = acc
      ) do
    users = Map.put(users, user_name, users[user_name] + 1)
    years = Map.put(years, ano_rate, years[ano_rate] + 1 )
    month = Map.put(month, mes_rate, month[mes_rate] + 1 )

    %{acc | "users" => users, "month" => month, "years" => years}
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
