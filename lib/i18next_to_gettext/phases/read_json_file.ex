defmodule I18nextToGettext.Phase.ReadJsonFile do
  @moduledoc """
  Get json binary from the file
  """

  def run(input_file) do
    input_file
    |> Path.absname()
    |> File.read!()
  end
end
