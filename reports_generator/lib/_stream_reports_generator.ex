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
  
  def build(filename) do
    filename
    |> Parser.parser()
    |> Enum.reduce(map_acc(), fn line, report ->
    sum_values(line,report)
    end)
  end

  defp sum_values([id, food, price], %{"users" => users, "foods" => foods} = report) do
    users = Map.put(users, id, users[id] + price)
    foods = Map.put(foods, food, foods[food] + 1)

    report
    |> Map.put("users",users)
    |> Map.put("foods",foods)

  end

  def map_acc do
    users = Enum.into(1..30, %{}, fn x -> {Integer.to_string(x), 0} end)
    foods = Enum.into(@available_foods, %{}, &{&1, 0})

    %{"users" => users, "foods" => foods}
  end

  def fetch_higher_cost(report) do
  Enum.max_by(report, fn {_key, value} -> value end)
  end

end