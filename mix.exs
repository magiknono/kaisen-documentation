defmodule KaisenDocumentation.MixProject do
  use Mix.Project

  def project do
    [
      app: :kaisen_documentation,
      version: "0.1.0",
      elixir: "~> 1.10",
      start_permanent: Mix.env() == :prod,
      deps: deps(),

      # Docs
      name: "docs",
      homepage_url: "https://docs.kaisenlinux.org",
      docs: [
        main: "readme",
        api_reference: false,
        assets: "priv/assets",
        extra_section: "Guide",
        extras: [
          "README.md",
          "start/links.md": [ title: "Official Kaisen Linux links"],
          "start/why.md": [ title: "Why use Kaisen Linux ?"],
          "start/usb.md": [ title: "USB creation"],
          "start/hardware.md": [ title: "Hardware requirements"],
          "start/live.md": [ title: "Live informations"],
          "start/install.md": [ title: "Install OS"],
          "start/virtualisation.md": [ title: "Using Virtualisation"],
          "start/menu.md": [ title: "Menu and Tools overview"],
          "tools/tools.md": [ title: "Tools"],
          "tools/packages.md": [ title: "Packages"],
          "tools/metapackages.md": [ title: "Metapackages"],
          "tutorials/Windows-bootable-USB-key.md": [ title: "Windows bootable USB key"],
          "tutorials/Bad-sectors-analyses.md": [ title: "Bad sectors analyses"]
        ],
        groups_for_extras: [
          "START": Path.wildcard("start/*.md"),
          "TOOLS & PACKAGES": Path.wildcard("tools/*.md"),
          "TUTORIALS": Path.wildcard("tutorials/*.md")

        ],

      ],
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
      {:ex_doc, "~> 0.23", only: :dev, runtime: false},
    ]
  end
end
