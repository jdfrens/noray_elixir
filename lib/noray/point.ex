defmodule Noray.Point do
  @moduledoc """
  Functions for operating on points.

  These functions operate on `t:Noray.Tetrad.t/0`, but without confirming that the tetrad is actually a point.
  """

  alias Noray.Tetrad

  @opaque t :: Tetrad.t()

  @spec new(float(), float(), float()) :: t()
  def new(x, y, z), do: Tetrad.new(x, y, z, 1.0)

  @spec x(t()) :: float()
  defdelegate x(point), to: Tetrad

  @spec y(t()) :: float()
  defdelegate y(point), to: Tetrad

  @spec z(t()) :: float()
  defdelegate z(point), to: Tetrad
end
