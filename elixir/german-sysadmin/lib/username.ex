defmodule Username do
  defp substitute(letter) do
    case letter do
      l when l >= ?a and l <= ?z -> letter
      ?ä -> 'ae'
      ?ö -> 'oe'
      ?ü -> 'ue'
      ?ß -> 'ss'
      ?_ -> letter
      _ -> ''
    end
  end

  def sanitize(username) do
    # ä becomes ae
    # ö becomes oe
    # ü becomes ue
    # ß becomes ss
    username |> Enum.map(&substitute/1) |> List.flatten()
  end
end
