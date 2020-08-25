defmodule Noray.MixProject do
  use Mix.Project

  def project do
    [
      app: :noray,
      deps: deps(),
      elixir: "~> 1.10",
      start_permanent: Mix.env() == :prod,
      version: "0.1.0"
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
    ]
  end
end
