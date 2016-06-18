defmodule ListOps do
  # Please don't use any external modules (especially List) in your
  # implementation. The point of this exercise is to create these basic functions
  # yourself.
  #
  # Note that `++` is a function from an external module (Kernel, which is
  # automatically imported) and so shouldn't be used either.

  @spec count(list) :: non_neg_integer
  def count(l) do
    _count(l,0)
  end

  defp _count([], count), do: count
  defp _count([_|t], count), do: _count(t,count+1)

  @spec reverse(list) :: list
  def reverse(l) do
    _reverse(l, [])
  end

  defp _reverse([], acc), do: acc
  defp _reverse([h|t], acc), do: _reverse(t, [h|acc])

  @spec map(list, (any -> any)) :: list
  def map(l, f) do
    _map(l,f)
  end

  defp _map([], _), do: []
  defp _map([h|t], f), do: [f.(h)|_map(t,f)]

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter(l, f) do
    _filter(l,f,[])
    |> reverse
  end

  defp _filter([], _, acc), do: acc
  defp _filter([h|t], f, acc) do
    case f.(h) do
      true  ->  _filter(t, f, [h|acc])
      false ->  _filter(t, f, acc)
    end
  end

  @type acc :: any
  @spec reduce(list, acc, ((any, acc) -> acc)) :: acc
  def reduce(l, acc, f) do
    _reduce(l, acc, f)
  end

  defp _reduce([], acc, _), do: acc
  defp _reduce([h|t], acc, f), do: _reduce(t, f.(h,acc), f)

  @spec append(list, list) :: list
  def append(a, b) do
    a |> reverse |> _append(b)
  end

  defp _append([], acc), do: acc
  defp _append([h|t], acc), do: _append(t,[h|acc])

  @spec concat([[any]]) :: [any]
  def concat(ll) do
    for list <- ll, elem <-list, do: elem
  end
end

