defmodule I18nextToGettext do
  @moduledoc """
  Documentation for I18nextToGettext.
  """

  alias I18nextToGettext.Phase

  def to_po_file(input, output_file) do
    input
    |> to_po_binary()
    |> Phase.WritePoBinaryToFile.run(output_file)
  end

  def to_po_binary({:map, binary}) do
    binary
    |> Phase.FlatJson.run()
    |> Phase.ExtractValues.ReplaceInterpolation.run()
    |> Phase.ExtractValues.ReplaceNest.run()
    |> Phase.GeneratePoBinary.run()
  end

  def to_po_binary({:binary, binary}) do
    to_po_binary({:map, Phase.DecodeJsonBinary.run(binary)})
  end

  def to_po_binary({:path, input_file}) do
    to_po_binary({:binary, Phase.ReadJsonFile.run(input_file)})
  end

  def to_po_binary(input_file) do
    to_po_binary({:path, input_file})
  end
end
