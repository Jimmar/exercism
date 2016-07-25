defmodule Luhn do
  @doc """
  Calculates the total checksum of a number
  """
  @spec checksum(String.t()) :: integer
  def checksum(number) do
    number
    |> String.reverse
    |> String.graphemes
    |> check("")
    |> String.graphemes
    |> Enum.reduce(0, &(String.to_integer(&1) + &2))
  end

  defp check([b,a|t], acc) do
    a = String.to_integer(a) * 2
    a = case a >= 10 do
      true  -> a - 9
      false -> a
    end
    check(t, Enum.join([a, b, acc]))
  end

  defp check(a, acc), do: Enum.join([a, acc])

  @doc """
  Checks if the given number is valid via the luhn formula
  """
  @spec valid?(String.t()) :: boolean
  def valid?(number) do
    rem(checksum(number), 10) == 0
  end

  @doc """
  Creates a valid number by adding the correct
  checksum digit to the end of the number
  """
  @spec create(String.t()) :: String.t()
  def create(number) do
    checksum(number<>"0")
    |> rem(10)
    |> Kernel.+(-10)
    |> abs
    |> rem(10)
    |> (&(Enum.join([number,&1]))).()
  end
end
