defmodule KaisenDocumentation do

  def start do
    File.stream!("start/install.md")
  end

end
