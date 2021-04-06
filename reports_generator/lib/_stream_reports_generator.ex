defmodule ReportsGeneratorStream do
  alias ReportsGenerator.Parser

  @available_foods [
    "açaí",
    "churrasco",
    "esfirra",
    "hambúrguer",
    "pastel",
    "pizza",
    "prato_feito",
    "sushi"
  ]

  @options [
    "foods",
    "users"
  ]

  def build(filename) do
    filename
    |> Parser.parser()
    |> Enum.reduce(map_acc(), fn line, report ->
    sum_values(line,report)
    end)
  end

  def build_many(filenames) when  not is_list(filenames) do
    {:error, "it is not a list"}
  end

  def build_many(filenames) do
    filenames
    |> Task.async_stream(fn filename -> build(filename) end)
    |> Enum.reduce(map_acc(), fn {:ok, result}, report -> sum_reports(report, result) end)
  end

  defp sum_reports(
    %{"foods" => foods1, "users" => users1}, %{"foods" => foods2, "users" => users2}
  ) do
    foods = map_merge(foods1, foods2)
    users = map_merge(users1, users2)

    %{"foods" => foods, "users" => users}
  end

  defp map_merge(map1, map2) do
    Map.merge(map1, map2, fn _key, value1, value2 -> value1 + value2 end)
  end

  defp sum_values([id, food, price], %{"users" => users, "foods" => foods} = report) do
    users = Map.put(users, id, users[id] + price)
    foods = Map.put(foods, food, foods[food] + 1)

    report
    |> Map.put("users",users)
    |> Map.put("foods",foods)

  end

  defp map_acc do
    users = Enum.into(1..30, %{}, fn x -> {Integer.to_string(x), 0} end)
    foods = Enum.into(@available_foods, %{}, &{&1, 0})

    %{"users" => users, "foods" => foods}
  end

  def fetch_higher_cost(report,option) when option in @options do
  {:ok, Enum.max_by(report[option], fn {_key, value} -> value end)}
  end

  def fetch_higher_cost(_report,_option) do
   {:error, "Invalid option"}
  end
end
