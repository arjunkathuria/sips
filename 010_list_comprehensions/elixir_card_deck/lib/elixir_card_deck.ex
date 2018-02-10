defmodule ElixirCardDeck do
  @moduledoc """
  Documentation for ElixirCardDeck.
  generates a list representing a card deck using list comprehensions
  each card is a tuple of the form {:card, :value, :suit}
  """

  # @doc """
  # iex> ElixirCardDeck.hello
  # :world
  # """
  # def hello, do: :world

  @doc """
  Generates the whole deck.
  note about comprehensions.
  A lc has two parts 
    -a generator(s)
    -a filter(s)
  there can be multiple generators and filters. 
  The generators generate the values, anything for which the filter returns false or nil is not included in the resulting list.
  """
  def generate_deck do
    values = [:a, 2, 3, 4, 5, 6, 7, 8, 9, 10, :j, :q, :k]
    suits = [:spades, :clubs, :diamonds, :hearts]
    for value <- values, suit <- suits, do: {:card, value, suit}
  end
end
