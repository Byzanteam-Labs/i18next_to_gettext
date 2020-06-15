defmodule I18nextToGettext do
  @moduledoc """
  Documentation for I18nextToGettext.
  """

  alias I18nextToGettext.Phase

  def to_po_file(input_file, output_file) do
    input_file
    |> Phase.ReadJsonFile.run()
    |> Phase.DecodeJsonBinary.run()
    |> Phase.FlatJson.run()
    |> Phase.ExtractValues.ReplaceInterpolation.run()
    |> Phase.ExtractValues.ReplaceNest.run()
    |> Phase.GeneratePoBinary.run()
    |> Phase.WritePoBinaryToFile.run(output_file)
  end

  def to_po_binary(input_file) do
    input_file
    |> Phase.ReadJsonFile.run()
    |> Phase.DecodeJsonBinary.run()
    |> Phase.FlatJson.run()
    |> Phase.ExtractValues.ReplaceInterpolation.run()
    |> Phase.ExtractValues.ReplaceNest.run()
    |> Phase.GeneratePoBinary.run()
  end
end
