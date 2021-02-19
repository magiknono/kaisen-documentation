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
          "tutorials/Bad-sectors-analyses.md": [ title: "Bad sectors analyses"],
          "tutorials/grub-repair.md": [ title: "Repair GRUB"],
          "tutorials/terminal-shortcuts.md": [ title: "Kaisen Terminal shortcuts"],
          "infos/licence.md": [ title: "Kaisen Linux licence"],
          "infos/download.md": [ title: "Kaisen Linux downloads"],
          "infos/repo.md": [ title: "Kaisen Linux repositories"],
          "infos/update.md": [ title: "Kaisen Linux updates"],
          "os/What-are-the-revisions-of-the-rolling-version.md": [ title: "Revisions of the rolling version ?"],
          "os/Why-are-all-additional-services-disabled-by-default.md": [ title: "Why are all additional services disabled by default ?"],
          "os/How-to-build-custom-ISO.md": [ title: "How to build custom ISO ?"],
          "os/Why-no-source-on-some-packages.md": [ title: "Why no sources on some packages ?"],
          "os/How-to-update-GUI-default-profile.md": [ title: "How to update GUI default profile ?"],
          "os/Informations-on-the-conky-theme.md": [ title: "Informations on the conky theme"],
          "os/Informations-on-rolling-version.md": [ title: "Informations on rolling version"],
          "os/Why-root-account-is-disabled.md": [ title: "Why root account is disabled by default?"],
          "os/How-to-switch-to-root-directly-with-zsh.md": [ title: "How to switch to root directly with the ZSH terminal?"],
          "os/How-to-change-graphical-interface.md": [ title: "How to change graphical interface?"],
          "os/Update-Kaisen-Linux-Rolling.md": [ title: "Update Kaisen Linux Rolling"],
          "os/How-to-change-login-wallpaper.md": [ title: "How to change login wallpaper?"],
          "os/Why-create-user-accounts-only-on-home.md": [ title: "Why create user accounts only on /home?"]


        ],
        groups_for_extras: [
          "START": Path.wildcard("start/*.md"),
          "TOOLS & PACKAGES": Path.wildcard("tools/*.md"),
          "TUTORIALS": Path.wildcard("tutorials/*.md"),
          "INFOS": Path.wildcard("infos/*.md"),
          "OS Informations": Path.wildcard("os/*.md")

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
