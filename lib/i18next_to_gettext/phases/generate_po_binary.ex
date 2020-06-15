defmodule I18nextToGettext.Phase.GeneratePoBinary do
  @moduledoc """
  Generate po binary

  key -> msgid
  value -> msgstr
  """

  def run(data) do
    data
    |> Enum.to_list()
    |> Enum.sort(fn {key1, _value1}, {key2, _value2} -> key1 < key2 end)
    |> Enum.map(fn
      {_key, value} when is_list(value) ->
        ""

      {key, value} ->
        """
        msgid #{Jason.encode!(key)}
        msgstr #{Jason.encode!(value)}

        """
    end)
    |> IO.iodata_to_binary()
  end
end
