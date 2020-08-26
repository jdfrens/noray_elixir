defmodule Noray.TetradTest do
  use ExUnit.Case, async: true

  alias Noray.{Point, Tetrad, Vector}

  describe "constructors and accessors" do
    test "default" do
      tetrad = Tetrad.new()

      assert Tetrad.x(tetrad) == 0.0
      assert Tetrad.y(tetrad) == 0.0
      assert Tetrad.z(tetrad) == 0.0
      assert Tetrad.w(tetrad) == 0.0
    end

    test "built" do
      tetrad = Tetrad.new(1.1, 2.2, 3.3, 4.4)

      assert Tetrad.x(tetrad) == 1.1
      assert Tetrad.y(tetrad) == 2.2
      assert Tetrad.z(tetrad) == 3.3
      assert Tetrad.w(tetrad) == 4.4
    end
  end

  describe "point?/1" do
    test "returns true for a point" do
      point = Point.new(1.1, 2.2, 3.3)
      assert Tetrad.point?(point)
    end

    test "returns false for a vector" do
      vector = Vector.new(1.1, 2.2, 3.3)
      refute Tetrad.point?(vector)
    end
  end

  describe "vector?" do
    test "returns false for a point" do
      point = Point.new(1.1, 2.2, 3.3)
      refute Tetrad.vector?(point)
    end

    test "returns true for a vector" do
      point = Vector.new(1.1, 2.2, 3.3)
      assert Tetrad.vector?(point)
    end
  end

  describe "add/2" do
    test "adds two tetrads together" do
      tetrad1 = Tetrad.new(1.0, 2.0, 4.0, 8.0)
      tetrad2 = Tetrad.new(16.0, 32.0, 64.0, 128.0)
      assert Tetrad.add(tetrad1, tetrad2) == Tetrad.new(17.0, 34.0, 68.0, 136.0)
    end
  end
end
