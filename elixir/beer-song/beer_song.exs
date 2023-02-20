defmodule BeerSong do
  @doc """
  Get a single verse of the beer song
  """
  @spec verse(integer) :: String.t
  def verse(number) do
    {first,second} = get_phrase(number-1)
    {third,_} = get_phrase(number-2)
    """
    #{String.capitalize(first)} of beer on the wall, #{first} of beer.
    #{second}, #{third} of beer on the wall.
    """
  end

  defp get_phrase(-1), do: get_phrase(99)
  defp get_phrase(0), do: {"no more bottles","Go to the store and buy some more"}
  defp get_phrase(1), do: {"1 bottle","Take it down and pass it around"}
  defp get_phrase(n), do: {"#{n} bottles","Take one down and pass it around"}


  @doc """
  Get the entire beer song for a given range of numbers of bottles.
  """
  @spec lyrics(Range.t) :: String.t
  def lyrics(range \\100..1) do
    Enum.map_join(range,"\n", &(verse/1))
  end
end