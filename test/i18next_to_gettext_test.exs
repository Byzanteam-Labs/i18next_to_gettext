defmodule I18nextToGettextTest do
  use ExUnit.Case

  test "works" do
    assert_parse_file("zh_CN", """
      msgid "Attribute.Auth.verification_code"
      msgstr "验证码"

      msgid "Attribute.Project.project.__t__"
      msgstr "项目"

      msgid "Attribute.Project.project.description"
      msgstr "项目描述"

      msgid "Attribute.Project.project.title"
      msgstr "项目名称"

      msgid "Common.errors.format"
      msgstr "%{attribute}%{message}"

      msgid "Common.errors.messages.format"
      msgstr "格式错误"

      msgid "Common.unit.time.month"
      msgstr "月"

      msgid "Common.unit.time.second"
      msgstr "秒"

      """)
  end

  defp test_data(file_name), do: Path.join(File.cwd!(), "test/fixtures/#{file_name}.json")

  defp assert_parse_file(file_name, result) do
    path = test_data(file_name)

    assert I18nextToGettext.to_po_binary(path) == result
  end
end
