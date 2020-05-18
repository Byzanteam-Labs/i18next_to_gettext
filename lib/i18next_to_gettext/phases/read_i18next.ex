defmodule I18nextToGettext.Phase.ReadJsonFiles do
  @moduledoc """
  * read json files
  """
  def run(input_file) do
    Path.absname(input_file)
    |> File.read!()
    |> Jason.decode!()
  end
end
