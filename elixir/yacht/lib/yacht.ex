defmodule Yacht do
  @type category ::
          :ones
          | :twos
          | :threes
          | :fours
          | :fives
          | :sixes
          | :full_house
          | :four_of_a_kind
          | :little_straight
          | :big_straight
          | :choice
          | :yacht

  @doc """
  Calculate the score of 5 dice using the given category's scoring method.
  """
  @spec score(category :: category(), dice :: [integer]) :: integer
  def score(category, dice) do
    do_score(category, Enum.sort(dice))
  end

  defp do_score(:ones, dice), do: numbers(dice, 1)
  defp do_score(:twos, dice), do: numbers(dice, 2)
  defp do_score(:threes, dice), do: numbers(dice, 3)
  defp do_score(:fours, dice), do: numbers(dice, 4)
  defp do_score(:fives, dice), do: numbers(dice, 5)
  defp do_score(:sixes, dice), do: numbers(dice, 6)

  defp do_score(:full_house, [x, x, x, y, y]) when x != y, do: x * 3 + y * 2
  defp do_score(:full_house, [x, x, y, y, y]) when x != y, do: x * 2 + y * 3

  defp do_score(:four_of_a_kind, [x, x, x, x, _]), do: x * 4
  defp do_score(:four_of_a_kind, [_, x, x, x, x]), do: x * 4

  defp do_score(:little_straight, [1, 2, 3, 4, 5]), do: 30

  defp do_score(:big_straight, [2, 3, 4, 5, 6]), do: 30

  defp do_score(:choice, dice), do: Enum.sum(dice)
  defp do_score(:yacht, [x, x, x, x, x]), do: 50

  defp do_score(_, _), do: 0

  defp numbers(dice, num), do: num * Enum.count(dice, &(&1 == num))
end
