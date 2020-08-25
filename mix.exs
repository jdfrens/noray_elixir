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
        coveralls: :test,
        "coveralls.detail": :test,
        "coveralls.post": :test,
        "coveralls.html": :test
      ],
      start_permanent: Mix.env() == :prod,
      test_coverage: [tool: ExCoveralls],
      version: "0.1.0"
    ]
  end

  defp aliases do
    [
      all_tests: [
        "deps.get",
        "deps.compile",
        "compile --force --return-errors",
        "coveralls --raise"
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
      {:excoveralls, "~> 0.10", only: :test}
    ]
  end
end
