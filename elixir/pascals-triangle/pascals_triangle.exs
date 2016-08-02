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
      latest_row = acc |> Enum.reverse |> List.to_tuple |> elem(0)
      acc = acc |> List.to_tuple
      # latest_row = elem(Enum.reverse(acc),0)
      # IO.puts  x
      # IO.inspect latest_row
      # IO.inspect gen_row(latest_row)
      # IO.inspect acc
      # acc = [acc|[gen_row(latest_row)]]
      acc = Tuple.append(acc,gen_row(latest_row))
      # IO.inspect acc
      # IO.puts "done"
      acc |> Tuple.to_list
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


# IO.inspect PascalsTriangle.rows(1)
