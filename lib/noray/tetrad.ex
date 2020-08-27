defmodule Noray.Tetrad do
  @moduledoc """
  Basic data structure for points and vectors.
  """

  @opaque t :: {:tetrad, float(), float(), float(), float()}

  require Record
  Record.defrecord(:tetrad, x: 0.0, y: 0.0, z: 0.0, w: 0.0)

  @spec new :: t()
  def new, do: tetrad()

  @spec new(float(), float(), float(), float()) :: t()
  def new(x, y, z, w), do: tetrad(x: x, y: y, z: z, w: w)

  @spec x(t()) :: float()
  def x(tetrad), do: tetrad(tetrad, :x)

  @spec y(t()) :: float()
  def y(tetrad), do: tetrad(tetrad, :y)

  @spec z(t()) :: float()
  def z(tetrad), do: tetrad(tetrad, :z)

  @spec w(t()) :: float()
  def w(tetrad), do: tetrad(tetrad, :w)

  @spec point?(t()) :: boolean()
  def point?(tetrad), do: tetrad(tetrad, :w) == 1.0

  @spec vector?(t()) :: boolean()
  def vector?(tetrad), do: tetrad(tetrad, :w) == 0.0

  @spec add(t(), t()) :: t()
  def add(tetrad1, tetrad2) do
    tetrad(
      x: tetrad(tetrad1, :x) + tetrad(tetrad2, :x),
      y: tetrad(tetrad1, :y) + tetrad(tetrad2, :y),
      z: tetrad(tetrad1, :z) + tetrad(tetrad2, :z),
      w: tetrad(tetrad1, :w) + tetrad(tetrad2, :w)
    )
  end

  @spec subtract(t(), t()) :: t()
  def subtract(tetrad1, tetrad2) do
    tetrad(
      x: tetrad(tetrad1, :x) - tetrad(tetrad2, :x),
      y: tetrad(tetrad1, :y) - tetrad(tetrad2, :y),
      z: tetrad(tetrad1, :z) - tetrad(tetrad2, :z),
      w: tetrad(tetrad1, :w) - tetrad(tetrad2, :w)
    )
  end

  @spec negate(t()) :: t()
  def negate(tetrad) do
    tetrad(
      x: -tetrad(tetrad, :x),
      y: -tetrad(tetrad, :y),
      z: -tetrad(tetrad, :z),
      w: -tetrad(tetrad, :w)
    )
  end

  @spec scale(t(), float()) :: t()
  def scale(tetrad, factor) do
    tetrad(
      x: tetrad(tetrad, :x) * factor,
      y: tetrad(tetrad, :y) * factor,
      z: tetrad(tetrad, :z) * factor,
      w: tetrad(tetrad, :w) * factor
    )
  end

  @spec scale_inverse(t(), float()) :: t()
  def scale_inverse(tetrad, factor_inverse) do
    tetrad(
      x: tetrad(tetrad, :x) / factor_inverse,
      y: tetrad(tetrad, :y) / factor_inverse,
      z: tetrad(tetrad, :z) / factor_inverse,
      w: tetrad(tetrad, :w) / factor_inverse
    )
  end

  @spec magnitude(t()) :: float()
  def magnitude(tetrad) do
    x = tetrad(tetrad, :x)
    y = tetrad(tetrad, :y)
    z = tetrad(tetrad, :z)
    w = tetrad(tetrad, :w)
    :math.sqrt(x * x + y * y + z * z + w * w)
  end

  @spec normalize(t()) :: t()
  def normalize(tetrad) do
    scale_inverse(tetrad, magnitude(tetrad))
  end
end
