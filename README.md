# I18nextToGettext

Mix task to convert input i18next json file to po file for gettext

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `i18next_to_gettext` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:i18next_to_gettext, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/i18next_to_gettext](https://hexdocs.pm/i18next_to_gettext).


## Use

```
mix i18next_to_gettext.convert input-file output-file
```
