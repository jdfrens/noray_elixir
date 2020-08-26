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
end
