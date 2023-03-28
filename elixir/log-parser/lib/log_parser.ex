defmodule LogParser do
  def valid_line?(line), do: line =~ ~r/^\[(DEBUG|INFO|WARNING|ERROR)\].+/

  def split_line(line), do: String.split(line, ~r/<(\~|\*|\=|\-)*>/)

  def remove_artifacts(line), do: String.replace(line, ~r/end-of-line[0-9]+/i, "")

  def tag_with_user_name(line) do
    Regex.run(~r/User\s+(\S+)/, line, capture: :all_but_first)
    |> case do
      nil -> line
      user -> "[USER] #{user} #{line}"
    end
  end
end
