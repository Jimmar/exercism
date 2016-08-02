defmodule PascalsTriangle do
  @doc """
  Calculates the rows of a pascal triangle
  with the given height
  """
  @base [1]

  @spec rows(integer) :: [[integer]]
  def rows(num) do
    Stream.iterate(@base, &(gen_row(&1))) |> Enum.take(num)
  end

  defp gen_row(prev_row) do
    {out,_} = Enum.reduce(prev_row,{[], 0}, fn (x, acc)->
      {out, y} = acc
      {[y+x|out], x}
    end)
    [1|out]
  end

end
