defmodule I18nextToGettext.Phase.DecodeJsonBinary do
  @moduledoc """
  Read json binary
  """

  def run(input_binary) do
    input_binary
    |> Jason.decode!()
  end
end
