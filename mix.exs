defmodule Trans.Mixfile do
  use Mix.Project

  @version "2.0.3"

  def project do
    [app: :trans,
    version: @version,
     elixir: "~> 1.4",
     description: "Embedded translations for Elixir schemas",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     elixirc_paths: elixirc_paths(Mix.env),
     app_list: app_list(Mix.env),
     package: package(),
     deps: deps(),
     # Docs
     name: "Trans",
     docs: [source_ref: "v#{@version}", main: "Trans",
            canonical: "https://hexdocs.pm/trans",
            source_url: "https://github.com/crbelaus/trans"]]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:poison, ">= 2.1.0"},
      {:postgrex, "~> 0.11", optional: true},
      {:ecto, "~> 2.1", optional: true},
      {:ex_doc, ">= 0.0.0", only: :dev},
      {:faker, "~> 0.7.0", only: :test},
    ]
  end

  defp package do
    [
      licenses: ["MIT"],
      maintainers: ["Cristian Álvarez Belaustegui"],
      links: %{"GitHub" => "https://github.com/crbelaus/trans"}
    ]
  end

  # Include Ecto and Postgrex applications in tests
  def app_list(:test), do: [:ecto, :postgrex]
  def app_list(_), do: app_list()
  def app_list, do: []

  # Always compile files in "lib". In tests compile also files in
  # "test/support"
  def elixirc_paths(:test), do: elixirc_paths() ++ ["test/support"]
  def elixirc_paths(_), do: elixirc_paths()
  def elixirc_paths, do: ["lib"]
end
