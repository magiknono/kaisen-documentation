defmodule KaisenDocumentationTest do
  use ExUnit.Case
  doctest KaisenDocumentation

  test "greets the world" do
    assert KaisenDocumentation.hello() == :world
  end
end
