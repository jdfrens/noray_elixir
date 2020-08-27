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

  describe "subscribe/2" do
    test "subtract one point from another" do
      point1 = Point.new(3.0, 2.0, 1.0)
      point2 = Point.new(5.0, 6.0, 7.0)
      assert Tetrad.subtract(point1, point2) == Vector.new(-2.0, -4.0, -6.0)
    end
  end

  describe "negate/2" do
    test "negates a tetrad" do
      tetrad = Tetrad.new(1.0, -2.0, 4.0, 8.0)
      assert Tetrad.negate(tetrad) == Tetrad.new(-1.0, 2.0, -4.0, -8.0)
    end
  end

  describe "scale/2" do
    test "scales a tetrad" do
      tetrad = Tetrad.new(1.0, -2.0, 4.0, 8.0)
      assert Tetrad.scale(tetrad, 2.0) == Tetrad.new(2.0, -4.0, 8.0, 16.0)
    end
  end

  describe "scale_inverse/2" do
    test "scales a tetrad" do
      tetrad = Tetrad.new(1.0, -2.0, 4.0, 8.0)
      assert Tetrad.scale_inverse(tetrad, 2.0) == Tetrad.new(0.5, -1.0, 2.0, 4.0)
    end
  end

  describe "magnitude/1" do
    test "magnitude of unit x-axis" do
      vector = Vector.new(1.0, 0.0, 0.0)
      assert Tetrad.magnitude(vector) == 1.0
    end

    test "magnitude of unit y-axis" do
      vector = Vector.new(0.0, 1.0, 0.0)
      assert Tetrad.magnitude(vector) == 1.0
    end

    test "magnitude of unit z-axis" do
      vector = Vector.new(0.0, 0.0, 1.0)
      assert Tetrad.magnitude(vector) == 1.0
    end

    test "magnitude of interesting vector" do
      vector = Vector.new(1, -2, 3)
      assert Tetrad.magnitude(vector) == :math.sqrt(14)
    end
  end
end
