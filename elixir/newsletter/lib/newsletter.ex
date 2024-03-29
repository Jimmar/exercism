defmodule Newsletter do
  def read_emails(path), do: path |> File.read!() |> String.split()

  def open_log(path), do: File.open!(path, [:write])

  def log_sent_email(pid, email), do: IO.puts(pid, email)

  def close_log(pid), do: File.close(pid)

  def send_newsletter(emails_path, log_path, send_fun) do
    log_pid = open_log(log_path)

    emails_path
    |> read_emails()
    |> Enum.each(&if send_fun.(&1) == :ok, do: log_sent_email(log_pid, &1))

    close_log(log_pid)
  end
end
