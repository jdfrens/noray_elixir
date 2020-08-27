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
end
