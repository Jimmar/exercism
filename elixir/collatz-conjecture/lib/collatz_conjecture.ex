defmodule CollatzConjecture do
  import Integer, only: [is_even: 1]

  @doc """
  calc/1 takes an integer and returns the number of steps required to get the
  number to 1 when following the rules:
    - if number is odd, multiply with 3 and add 1
    - if number is even, divide by 2
  """
  @spec calc(input :: pos_integer()) :: non_neg_integer()
  def calc(input) when is_integer(input) and input > 0, do: do_calc(input)

  defp do_calc(1), do: 0
  defp do_calc(input) when is_even(input), do: 1 + do_calc(div(input, 2))
  defp do_calc(input), do: 1 + do_calc(3 * input + 1)
end
