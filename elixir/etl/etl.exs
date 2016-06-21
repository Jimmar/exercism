defmodule ETL do
  @doc """
  Transform an index into an inverted index.

  ## Examples

  iex> ETL.transform(%{"a" => ["ABILITY", "AARDVARK"], "b" => ["BALLAST", "BEAUTY"]})
  %{"ability" => "a", "aardvark" => "a", "ballast" => "b", "beauty" =>"b"}
  """
  @spec transform(map) :: map
  def transform(input) do
     Enum.reduce(input, %{}, fn({key, value}, acc)->
       Map.merge(acc, reverse_map(value, key))
     end)
  end

  defp reverse_map(value, key) do
    Enum.map(value, fn x -> {String.downcase(x), key} end)
    |> Map.new
  end

end
