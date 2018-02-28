defmodule BankAccount do
  @moduledoc """
  Documentation for BankAccount.
  """

  @doc """
  Hello world.

  ## Examples

      iex> BankAccount.hello
      :world

  """
  def hello do
    :world
  end

  def start do
    await([])
  end

  def await(events) do
    receive do
      {:check_balance, pid} -> divulge_balance(pid, events)
      {:deposit, amount} -> events = deposit(amount, events)
      {:withdraw, amount} -> events = withdraw(amount, events)
    end
    await(events)
  end

  defp deposit(amount, events) do
    events ++ [{:deposit, amount}]
  end

  defp withdraw(amount, events) do
    events ++ [{:withdraw, amount}]
  end
    
  defp divulge_balance(pid, events) do
    send pid, calculate_balance(events)
  end

  defp calculate_balance(events) do
    deposits = sum(events |> Enum.filter(fn
      {:deposit, _} -> true
      {_, _} -> false
  end))

    withdrawals = sum(events |> Enum.filter(fn
    {:withdraw, _} -> true
    {_, _ } -> false
  end))

    {:balance, deposits - withdrawals}
  end

  defp sum(events) do
    Enum.reduce events, 0, fn({_, amount}, acc) -> amount + acc end
  end
end
