defmodule ListFilter do

  def call(strings) do
    find_odd(strings)
  end

  defp find_odd([]) do
    "Empty list"
  end
  
  defp find_odd(strings) do
    list = Enum.flat_map(strings, fn string ->
    case Integer.parse(string) do
      # transform to integer
      {int, _rest} -> [int]
      # skip the value
      :error -> []
      end
    end)

    Enum.filter(list, fn i -> rem(i,2) == 1 end)  
  end

end
