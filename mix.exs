defmodule Geo.Mixfile do
  use Mix.Project

  def project do
    [ app: :geo,
      version: "1.0.0",
      elixir: "~> 1.0",
      deps: deps,
      description: description,
      package: package,
      name: "Geo",
      source_url: "https://github.com/bryanjos/geo"]
  end

  # Configuration for the OTP application
  def application do
    [
      applications: [:logger]
    ]
  end

  defp description do
    """
    PostGIS extension for Postgrex. Also encodes and decodes WKB, WKT, and GeoJSON.
    """
  end

  defp deps do
    [
      {:ecto, "~> 1.0", optional: true },
      {:postgrex, "~> 0.9", optional: true },
      {:poison, "~> 1.0", optional: true},
      {:earmark, "~> 0.1", only: :dev},
      {:ex_doc, "~> 0.10", only: :dev}
    ]
  end

  defp package do
    [ # These are the default files included in the package
      files: ["lib", "mix.exs", "README*", "readme*", "LICENSE*", "license*", "CHANGELOG*"],
      maintainers: ["Bryan Joseph"],
      licenses: ["MIT"],
      links: %{ "GitHub" => "https://github.com/bryanjos/geo" }
    ]
  end
end
