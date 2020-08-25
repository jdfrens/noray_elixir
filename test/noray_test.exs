defmodule NorayTest do
  use ExUnit.Case
  doctest Noray

  test "greets the world" do
    assert Noray.hello() == :world
  end
end
