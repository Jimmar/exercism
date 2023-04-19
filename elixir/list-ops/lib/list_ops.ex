defmodule ListOps do
  # Please don't use any external modules (especially List or Enum) in your
  # implementation. The point of this exercise is to create these basic
  # functions yourself. You may use basic Kernel functions (like `Kernel.+/2`
  # for adding numbers), but please do not use Kernel functions for Lists like
  # `++`, `--`, `hd`, `tl`, `in`, and `length`.

  @spec count(list) :: non_neg_integer
  def count(l), do: _count(l, 0)
  defp _count([], count), do: count
  defp _count([_ | t], count), do: _count(t, count + 1)

  @spec reverse(list) :: list
  def reverse(l), do: _reverse(l, [])
  defp _reverse([], acc), do: acc
  defp _reverse([h | t], acc), do: _reverse(t, [h | acc])

  @spec map(list, (any -> any)) :: list
  def map(l, f), do: _map(l, f)
  defp _map([], _), do: []
  defp _map([h | t], f), do: [f.(h) | _map(t, f)]

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter(l, f), do: _filter(l, f, []) |> reverse
  defp _filter([], _, acc), do: acc

  defp _filter([h | t], f, acc) do
    case f.(h) do
      false -> _filter(t, f, acc)
      nil -> _filter(t, f, acc)
      _ -> _filter(t, f, [h | acc])
    end
  end

  @type acc :: any
  @spec foldl(list, acc, (any, acc -> acc)) :: acc
  def foldl(l, acc, f), do: _foldl(l, acc, f)
  defp _foldl([], acc, _), do: acc
  defp _foldl([h | t], acc, f), do: foldl(t, f.(h, acc), f)

  @spec foldr(list, acc, (any, acc -> acc)) :: acc
  def foldr(l, acc, f), do: reverse(l) |> foldl(acc, f)

  @spec append(list, list) :: list
  def append(a, b), do: a |> reverse |> _append(b)
  defp _append([], acc), do: acc
  defp _append([h | t], acc), do: _append(t, [h | acc])

  @spec concat([[any]]) :: [any]
  def concat(ll), do: _concat(ll)
  defp _concat([]), do: []
  defp _concat([h | t]), do: append(h, concat(t))
end
