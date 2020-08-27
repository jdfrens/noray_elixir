defmodule Noray.Point do
  @moduledoc """
  Functions for operating on points.

  These functions operate on `t:Noray.Tetrad.t/0`, but without confirming that the tetrad is actually a point.
  """

  alias Noray.Tetrad

  @opaque t :: Tetrad.t()

  @doc """
  Creates a new point.
  """
  @spec new(float(), float(), float()) :: t()
  def new(x, y, z), do: Tetrad.new(x, y, z, 1.0)

  @doc """
  Returns the x component of the point.
  """
  @spec x(t()) :: float()
  defdelegate x(point), to: Tetrad

  @doc """
  Returns the y component of the point.
  """
  @spec y(t()) :: float()
  defdelegate y(point), to: Tetrad

  @doc """
  Returns the z component of the point.
  """
  @spec z(t()) :: float()
  defdelegate z(point), to: Tetrad
end
