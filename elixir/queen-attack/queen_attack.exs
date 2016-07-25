defmodule Queens do
  @type t :: %Queens{ black: {integer, integer}, white: {integer, integer} }
  defstruct white: {0,3}, black: {7,3}

  @doc """
  Creates a new set of Queens
  """
  @spec new() :: Queens.t()
  @spec new({integer, integer}, {integer, integer}) :: Queens.t()
  def new, do: %Queens{}
  def new(white, white), do: raise ArgumentError
  def new(white, black), do: %Queens{white: white, black: black}

  @doc """
  Gives a string reprentation of the board with
  white and black queen locations shown
  """
  @spec to_string(Queens.t()) :: String.t()
  def to_string(queens) do
    Enum.reduce(1..8*8, "", fn (x, acc) ->
      acc <> char_at(queens, x) <> space_or_break(x)
     end)
     |> String.strip
  end

  defp space_or_break(x) when rem(x, 8) == 0, do: "\n"
  defp space_or_break(_),                     do: " "

  defp char_at(queens, n) do
    cond do
      position_of(queens.black) == n -> "B"
      position_of(queens.white) == n -> "W"
      true                           -> "_"
    end
  end

  defp position_of({x, y}), do: x * 8 + y + 1

  @doc """
  Checks if the queens can attack each other
  """
  @spec can_attack?(Queens.t()) :: boolean
  def can_attack?(queens) do
    can_attack?(queens.white, queens.black)
  end
  def can_attack?({x, _}, {x, _}),                                       do: true
  def can_attack?({_, y}, {_, y}),                                       do: true
  def can_attack?({xw, yw}, {xb, yb}) when abs(xw - xb) == abs(yw - yb), do: true
  def can_attack?(_, _),                                                 do: false
end
