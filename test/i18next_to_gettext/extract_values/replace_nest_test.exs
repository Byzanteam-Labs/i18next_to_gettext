defmodule I18nextToGettext.Phase.ExtractValues.ReplaceNestTest do
  use ExUnit.Case

  @simple_map %{
    "a" => "a",
    "d" => "d"
  }

  @nest_map %{
    "a" => "a $t(d)",
    "d" => "d"
  }

  @deep_nest_map %{
    "a" => "a $t(d)",
    "d" => "d $t(c)",
    "c" => "c"
  }

  alias I18nextToGettext.Phase.ExtractValues.ReplaceNest

  test "not replace value when not match the format" do
    result = ReplaceNest.run(@simple_map)
    assert result == @simple_map
  end

  test "replace nest value when match the format" do
    result = ReplaceNest.run(@nest_map)
    assert result == %{"a" => "a d", "d" => "d"}
  end

  test "replace deep value when match the format" do
    result = ReplaceNest.run(@deep_nest_map)
    assert result == %{"a" => "a d c", "d" => "d c", "c" => "c"}
  end
end
