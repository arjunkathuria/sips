defmodule Schizo do
  @moduledoc """
  Documentation for Schizo.
  A test module that contains functions to upcase and unvowel
  """

  @doc """
    Function uppercases every other word in a string.
    iex> Schizo.uppercase("foo bar") 
    "foo BAR"
  """
  def uppercase(string) do
    words = String.split(string, " ")
    words_with_index = Stream.with_index(words);
    transformed_words = Enum.map(words_with_index, &uppercase_every_other_word/1)

    Enum.join(transformed_words, " ")
  end

  @doc """
  Function that removes the vowels from every other word in a string
  iex> Schizo.unvowel "foo bar baz boop"
  "foo br baz bp"
  """
  def unvowel(string) do
    words = String.split(string)
    words_with_index = Stream.with_index(words)
    transformed_words = Enum.map words_with_index, &unvowel_every_other_word/1

    Enum.join transformed_words, " "
  end

  defp unvowel_every_other_word({word, index}) do
    cond do
      rem(index, 2) == 0 -> word
      rem(index, 2) == 1 -> Regex.replace(~r/[aeiou]/, word, "")
    end
  end
  
  defp uppercase_every_other_word({word, index}) do
    cond do
      rem(index, 2) == 0 -> word
      rem(index, 2) == 1 -> String.upcase word
    end
  end
end
