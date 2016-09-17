defmodule Raindrops do
  @doc """
  Returns a string based on raindrop factors.

  - If the number contains 3 as a prime factor, output 'Pling'.
  - If the number contains 5 as a prime factor, output 'Plang'.
  - If the number contains 7 as a prime factor, output 'Plong'.
  - If the number does not contain 3, 5, or 7 as a prime factor,
    just pass the number's digits straight through.
  """
  @plingies %{ 3 => "Pling", 5=> "Plang", 7=>"Plong" }

  @spec convert(pos_integer) :: String.t
  def convert(number) do
    Map.keys(@plingies)
    |> Enum.filter_map(&rem(number, &1) == 0, &@plingies[&1])
    |> Enum.join
    |> output(number)
  end

  defp output("" , number), do: Integer.to_string(number)
  defp output(out, _),      do: out

end
