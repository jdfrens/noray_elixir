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
end
