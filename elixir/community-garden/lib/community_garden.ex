# Use the Plot struct as it is provided
defmodule Plot do
  @enforce_keys [:plot_id, :registered_to]
  defstruct [:plot_id, :registered_to]
end

defmodule CommunityGarden do
  def start(opts \\ []), do: Agent.start(fn -> %{plots: [], id_counter: 1} end, opts)

  def list_registrations(pid), do: Agent.get(pid, & &1.plots)

  def register(pid, register_to) do
    Agent.get_and_update(pid, fn %{plots: plots, id_counter: id_counter} = state ->
      new_plot = %Plot{plot_id: id_counter, registered_to: register_to}
      new_state = %{state | plots: [new_plot | plots], id_counter: id_counter + 1}
      {new_plot, new_state}
    end)
  end

  def release(pid, plot_id) do
    Agent.update(pid, fn %{plots: plots} = state ->
      %{state | plots: Enum.filter(plots, &(&1.plot_id != plot_id))}
    end)
  end

  def get_registration(pid, plot_id) do
    list_registrations(pid)
    |> Enum.find({:not_found, "plot is unregistered"}, &(&1.plot_id == plot_id))
  end
end
