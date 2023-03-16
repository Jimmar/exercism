defmodule TakeANumber do
  def start() do
    spawn(fn -> receive_messages() end)
  end

  defp receive_messages(state \\ 0) do
    receive do
      {:report_state, sender_pid} -> send(sender_pid, state) |> receive_messages
      {:take_a_number, sender_pid} -> send(sender_pid, state + 1) |> receive_messages
      :stop -> :ok
      _ -> receive_messages(state)
    end
  end
end
