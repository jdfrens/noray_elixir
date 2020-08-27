defmodule Noray.Vector do
  @moduledoc """
  Functions for operating on points.

  These functions operate on `t:Noray.Tetrad.t/0`, but without confirming that the tetrad is actually a point.
  """

  import Noray.Tetrad

  @opaque t :: Noray.Tetrad.t()

  @doc """
  Returns a new vector.
  """
  @spec new(float(), float(), float()) :: t()
  def new(x, y, z), do: tetrad(x: x, y: y, z: z, w: 0.0)

  @doc """
  Returns the x component of the vector.
  """
  @spec x(t()) :: float()
  defdelegate x(vector), to: Noray.Tetrad

  @doc """
  Returns the y component of the vector.
  """
  @spec y(t()) :: float()
  defdelegate y(vector), to: Noray.Tetrad

  @doc """
  Returns the z component of the vector.
  """
  @spec z(t()) :: float()
  defdelegate z(vector), to: Noray.Tetrad

  @doc """
  Returns the magnitude (i.e., length) of a vector.
  """
  @spec magnitude(t()) :: float()
  def magnitude(tetrad) do
    x = tetrad(tetrad, :x)
    y = tetrad(tetrad, :y)
    z = tetrad(tetrad, :z)
    w = tetrad(tetrad, :w)
    :math.sqrt(x * x + y * y + z * z + w * w)
  end

  @doc """
  Returns a normalized version of the vector.
  """
  @spec normalize(t()) :: t()
  def normalize(vector) do
    scale_inverse(vector, magnitude(vector))
  end

  @doc """
  Returns the dot product of two vectors.
  """
  @spec dot(t(), t()) :: float()
  def dot(vector1, vector2) do
    tetrad(vector1, :x) * tetrad(vector2, :x) +
      tetrad(vector1, :y) * tetrad(vector2, :y) +
      tetrad(vector1, :z) * tetrad(vector2, :z) +
      tetrad(vector1, :w) * tetrad(vector2, :w)
  end

  @doc """
  Returns the cross product of two vectors, using a left-handed coordinate system.
  """
  @spec cross(t(), t()) :: t()
  def cross(vector1, vector2) do
    tetrad(
      x: tetrad(vector1, :y) * tetrad(vector2, :z) - tetrad(vector1, :z) * tetrad(vector2, :y),
      y: tetrad(vector1, :z) * tetrad(vector2, :x) - tetrad(vector1, :x) * tetrad(vector2, :z),
      z: tetrad(vector1, :x) * tetrad(vector2, :y) - tetrad(vector1, :y) * tetrad(vector2, :x),
      w: 0.0
    )
  end
end
