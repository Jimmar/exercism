defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(a, b) do
    cond do
      a === b -> :equal
      is_sublist?(a, b) -> :sublist
      is_sublist?(b, a) -> :superlist
      true -> :unequal
    end
  end

  defp is_sublist?(a, b) when length(b) < length(a), do: :false
  defp is_sublist?(a, b) do
    index = Enum.find_index(b, fn(x) -> Enum.at(a,0) == x end)
    case index do
      nil   -> :false
      index -> sublist_at?(a, b, index)
    end
  end

  defp sublist_at?(a, b, index) do
    {check, rest} = b 
              |> Enum.split(index) 
              |> elem(1) 
              |> Enum.split(length(a))

    cond do
      a === check -> :true
      true -> is_sublist?(a, tl(check++rest))
    end
  end
end
