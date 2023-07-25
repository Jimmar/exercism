defmodule Strain do
  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns true.

  Do not use `Enum.filter`.
  """
  @spec keep(list :: list(any), fun :: (any -> boolean)) :: list(any)
  def keep(list, fun), do: keep(list, fun, [])
  defp keep([], _fun, clean), do: clean |> Enum.reverse()

  defp keep([h | t], fun, clean) do
    case fun.(h) do
      true -> keep(t, fun, [h | clean])
      false -> keep(t, fun, clean)
    end
  end

  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns false.

  Do not use `Enum.reject`.
  """
  @spec discard(list :: list(any), fun :: (any -> boolean)) :: list(any)
  def discard(list, fun), do: keep(list, &(not fun.(&1)), [])
end
