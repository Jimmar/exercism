defmodule Meetup do
  @moduledoc """
  Calculate meetup dates.
  """

  @type weekday ::
      :monday | :tuesday | :wednesday
    | :thursday | :friday | :saturday | :sunday

  @type schedule :: :first | :second | :third | :fourth | :last | :teenth

  @days_of_week %{monday: 1, tuesday: 2, wednesday: 3,
                  thursday: 4, friday: 5, saturday: 6, sunday: 7}

  @doc """
  Calculate a meetup date.

  The schedule is in which week (1..4, last or "teenth") the meetup date should
  fall.
  """
  @spec meetup(pos_integer, pos_integer, weekday, schedule) :: :calendar.date
  def meetup(year, month, weekday, schedule) do
    case schedule do
      :teenth -> meetup_with_range(year, month, weekday, 13..19)
      :first  -> meetup_with_range(year, month, weekday, 1..7)
      :second -> meetup_with_range(year, month, weekday, 8..14)
      :third  -> meetup_with_range(year, month, weekday, 15..21)
      :fourth -> meetup_with_range(year, month, weekday, 22..31)
      :last   -> meetup_with_range(year, month, weekday, :calendar.last_day_of_the_month(year,month)..1)
    end
  end

  defp meetup_with_range(year, month, weekday, range) do
    day = Enum.find(range, fn x ->
      :calendar.day_of_the_week(year, month, x) == Map.fetch!(@days_of_week, weekday)
    end)
    {year, month, day}
  end
end
