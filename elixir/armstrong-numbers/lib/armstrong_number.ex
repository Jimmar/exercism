defmodule ArmstrongNumber do
  @moduledoc """
  Provides a way to validate whether or not a number is an Armstrong number
  """

  @spec valid?(integer) :: boolean
  def valid?(number) do
    number
    |> Integer.digits()
    |> (&Enum.reduce(&1, 0, fn x, acc -> acc + x ** length(&1) end)).()
    |> Kernel.==(number)
  end
end
