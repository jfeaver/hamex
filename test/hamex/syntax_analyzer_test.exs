defmodule Hamex.SyntaxAnalyzerTest do
  use ExUnit.Case

  test "it notifies the lexer of the doctype style" do
    Hamex.SyntaxAnalyzer.push_token(syntax_analyzer, mock_lexer, token)
    {:DOWN, something} = mock_lexer.flush
    assert(something == :doctype)
  end
end
