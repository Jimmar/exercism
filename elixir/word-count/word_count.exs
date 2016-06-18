defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map
  def count(sentence) do
    words = sentence 
            |> String.downcase
            |> String.replace(~r/[^-\p{L}\s\p{N}]/u," ") #umm .. yeah .. it works
            |> String.replace(~r/\s+/," ")
            |> String.strip
            |> String.split(" ")

    update_map = fn word, map ->
      Map.update(map, word, 1, fn x -> x+1 end)
    end

    Enum.reduce(words, %{}, update_map)
  end
end
