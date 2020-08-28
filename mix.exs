defmodule Noray.MixProject do
  use Mix.Project

  def project do
    [
      aliases: aliases(),
      app: :noray,
      deps: deps(),
      dialyzer: dialyzer(),
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
        "compile --force --return-errors",
        "format --check-formatted",
        "docs --output test/doc",
        "credo --strict",
        "coveralls --raise",
        "dialyzer --list-unused-filters"
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
      {:credo, "~> 1.1", only: [:dev, :test], runtime: false},
      {:dialyxir, "~> 1.0", only: [:dev, :test], runtime: false},
      {:excoveralls, "~> 0.10", only: :test},
      {:ex_doc, "~> 0.22", only: [:dev, :test], runtime: false}
    ]
  end

  # NOTE: skipping :no_*, :underspecs, :overspecs, :specdiffs
  @dialyzer_warn_opts ~w(
    error_handling
    race_conditions
    unknown
    unmatched_returns
    )a
  defp dialyzer do
    [
      flags: [
        "-Wunmatched_returns" | @dialyzer_warn_opts
      ],
      ignore_warnings: ".dialyzer_ignore.exs",
      list_unused_filters: true,
      plt_add_apps: [:ex_unit],
      plt_core_path: "priv/plts",
      plt_file: {:no_warn, "priv/plts/dialyzer.plt"}
    ]
  end
end
