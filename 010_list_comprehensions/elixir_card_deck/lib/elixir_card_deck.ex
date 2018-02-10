defmodule ElixirCardDeck do
  @moduledoc """
  Documentation for ElixirCardDeck.
  generates a list representing a card deck using list comprehensions
  each card is a tuple of the form {:card, :value, :suit}
  """

  @doc """
  iex> ElixirCardDeck.hello
  :world
  """
  def hello, do: :world
  
  def generate_deck do
    values = [:a, 2, 3, 4, 5, 6, 7, 8, 9, 10, :j, :q, :k]
    suits = [:spades, :clubs, :diamonds, :hearts]
    for value <- values, suit <- suits, do: {:card, value, suit}
  end
end
