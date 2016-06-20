defmodule Year do
  @doc """
  Returns whether 'year' is a leap year.

  A leap year occurs:

  on every year that is evenly divisible by 4
    except every year that is evenly divisible by 100
      unless the year is also evenly divisible by 400
  """
  @spec leap_year?(non_neg_integer) :: boolean
  def leap_year?(year), do: leap_year?(rem(year, 4), rem(year, 100), rem(year, 400))
  defp leap_year?(0,0,0), do: true
  defp leap_year?(0,0,_), do: false
  defp leap_year?(0,_,_), do: true
  defp leap_year?(_,_,_), do: false
end