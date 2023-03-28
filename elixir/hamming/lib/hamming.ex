defmodule Hamming do
  @doc """
  Returns number of differences between two strands of DNA, known as the Hamming Distance.

  ## Examples

  iex> Hamming.hamming_distance('AAGTCATA', 'TAGCGATC')
  {:ok, 4}
  """
  @spec hamming_distance([char], [char]) :: {:ok, non_neg_integer} | {:error, String.t()}
  def hamming_distance(strand1, strand2), do: distance(strand1, strand2, 0)

  defp distance(strand1, strand2, _) when length(strand1) != length(strand2) do
    {:error, "strands must be of equal length"}
  end

  defp distance([], [], acc), do: {:ok, acc}
  defp distance([h | t1], [h | t2], acc), do: distance(t1, t2, acc)
  defp distance([_ | t1], [_ | t2], acc), do: distance(t1, t2, acc + 1)
  defp distance(_, _, _), do: nil
end
