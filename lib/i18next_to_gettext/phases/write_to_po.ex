defmodule I18nextToGettext.Phase.WriteToPo do
  @moduledoc """
  Write to po file
  key -> msgid
  value -> msgstr
  """
  def run(data, output_file) do
    content =
      data
      |> Enum.to_list()
      |> Enum.sort(fn {key1, _value1}, {key2, _value2} -> key1 < key2 end)
      |> Enum.map(fn
        {key, value} ->
          """
          msgid #{Jason.encode!(key)}
          msgstr #{Jason.encode!(value)}

          """
      end)
      |> IO.iodata_to_binary()

    File.write!(Path.absname("#{output_file}"), content)
  end
end
