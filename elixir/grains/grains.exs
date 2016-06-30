defmodule Grains do
  use Bitwise
  @doc """
  Calculate two to the power of the input minus one.
  """
  @spec square(pos_integer) :: pos_integer
  #Bitwise ftw, note the "use Bitwise" above
  def square(number), do: 1 <<< (number - 1)

  @doc """
  Adds square of each number from 1 to 64.
  """
  @spec total :: pos_integer
  #Magic ! [not really, geometric progression sum]
  def total, do: square(65) - 1
end
