defmodule Change do
  @doc """
    Determine the least number of coins to be given to the user such
    that the sum of the coins' value would equal the correct amount of change.
    It returns :error if it is not possible to compute the right amount of coins.
    Otherwise returns the tuple {:ok, map_of_coins}

    ## Examples

      iex> Change.generate(3, [5, 10, 15])
      :error

      iex> Change.generate(18, [1, 5, 10])
      {:ok, %{1 => 3, 5 => 1, 10 => 1}}

  """

  @spec generate(list, integer) :: {:ok, map} | :error
  def generate(values, amount) do
    # gen(amount, Enum.sort(values, &>/2), %{})
    values
  end

  defp gen(_, [], _map),  do: {:error, "cannot change"}
  defp gen(0, _, map),   do: {:ok, map}
  defp gen(amount, [hd|tail], map) do
    map = put_in(map[hd], div(amount, hd))
    gen(rem(amount, hd), tail, map)
  end

end

coins = [1, 5, 10, 25, 100]
IO.inspect(Change.generate(coins, 25))