defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t, [String.t]) :: [String.t]
  def match(base, candidates) do
    Enum.filter(candidates, &(is_anagram?(base,&1)))
  end

  defp is_anagram?(base, candidate) do
    {base, candidate} = {String.downcase(base), String.downcase(candidate)}
    sort = fn x -> x |> String.graphemes |> Enum.sort end
    cond do
      base == candidate               -> :false
      sort.(base) == sort.(candidate) -> :true
      true                            -> :false
    end
  end
end
