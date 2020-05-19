defmodule I18nextToGettext.Phase.ExtractValues.ReplaceInterpolationTest do
  use ExUnit.Case

  @simple_map %{
    "a" => "a",
    "d" => "d"
  }

  alias I18nextToGettext.Phase.ExtractValues.ReplaceInterpolation

  @simple_interpolation_value %{
    "a" => "{{a}}"
  }

  @multi_interpolation_value %{
    "a" => "{{a}} and {{b}}"
  }

  @only_start_match_interpolation_value %{
    "a" => "{{a}} and {{b"
  }

  @only_end_match_interpolation_value %{
    "a" => "{{a}} and b}}"
  }

  test "not change any value when not contain interpolation" do
    result = ReplaceInterpolation.run(@simple_map)
    assert result == @simple_map
  end

  test "change interpolation value to correct format" do
    result = ReplaceInterpolation.run(@simple_interpolation_value)
    assert result == %{"a" => "%{a}"}
  end

  test "change interpolation values to correct format" do
    result = ReplaceInterpolation.run(@multi_interpolation_value)
    assert result == %{"a" => "%{a} and %{b}"}
  end

  test "not change interpolation values when only start match" do
    result = ReplaceInterpolation.run(@only_start_match_interpolation_value)
    assert result == %{"a" => "%{a} and {{b"}
  end

  test "not change interpolation values when only end match" do
    result = ReplaceInterpolation.run(@only_end_match_interpolation_value)
    assert result == %{"a" => "%{a} and b}}"}
  end
end
