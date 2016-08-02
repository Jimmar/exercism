defmodule PascalsTriangle do
  @doc """
  Calculates the rows of a pascal triangle
  with the given height
  """
  @base [1]

  @spec rows(integer) :: [[integer]]
  def rows(1), do: [@base]
  def rows(num) do
    Enum.reduce(1..num-1,[@base],fn (_, acc)->
      acc
      |> List.to_tuple
      |> Tuple.append(gen_row(List.last(acc)))
      |> Tuple.to_list
    end)
  end

  defp gen_row(prev_row) do
    {out,_} = Enum.reduce(prev_row,{[], 0}, fn (x, acc)->
      {out, y} = acc
      {[y+x|out], x}
    end)
    [1|out]
  end

end
