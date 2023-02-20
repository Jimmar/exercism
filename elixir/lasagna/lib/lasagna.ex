defmodule Lasagna do
  # Please define the 'expected_minutes_in_oven/0' function
  @spec expected_minutes_in_oven :: 40
  def expected_minutes_in_oven() do
    40
  end

  # Please define the 'remaining_minutes_in_oven/1' function
  def remaining_minutes_in_oven(elapsed_time) do
    expected_minutes_in_oven() - elapsed_time
  end

  # Please define the 'preparation_time_in_minutes/1' function
  def preparation_time_in_minutes(number_of_layers) do
    number_of_layers * 2
  end

  # Please define the 'total_time_in_minutes/2' function
  def total_time_in_minutes(number_of_layers, elapsed_time) do
    preparation_time_in_minutes(number_of_layers) + elapsed_time
  end

  # Please define the 'alarm/0' function
  def alarm() do
    "Ding!"
  end
end
