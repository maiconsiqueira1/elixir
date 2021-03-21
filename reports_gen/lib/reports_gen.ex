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

  def calc_values(
        [name, worked_hours, _day, month, year],
        %{
          "all_hours" => all_hours,
          "hours_per_month" => hours_per_month,
          "hours_per_year" => hours_per_year
        }
      ) do
    all_hours = Map.put(all_hours, name, all_hours[name] + worked_hours)
    hours_per_month = Map.put(hours_per_month, name, 
      Map.put(hours_per_month[name],month, hours_per_month[name][month] + worked_hours))

    hours_per_year = Map.put(hours_per_year, name, 
      Map.put(hours_per_year[name],year, hours_per_year[name][year] + worked_hours))

    %{
      "all_hours" => all_hours,
      "hours_per_month" => hours_per_month,
      "hours_per_year" => hours_per_year
    }
  end

  def map_users do
    hours_per_month = Enum.into(@available_month, %{}, fn x -> {x, 0} end)
    hours_per_year = Enum.into(@available_years, %{}, fn x -> {x, 0} end)

    %{
      "all_hours" => %{},
      "hours_per_month" => hours_per_month,
      "hours_per_year" => hours_per_year
    }

    |> Map.put("all_hours", build_report(0))
    |> Map.put("hours_per_month", build_report(hours_per_month))
    |> Map.put("hours_per_year", build_report(hours_per_year))
  end

  def build_report(value) do
    Enum.into(@available_users, %{}, fn x -> {x, value} end)
  end

end
