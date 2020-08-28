defmodule Noray.VectorTest do
  use ExUnit.Case, async: true

  alias Noray.Vector

  describe "accessors" do
    test "returns field values" do
      vector = Vector.new(1.1, 2.2, 3.3)
      assert Vector.x(vector) == 1.1
      assert Vector.y(vector) == 2.2
      assert Vector.z(vector) == 3.3
    end
  end

  describe "magnitude/1" do
    test "magnitude of unit x-axis" do
      vector = Vector.new(1.0, 0.0, 0.0)
      assert Vector.magnitude(vector) == 1.0
    end

    test "magnitude of unit y-axis" do
      vector = Vector.new(0.0, 1.0, 0.0)
      assert Vector.magnitude(vector) == 1.0
    end

    test "magnitude of unit z-axis" do
      vector = Vector.new(0.0, 0.0, 1.0)
      assert Vector.magnitude(vector) == 1.0
    end

    test "magnitude of interesting vector" do
      vector = Vector.new(1, -2, 3)
      assert Vector.magnitude(vector) == :math.sqrt(14)
    end
  end

  describe "normalize/1" do
    test "simple vector" do
      vector = Vector.new(0.0, 4.0, 0.0)
      assert Vector.normalize(vector) == Vector.new(0.0, 1.0, 0.0)
    end

    test "normalize interesting vector" do
      vector = Vector.new(1.0, -2.0, 3.0)

      assert Vector.normalize(vector) ==
               Vector.new(0.2672612419124244, -0.5345224838248488, 0.8017837257372732)
    end
  end

  describe "dot/2" do
    test "computes the dot product of two vectors" do
      vector1 = Vector.new(1.0, 2.0, 3.0)
      vector2 = Vector.new(2.0, 3.0, 4.0)
      assert Vector.dot(vector1, vector2) == 20.0
    end
  end

  describe "cross/2" do
    test "computes the cross product of two vectors" do
      vector1 = Vector.new(1.0, 2.0, 3.0)
      vector2 = Vector.new(2.0, 3.0, 4.0)
      assert Vector.cross(vector1, vector2) == Vector.new(-1.0, 2.0, -1.0)
      assert Vector.cross(vector2, vector1) == Vector.new(1.0, -2.0, 1.0)
    end
  end
end
