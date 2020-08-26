defmodule Noray.PointTest do
  use ExUnit.Case, async: true

  alias Noray.Point

  describe "accessors" do
    test "returns field values" do
      point = Point.new(1.1, 2.2, 3.3)
      assert Point.x(point) == 1.1
      assert Point.y(point) == 2.2
      assert Point.z(point) == 3.3
    end
  end
end
