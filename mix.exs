defmodule Noray.MixProject do
  use Mix.Project

  def project do
    [
      aliases: aliases(),
      app: :noray,
      deps: deps(),
      elixir: "~> 1.10",
      preferred_cli_env: [
        all_tests: :test,
      ],
      start_permanent: Mix.env() == :prod,
      version: "0.1.0"
    ]
  end

  defp aliases do
    [
      all_tests: [
        "deps.get",
        "deps.compile",
        "compile --force --return-errors",
      ]
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
