defmodule SumOfMultiples do
  @doc """
  Adds up all numbers from 1 to a given end number that are multiples of the factors provided.
  """
  @spec to(non_neg_integer, [non_neg_integer]) :: non_neg_integer
  def to(limit, factors) do
    multiples = MapSet.new([0])
    range = 1..limit

    mulitplyers(multiples, factors, range,limit)
    |> MapSet.to_list()
    |> Enum.reduce(&(&1+&2))
  end

  def mulitplyers(acc, [], _, _), do: acc
  def mulitplyers(acc, [factor|factors], range, limit) do
    acc = Enum.reduce_while(range, acc, fn (x,acc) -> 
      if x * factor < limit, do: {:cont, MapSet.put(acc, x * factor)}, else: {:halt, acc}
    end)
    mulitplyers(acc, factors, range, limit)
  end
end
