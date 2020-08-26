defmodule Noray.Vector do
  @moduledoc """
  Functions for operating on points.

  These functions operate on `t:Noray.Tetrad.t/0`, but without confirming that the tetrad is actually a point.
  """

  alias Noray.Tetrad

  @opaque t :: Tetrad.t()

  @spec new(float(), float(), float()) :: t()
  def new(x, y, z), do: Tetrad.new(x, y, z, 0.0)

  @spec x(t()) :: float()
  defdelegate x(vector), to: Tetrad

  @spec y(t()) :: float()
  defdelegate y(vector), to: Tetrad

  @spec z(t()) :: float()
  defdelegate z(vector), to: Tetrad
end
