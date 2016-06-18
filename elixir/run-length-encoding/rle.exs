defmodule RunLengthEncoder do
  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "HORSE" => "1H1O1R1S1E"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "1H1O1R1S1E" => "HORSE"
  """
  @spec encode(String.t) :: String.t
  def encode(string) do
    string
    |> String.split(~r/(?<=(.))(?!\1)/) #split when character changes
    |> Enum.reduce("", &encode_one(&1,&2))
  end

  defp encode_one(part, out) do
    if String.length(part) == 0 do
      out
    else
      part
      |> String.length
      |> Integer.to_string
      |> (&(out<>&1<>String.first(part))).()
    end
  end

  @spec decode(String.t) :: String.t
  def decode(string) do
    string
    |> String.replace(~r/[A-Z]/,"\\0 ") # to split between pairs
    |> String.split
    |> Enum.reduce("", &decode_one(&1,&2))
  end

  defp decode_one(part, out) do
    [count, letter] =
      part
      |> String.replace(~r/[A-Z]/," \\0") # to split between number and letter
      |> String.split

    {count,_} = Integer.parse(count)
    out <> String.duplicate(letter, count)
  end

end
