defmodule ListLength do
  def call(list) do
  length(list,0)
  end

  defp length([], acc) do
    acc
  end

  defp length(list, acc) do
  length(list)
  end
end
