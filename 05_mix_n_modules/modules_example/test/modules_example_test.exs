defmodule ModulesExampleTest do
  use ExUnit.Case
  doctest ModulesExample

  test "greets the world" do
    assert ModulesExample.hello() == :world
  end
end
