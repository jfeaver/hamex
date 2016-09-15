defmodule Hamex.Lexer do
  def lex(string, tokens) do
    send_token(tokens, {:doctype, string})
  end

  defp send_token(tokens, token) do
    Hamex.Tokens.push(tokens, token)
  end
end
