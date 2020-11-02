defmodule Noray.Color do
  @moduledoc """
  Represents colors as tagged tuples.
  """

  @typedoc """
  Red-green-blue values between 0.0 and 1.0.
  """
  @type rgb :: {:rgb, float(), float(), float()}

  @doc """
  Produces an RGB color with each of the three color components.
  """
  @spec rgb(float(), float(), float()) :: rgb()
  def rgb(r, g, b), do: {:rgb, r, g, b}

  @doc """
  Adds two RGB colors.

      iex> c1 = rgb(0.9, 0.6, 0.75)
      iex> c2 = rgb(0.7, 0.1, 0.25)
      iex> add(c1, c2)
      {:rgb, 1.6, 0.7, 1.0}

  """
  @spec add(rgb(), rgb()) :: rgb()
  def add({:rgb, r1, g1, b1}, {:rgb, r2, g2, b2}) do
    rgb(r1 + r2, g1 + g2, b1 + b2)
  end

  @doc """
  Subtracts one RGB color from another.

      iex> c1 = rgb(0.8, 0.6, 0.75)
      iex> c2 = rgb(0.4, 0.1, 0.25)
      iex> subtract(c1, c2)
      {:rgb, 0.4, 0.5, 0.5}

  """
  @spec subtract(rgb(), rgb()) :: rgb()
  def subtract({:rgb, r1, g1, b1}, {:rgb, r2, g2, b2}) do
    rgb(r1 - r2, g1 - g2, b1 - b2)
  end

  @doc """
  Scales an RGB color with a scalar.

      iex> c1 = rgb(0.2, 0.3, 0.4)
      iex> scale(c1, 2)
      {:rgb, 0.4, 0.6, 0.8}

  """
  @spec scale(rgb(), number()) :: rgb()
  def scale({:rgb, r, g, b}, scalar) do
    rgb(r * scalar, g * scalar, b * scalar)
  end

  @doc """
  Multiple two RGB colors.  Technically known as the Hadamard or Schur product.

      iex> c1 = rgb(1.0, 0.2, 0.4)
      iex> c2 = rgb(0.9, 1.0, 0.1)
      iex> multiply(c1, c2)
      {:rgb, 0.9, 0.2, 0.04000000000000001}

  """
  @spec multiply(rgb(), rgb()) :: rgb()
  def multiply({:rgb, r1, g1, b1}, {:rgb, r2, g2, b2}) do
    rgb(r1 * r2, g1 * g2, b1 * b2)
  end
end
