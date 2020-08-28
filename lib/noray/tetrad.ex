defmodule Noray.Tetrad do
  @moduledoc """
  Basic data structure for points and vectors.

  A tetrad consists of four values: x, y, z, and w.  w should be 1.0 (if it represents a point) or 0.0 (if it represents
  a vector).  See `Noray.Point` and `Noray.Vector` for helpers and specific operations.
  """

  @opaque t :: {:tetrad, float(), float(), float(), float()}

  require Record
  Record.defrecord(:tetrad, x: 0.0, y: 0.0, z: 0.0, w: 0.0)

  @doc """
  Create a zero tetrad.
  """
  @spec new :: t()
  def new, do: tetrad()

  @doc """
  Create a new tetrad with the specified values.

  You should use `Noray.Point.new/3` and `Noray.Vector.new/3` instead of this function.
  """
  @spec new(float(), float(), float(), float()) :: t()
  def new(x, y, z, w), do: tetrad(x: x, y: y, z: z, w: w)

  @doc """
  Returns the x component of a tetrad.
  """
  @spec x(t()) :: float()
  def x(tetrad), do: tetrad(tetrad, :x)

  @doc """
  Returns the y component of a tetrad.
  """
  @spec y(t()) :: float()
  def y(tetrad), do: tetrad(tetrad, :y)

  @doc """
  Returns the z component of a tetrad.
  """
  @spec z(t()) :: float()
  def z(tetrad), do: tetrad(tetrad, :z)

  @doc """
  Returns the w component of a tetrad.  Don't use this.  Use `point?/1` and `vector?/1` instead.
  """
  @spec w(t()) :: float()
  def w(tetrad), do: tetrad(tetrad, :w)

  @doc """
  Returns `true` if the tetrad represents a point, `false` otherwise.
  """
  @spec point?(t()) :: boolean()
  def point?(tetrad), do: tetrad(tetrad, :w) == 1.0

  @doc """
  Returns `true` if the tetrad represents a vector, `false` otherwise.
  """
  @spec vector?(t()) :: boolean()
  def vector?(tetrad), do: tetrad(tetrad, :w) == 0.0

  @doc """
  Adds two tetrads.

  The tetrads can be points or vectors, even if the math doesn't necessarily make sense.
  """
  @spec add(t(), t()) :: t()
  def add(tetrad1, tetrad2) do
    tetrad(
      x: tetrad(tetrad1, :x) + tetrad(tetrad2, :x),
      y: tetrad(tetrad1, :y) + tetrad(tetrad2, :y),
      z: tetrad(tetrad1, :z) + tetrad(tetrad2, :z),
      w: tetrad(tetrad1, :w) + tetrad(tetrad2, :w)
    )
  end

  @doc """
  Subtracts two tetrads.

  The tetrads can be points or vectors, even if the math doesn't necessarily make sense.
  """
  @spec subtract(t(), t()) :: t()
  def subtract(tetrad1, tetrad2) do
    tetrad(
      x: tetrad(tetrad1, :x) - tetrad(tetrad2, :x),
      y: tetrad(tetrad1, :y) - tetrad(tetrad2, :y),
      z: tetrad(tetrad1, :z) - tetrad(tetrad2, :z),
      w: tetrad(tetrad1, :w) - tetrad(tetrad2, :w)
    )
  end

  @doc """
  Negates a tetrad.
  """
  @spec negate(t()) :: t()
  def negate(tetrad) do
    tetrad(
      x: -tetrad(tetrad, :x),
      y: -tetrad(tetrad, :y),
      z: -tetrad(tetrad, :z),
      w: -tetrad(tetrad, :w)
    )
  end

  @doc """
  Scales a tetrad by a factor.
  """
  @spec scale(t(), float()) :: t()
  def scale(tetrad, factor) do
    tetrad(
      x: tetrad(tetrad, :x) * factor,
      y: tetrad(tetrad, :y) * factor,
      z: tetrad(tetrad, :z) * factor,
      w: tetrad(tetrad, :w) * factor
    )
  end

  @doc """
  Scales a tetrad by the inverse of a factor; that is, _divide_ the tetrad by the factor.
  """
  @spec scale_inverse(t(), float()) :: t()
  def scale_inverse(tetrad, factor_inverse) do
    tetrad(
      x: tetrad(tetrad, :x) / factor_inverse,
      y: tetrad(tetrad, :y) / factor_inverse,
      z: tetrad(tetrad, :z) / factor_inverse,
      w: tetrad(tetrad, :w) / factor_inverse
    )
  end
end
