defmodule I18nextToGettext.Phase.ExtractValues.ReplaceNest do
  @moduledoc """
  Replace nest value
  `$t(keys)` -> `string`
  """
  @regex ~r/\$t\((\s*[\w\.]+\s*)\)/

  def run(map) do
    for {key, value} <- map, into: %{} do
      new_value =
        if is_binary(value) do
          Regex.replace(@regex, value, fn _value, nest_key ->
            get_nest_value(nest_key, map)
          end)
        else
          value
        end

      {key, new_value}
    end
  end

  defp get_nest_value(nest_key, map) do
    case Map.get(map, nest_key) do
      nil ->
        ""

      value when is_binary(value) ->
        Regex.replace(@regex, value, fn _, nest_key ->
          get_nest_value(nest_key, map)
        end)

      other ->
        other
    end
  end
end
