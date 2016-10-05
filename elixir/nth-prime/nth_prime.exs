defmodule Prime do

  @doc """
  Generates the nth prime.
  """
  @spec nth(non_neg_integer) :: non_neg_integer
  def nth(0), do: raise "Only Nonzero positive integers are accepted"
  def nth(count) do
    find_prime(count, 0, 1)
  end

  def find_prime(count, c, num) do
    case {is_prime?(num), count == c+1} do #is this number a prime and are we one step behind ?
      {true, true}  -> num #found the prime
      {true, false} -> find_prime(count, c+1, num+1)
      {false, _ }   -> find_prime(count, c, num+1)
    end
  end

  def is_prime?(2),     do: true
  def is_prime?(num),   do: is_prime?(num, 2..num-1 |> Enum.to_list)

  def is_prime?(_, []),           do: true
  def is_prime?(num, [head|rest]) do
    case rem(num, head) == 0 do
      true  -> false
      false -> is_prime?(num, rest)
    end
  end
end
