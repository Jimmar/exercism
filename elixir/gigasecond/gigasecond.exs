defmodule Gigasecond do
  @doc """
  Calculate a date one billion seconds after an input date.
  """
  @seconds_to_add 1_000_000_000 #one billion

  @spec from({{pos_integer, pos_integer, pos_integer}, {pos_integer, pos_integer, pos_integer}}) :: :calendar.datetime
  def from({{year, month, day}, {hours, minutes, seconds}}) do
    {{year, month, day}, {hours, minutes, seconds}}
    |> :calendar.datetime_to_gregorian_seconds
    |> Kernel.+(@seconds_to_add)
    |> :calendar.gregorian_seconds_to_datetime
  end
end
