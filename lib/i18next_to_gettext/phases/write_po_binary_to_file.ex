defmodule I18nextToGettext.Phase.WritePoBinaryToFile do
  @moduledoc """
  Write po binary to the file
  """

  def run(data, output_file) do
    File.write!(Path.absname(output_file), data)
  end
end
