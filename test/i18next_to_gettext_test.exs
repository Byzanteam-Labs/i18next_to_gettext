defmodule I18nextToGettextTest do
  use ExUnit.Case
  doctest I18nextToGettext

  test "greets the world" do
    assert I18nextToGettext.hello() == :world
  end
end
