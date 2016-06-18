defmodule Acronym do
  @doc """
  Generate an acronym from a string. 
  "This is a string" => "TIAS"
  """
  @spec abbreviate(string) :: String.t()
  def abbreviate(string) do
    # splits on spaces and dashes
    # for each `word` capitalize first letter
    #                 remove all lower cases
    # join everything together

    string
    |> String.split(~r/[-\s]/) #split on spaces or dashes
    |> Enum.reduce("", &acronymify(&1,&2)).()
  end

  defp acronymify(word, string) do
    String.Casing.titlecase_once(word) #Capitalize first letter
    |> Tuple.to_list
    |> Enum.join
    |> String.replace(~r/\p{^Lu}/, "") #removes lower cases
    |> (&(string <> &1)).() # joins them together ..
  end
end
