defmodule Hamex.TokensTest do
  use ExUnit.Case, async: true

  setup do
    {:ok, tokens_server} = Hamex.Tokens.start_link
    {:ok, tokens_server: tokens_server}
  end

  test "it starts out empty", %{tokens_server: tokens_server} do
    assert Hamex.Tokens.tokens(tokens_server) == []
  end

  test "it stores tokens in a list", %{tokens_server: tokens_server} do
    Hamex.Tokens.push(tokens_server, {:indentation, "  "})
    assert Hamex.Tokens.tokens(tokens_server) == [{:indentation, "  "}]
  end
end
