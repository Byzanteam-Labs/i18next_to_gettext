defmodule I18nextToGettext do
  @moduledoc """
  Documentation for I18nextToGettext.
  """

  alias I18nextToGettext.Phase

  def run(input_file, output_file) do
    input_file
    |> Phase.ReadJsonFile.run()
    |> Phase.DecodeJsonBinary.run()
    |> Phase.FlatJson.run()
    |> Phase.ExtractValues.ReplaceInterpolation.run()
    |> Phase.ExtractValues.ReplaceNest.run()
    |> Phase.WriteToPo.run(output_file)
  end
end
