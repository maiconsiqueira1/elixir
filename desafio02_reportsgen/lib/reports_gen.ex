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
    "Janeiro",
    "Fevereiro",
    "Março",
    "Abril",
    "Maio",
    "Junho",
    "Julho",
    "Agosto",
    "Setembro",
    "Outubro",
    "Novembro",
    "Dezembro"
  ]

  @available_years [
    2016,
    2017,
    2018,
    2019,
    2020
  ]

  def build(filename) do
    Parser.build(filename)
    # |> Enum.map(fn line -> Parser.parse_line(line) end)
    |> Enum.reduce(map_users(), fn line, acc -> calc_values(line, acc) end)
  end

  def build_many(filenames) when not is_list(filenames) do
    {:error, "it is not a list"}
  end

  def build_many(filenames) do
    result =
      filenames
      |> Task.async_stream(fn filename -> build(filename) end)
      |> Enum.reduce(map_users(), fn {:ok, result}, report -> sum_reports(report, result) end)

    {:ok, result}
  end

  defp sum_reports(
         %{
           "all_hours" => all_hours1,
           "hours_per_month" => hours_per_month1,
           "hours_per_year" => hours_per_year1
         },
         %{
           "all_hours" => all_hours2,
           "hours_per_month" => hours_per_month2,
           "hours_per_year" => hours_per_year2
         }
       ) do
    all_hours = map_merge(all_hours1, all_hours2)
    hours_per_month = map_mergeconcat(hours_per_month1, hours_per_month2)
    hours_per_year = map_mergeconcat(hours_per_year1, hours_per_year2)

    %{
      "all_hours" => all_hours,
      "hours_per_month" => hours_per_month,
      "hours_per_year" => hours_per_year
    }
  end

  defp map_merge(map1, map2) do
    Map.merge(map1, map2, fn _key, value1, value2 -> value1 + value2 end)
  end

  defp map_mergeconcat(map1, map2) do
    Map.merge(map1, map2, fn _key, value1, value2 -> map_merge(value1, value2) end)
  end

  defp calc_values(
         [name, worked_hours, _day, month, year],
         %{
           "all_hours" => all_hours,
           "hours_per_month" => hours_per_month,
           "hours_per_year" => hours_per_year
         }
       ) do
    all_hours = Map.put(all_hours, name, all_hours[name] + worked_hours)

    hours_per_month =
      Map.put(
        hours_per_month,
        name,
        Map.put(hours_per_month[name], month, hours_per_month[name][month] + worked_hours)
      )

    hours_per_year =
      Map.put(
        hours_per_year,
        name,
        Map.put(hours_per_year[name], year, hours_per_year[name][year] + worked_hours)
      )

    %{
      "all_hours" => all_hours,
      "hours_per_month" => hours_per_month,
      "hours_per_year" => hours_per_year
    }
  end

  defp map_users do
    hours_per_month = Enum.into(@available_month, %{}, fn x -> {x, 0} end)
    hours_per_year = Enum.into(@available_years, %{}, fn x -> {x, 0} end)

    %{
      "all_hours" => %{},
      "hours_per_month" => hours_per_month,
      "hours_per_year" => hours_per_year
    }
    |> Map.put("all_hours", map_builder(0))
    |> Map.put("hours_per_month", map_builder(hours_per_month))
    |> Map.put("hours_per_year", map_builder(hours_per_year))
  end

  defp map_builder(value) do
    Enum.into(@available_users, %{}, fn x -> {x, value} end)
  end
end
