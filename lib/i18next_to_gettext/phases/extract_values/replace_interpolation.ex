defmodule I18nextToGettext.Phase.ExtractValues.ReplaceInterpolation do
  @moduledoc """
  Replace interpolation format
  `{{a}}` -> `%{a}`
  """
  @regex ~r/{{\s*[\w\.]+\s*}}/

  def run(map) do
    for {key, value} <- map, into: %{} do
      new_value =
        if is_binary(value) do
          Regex.replace(@regex, value, fn value, _ ->
            value
            |> String.replace("{{", "%{")
            |> String.replace("}}", "}")
          end)
        else
          value
        end

      {key, new_value}
    end
  end
end
