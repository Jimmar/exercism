defmodule Change do
  @doc """
    Determine the least number of coins to be given to the user such
    that the sum of the coins' value would equal the correct amount of change.
    It returns {:error, "cannot change"} if it is not possible to compute the
    right amount of coins. Otherwise returns the tuple {:ok, list_of_coins}

    ## Examples

      iex> Change.generate([5, 10, 15], 3)
      {:error, "cannot change"}

      iex> Change.generate([1, 5, 10], 18)
      {:ok, [1, 1, 1, 5, 10]}

  """

  @spec generate(list, integer) :: {:ok, list} | {:error, String.t()}
  def generate(coins, target) do
    gen(target, Enum.sort(coins, &>/2), %{})
  end

  defp gen(_, [], _map),  do: {:error, "cannot change"}
  defp gen(0, _, map) do
    ans = :maps.filter(fn _, v -> v > 0 end, map)
    |> Enum.reduce([], fn {v,d}, acc -> acc++List.duplicate(v,d) end)
    {:ok, ans}
  end
  defp gen(amount, [hd|tail], map) do
    map = put_in(map[hd], div(amount, hd))
    gen(rem(amount, hd), tail, map)
  end

end

  coins = [1, 5, 10, 25, 100]
  IO.inspect(Change.generate(coins, 25))