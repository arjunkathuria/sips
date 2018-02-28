defmodule BankAccountTest do
  use ExUnit.Case
  doctest BankAccount
  
  test "greets the world" do
    assert BankAccount.hello() == :world
  end

  test "starts off with a balance of 0" do
    account = spawn_link(BankAccount, :start, [])
    verify_balance_is 0, account
  end

  def verify_balance_is(expected_balance, pid) do
    send pid, {:check_balance, self()}
    assert_receive {:balance, ^expected_balance}
  end

  test "increments the balance by the amount of deposit" do
    account = spawn_link(BankAccount, :start, [])
    send account, {:deposit, 10}
    verify_balance_is 10, account
  end

  test "decrements the balance by the amount of withrawal" do
    account = spawn_link(BankAccount, :start, [])
    send account, {:deposit, 50}
    send account, {:withdraw, 25}
    verify_balance_is 25, account
  end
  
end
