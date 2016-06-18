defmodule DNA do
  @nucleotides [?A, ?C, ?G, ?T]

  @doc """
  Counts individual nucleotides in a DNA strand.

  ## Examples

  iex> DNA.count('AATAA', ?A)
  4

  iex> DNA.count('AATAA', ?T)
  1
  """
  @spec count([char], char) :: non_neg_integer
  def count(strand, nucleotide) do
    case Enum.member?(@nucleotides,nucleotide) do
      :true  -> histogram(strand) |> Map.get(nucleotide)
      :false -> raise ArgumentError, message: "Invalid Nucleotide"
    end
  end

  @doc """
  Returns a summary of counts by nucleotide.

  ## Examples

  iex> DNA.histogram('AATAA')
  %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
  """
  @spec histogram([char]) :: map
  def histogram(strand) do
    map = Enum.reduce(@nucleotides, %{}, &(Map.put(&2, &1, 0))) #builds initial map
    try do
      Enum.reduce(strand, map, fn x, acc -> Map.update!(acc, x, &(&1+1)) end)
    rescue
      _ -> raise ArgumentError, message: "Invalid Strand"
    end
  end
end
