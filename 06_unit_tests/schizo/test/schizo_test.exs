defmodule SchizoTest do
  use ExUnit.Case
  doctest Schizo

  test "uppercase doesn't change the first word" do
    assert(Schizo.uppercase("foo") == "foo")
  end

  test "uppercase converts the second word to uppercase" do
    assert(Schizo.uppercase("respect walk") == "respect WALK")
  end

  test "uppercase converts every other word" do
    assert(Schizo.uppercase("are you talking to me no way punk") == "are YOU talking TO me NO way PUNK")
  end

  test "unvowel doesn't change the first word" do
    assert(Schizo.unvowel("foo") == "foo")
  end

  test "unvowel removes the vowels from second word" do
    assert(Schizo.unvowel("respect walk") == "respect wlk")
  end

  test "unvowel converts every other word" do
    assert(Schizo.unvowel("are you talking to me no way punk") == "are y talking t me n way pnk")
  end

end
