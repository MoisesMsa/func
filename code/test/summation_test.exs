defmodule SummationTest do
  use ExUnit.Case
  doctest Summation

  test "greets the world" do
    assert Summation.hello() == :world
  end
end
