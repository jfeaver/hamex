defmodule Hamex.LexerTest do
  use ExUnit.Case

  setup do
    {:ok, tokens} = Hamex.Tokens.start_link
    {:ok, tokens: tokens}
  end

  test "recognizing a doctest", %{tokens: tokens} do
    line = "!!!"
    Hamex.Lexer.lex(line, tokens)
    assert(Hamex.Tokens.tokens(tokens) == [{:doctype, "!!!"}])
  end

  test "recognizing a further specified doctype", %{tokens: tokens} do
    line = "!!! Strict"
    Hamex.Lexer.lex(line, tokens)
    assert(Hamex.Tokens.tokens(tokens) == [{:doctype_spec, "Strict"}, {:doctype, "!!!"}])
  end
end
