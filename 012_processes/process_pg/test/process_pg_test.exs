defmodule ProcessPgTest do
  use ExUnit.Case
  doctest ProcessPg

  test "greets the world" do
    assert ProcessPg.hello() == :world
  end
end
