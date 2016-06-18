defmodule DNA do
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> DNA.to_rna('ACTG')
  'UGAC'
  """
  @spec to_rna([char]) :: [char]
  def to_rna(dna) do
    map = %{?A =>'U', ?C=>'G', ?T=>'A', ?G=>'C'}
    Enum.reduce(dna,'', &(&2++Map.get(map,&1)))
  end
end