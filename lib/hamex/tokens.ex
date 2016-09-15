defmodule Hamex.Tokens do
  def start_link do
    Agent.start_link(fn -> [] end, name: __MODULE__)
  end

  def tokens(tokens_server) do
    Agent.get(tokens_server, &(&1))
  end

  def push(tokens_server, token) do
    Agent.update(tokens_server, &([ token | &1]))
  end
end
