defmodule BracketPush do
  @doc """
  Checks that all the brackets and braces in the string are matched correctly, and nested correctly
  """
  @spec check_brackets(String.t) :: boolean
  def check_brackets(str) do
    str = str
        |> String.replace(~r/[^\p{Pe}\p{Ps}]/,"") #removes anything that's not a bracket/paranthesis
        |> balanced?(String.length(str))
  end

  @spec balanced?(String.t, number) :: boolean
  defp balanced?(str, len) do
    case String.replace(str, ~r/\[\]|\{\}|\(\)/,"") do #removes all couples
      ""   -> :true           #empty string, all couples removes
      ^str -> :false          #nothing removed, unbalanced
      x    -> balanced?(x, 0) 
    end
  end
end