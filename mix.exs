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
        "deps.get",
        "deps.compile",
        "compile --force --return-errors",
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
      {:dialyxir, "~> 1.0", only: [:dev, :test], runtime: false},
      {:excoveralls, "~> 0.10", only: :test}
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
      plt_add_apps: [:ex_unit],
      flags: [
        "-Wunmatched_returns" | @dialyzer_warn_opts
      ],
      ignore_warnings: ".dialyzer_ignore.exs",
      list_unused_filters: true
    ]
  end
end
