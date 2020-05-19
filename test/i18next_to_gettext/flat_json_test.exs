defmodule I18nextToGettext.Phase.FlatJsonTest do
  use ExUnit.Case

  @simple_map %{
    "a" => "a",
    "d" => "d"
  }
  @nest_map %{
    "a" => %{
      "b" => "b",
      "c" => %{
        "d" => "d"
      }
    },
    "d" => "d"
  }
  test "flat normal map" do
    result = I18nextToGettext.Phase.FlatJson.run(@simple_map)
    assert result == @simple_map
  end

  test "flat nest map" do
    result = I18nextToGettext.Phase.FlatJson.run(@nest_map)
    assert result == %{"d" => "d", "a.b" => "b", "a.c.d" => "d"}
  end
end
