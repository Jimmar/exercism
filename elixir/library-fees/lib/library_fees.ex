# defmodule LibraryFees do
#   def datetime_from_string(string), do: NaiveDateTime.from_iso8601!(string)

#   def before_noon?(datetime), do: datetime.hour < 12

#   def return_date(checkout_datetime) do
#     checkout_datetime
#     |> NaiveDateTime.to_date()
#     |> Date.add(if before_noon?(checkout_datetime), do: 28, else: 29)
#   end

#   def days_late(planned_return_date, actual_return_datetime) do
#     Date.diff(actual_return_datetime, planned_return_date) |> max(0)
#   end

#   def monday?(datetime), do: datetime |> Date.day_of_week() == 1

#   def calculate_late_fee(checkout, return, rate) do
#     return_datetime = return |> datetime_from_string()
#     checkout_datetime = checkout |> datetime_from_string()
#     fees = checkout_datetime |> return_date |> days_late(return_datetime) |> Kernel.*(rate)
#     if monday?(return_datetime), do: (fees * 0.5) |> floor(), else: fees
#   end
# end


defmodule LibraryFees do
  def datetime_from_string(string) do
    NaiveDateTime.from_iso8601!(string)
  end
  def before_noon?(datetime) do
    datetime.hour < 12
  end

  def return_date(checkout_datetime) do
    # checkout_date = Date.new!(:year, :month, :day)
    checkout_date = checkout_datetime |> NaiveDateTime.to_date()

    if before_noon?(checkout_datetime) do
      Date.add(checkout_date, 28)
    else
      Date.add(checkout_date, 29)
    end
  end

  def days_late(planned_return_date, actual_return_datetime) do
    actual_return_datetime
    |> Date.diff(planned_return_date)
    |> max(0)
  end

  def monday?(datetime) do
    Date.day_of_week(datetime) == 1
  end

  def calculate_late_fee(checkout, return, rate) do
    checkout_datetime = datetime_from_string(checkout)
    return_datetime = datetime_from_string(return)

    late_fee = days_late(return_date(checkout_datetime), return_datetime ) * rate
    # late_fee = checkout_datetime |> return_date |> days_late(return_datetime) |> Kernel.*(rate)

    if monday?(return_datetime) do
      floor(late_fee * 0.5)
    else
      late_fee
    end
  end
end
