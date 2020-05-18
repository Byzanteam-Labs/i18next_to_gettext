defmodule I18nextToGettext.Phase.FlatJson do
  @moduledoc """
  Nest map to flat map.

  %{
    "a" => %{
      "b" => %{
        "c" => "value"
      }
    },
    "d" => "d",
    "e" => %{
      "comment" => "a",
      "ee" => 5,
      "c" => "1111"
    }
  }

  %{
    "a.b.c" => "value
  }
  """
  def run(map) do
    do_flatten_map(map, %{}, [])
  end

  defp do_flatten_map(map, acc, keys) do
    Enum.reduce(map, acc, fn
      {k, v}, acc when is_map(v) ->
        do_flatten_map(v, acc, keys ++ [k])

      {k, v}, acc ->
        k = (keys ++ [k]) |> Enum.join(".")
        Map.put(acc, k, v)
    end)
  end
end
