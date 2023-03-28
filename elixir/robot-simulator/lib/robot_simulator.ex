defmodule RobotSimulator do
  @doc """
  Create a Robot Simulator given an initial direction and position.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  @valid_directions [:north, :east, :south, :west]
  @valid_commands ["R", "L", "A"]
  @spec create(direction :: atom, position :: {integer, integer}) :: any
  def create(direction \\ :north, position \\ {0, 0})

  def create(direction, {a, b})
      when direction in @valid_directions and is_integer(a) and is_integer(b) do
    [{:direction, direction}, {:position, {a, b}}]
  end

  def create(direction, _) do
    case direction in @valid_directions do
      false -> {:error, "invalid direction"}
      true -> {:error, "invalid position"}
    end
  end

  @doc """
  Simulate the robot's movement given a string of instructions.

  Valid instructions are: "R" (turn right), "L", (turn left), and "A" (advance)
  """
  @spec simulate(robot :: any, instructions :: String.t()) :: any
  def simulate(robot, instructions) do
    inner_simulate(robot, String.graphemes(instructions))
  end

  defp inner_simulate([{:direction, direction}, {:position, position}] = robot, [
         current | instructions
       ])
       when current in @valid_commands do
    direction_index = Enum.find_index(@valid_directions, fn x -> x == direction end)

    case current do
      "R" -> [{:direction, fix_direction(direction_index + 1)}, {:position, position}]
      "L" -> [{:direction, fix_direction(direction_index - 1)}, {:position, position}]
      "A" -> advance_robot(robot)
    end
    |> inner_simulate(instructions)
  end

  defp inner_simulate(robot, []), do: robot
  defp inner_simulate(_, _), do: {:error, "invalid instruction"}

  defp fix_direction(index) do
    cond do
      index > 3 -> Enum.at(@valid_directions, index - 4)
      index < 0 -> Enum.at(@valid_directions, index + 4)
      true -> Enum.at(@valid_directions, index)
    end
  end

  defp advance_robot(robot) do
    direction = robot[:direction]
    {x, y} = robot[:position]

    case direction do
      :north -> [{:direction, direction}, {:position, {x, y + 1}}]
      :east -> [{:direction, direction}, {:position, {x + 1, y}}]
      :south -> [{:direction, direction}, {:position, {x, y - 1}}]
      :west -> [{:direction, direction}, {:position, {x - 1, y}}]
    end
  end

  @doc """
  Return the robot's direction.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  @spec direction(robot :: any) :: atom
  def direction(robot) do
    robot[:direction]
  end

  @doc """
  Return the robot's position.
  """
  @spec position(robot :: any) :: {integer, integer}
  def position(robot) do
    robot[:position]
  end
end
