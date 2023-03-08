defmodule War.MixProject do
  use Mix.Project

  def project do
    [
      app: :war,
      version: "0.1.0",
      elixir: "~> 1.10",
      start_permanent: Mix.env() == :prod,
    ]
  end

end
