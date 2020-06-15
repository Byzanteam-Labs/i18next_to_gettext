defmodule Mix.Tasks.I18nextToGettext.Converte do
  use Mix.Task

  @shortdoc "Convert i18next json file to gettext po file"

  @impl true
  def run(args) do
    [input_file, output_file | _] = args
    I18nextToGettext.run(input_file, output_file)
    :ok
  end
end
