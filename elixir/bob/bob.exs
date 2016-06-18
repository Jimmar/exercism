defmodule Bob do
  def hey(input) do

    is_question? = fn x -> String.ends_with?(x, ["?"]) end
    is_shouting? = fn x -> String.upcase(x) == x && String.downcase(x) != x end
    is_empty? = fn x -> String.strip(x) == "" end

    cond do
      is_empty?.(input)     -> "Fine. Be that way!"
      is_question?.(input)  -> "Sure."
      is_shouting?.(input)  -> "Whoa, chill out!"
      true                  -> "Whatever."
    end
  end
end
