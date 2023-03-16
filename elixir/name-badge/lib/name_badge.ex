defmodule NameBadge do
  @owner_dep "OWNER"
  @separator " - "

  def print(id, name, department) do
    id_str = if id, do: "[#{id}]"
    dep_name = if department, do: String.upcase(department), else: @owner_dep

    [id_str, name, dep_name] |> Enum.reject(&is_nil/1) |> Enum.join(@separator)
  end
end
