defmodule Mix.Tasks.I18nextToGettext.Convert do
  use Mix.Task

  @shortdoc "Convert i18next json file to gettext po file"

  @impl true
  def run(args) do
    [input_file, output_file | _] = args

    :ok = I18nextToGettext.to_po_file(input_file, output_file)
  end
end
