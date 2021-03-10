defmodule ReportsGeneratorCase do
  def build(filename) do
    case File.read("reports/#{filename}") do
    {:ok, result} -> result
    {:error, result} -> result
    end
  end
end
