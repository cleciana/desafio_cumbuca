defmodule DesafioCli.MixProject do
  use Mix.Project

  def project do
    [
      app: :desafio_cli,
      version: "0.1.0",
      elixir: "~> 1.16",
      escript: [main_module: DesafioCli],
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:dep_from_hexpm, "~> 0.3.0"},
      {:ex_cldr_numbers, "~> 2.33"},
      {:jason, "~> 1.0"}
    ]
  end
end
