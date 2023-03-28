import Bitwise
defmodule SecretHandshake do
  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """
  @spec commands(code :: integer) :: list(String.t())
  def commands(code), do: translate(code, [])
  defp translate(0, acc), do: acc
  defp translate(code, acc) do
    cond do
      (code &&& 1) > 0 -> translate(code - 1, acc ++ ["wink"])
      (code &&& 2) > 0 -> translate(code - 2, acc ++ ["double blink"])
      (code &&& 4) > 0 -> translate(code - 4, acc ++ ["close your eyes"])
      (code &&& 8) > 0 -> translate(code - 8, acc ++ ["jump"])
      (code &&& 16) > 0 -> acc |> Enum.reverse
      true -> acc
    end
  end
end
