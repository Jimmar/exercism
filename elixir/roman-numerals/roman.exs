defmodule Roman do
  @doc """
  Convert the number to a roman number.
  """
  @nummap [
  	{1000, "M"},
  	{900, "CM"},
  	{500, "D"},
  	{400, "CD"},
  	{100, "C"},
  	{90, "XC"},
  	{50, "L"},
  	{40, "XL"},
  	{10, "X"},
  	{9, "IX"},
  	{5, "V"},
  	{4, "IV"},
  	{1, "I"}
  ]

  def numerals(0), do: ""

  @spec numerals(pos_integer) :: String.t
  def numerals(number) do
  	{num,letter} = Enum.find(@nummap, fn {n,l} -> number>=n end)
  	letter <> numerals(number - num)
  end
  
end
