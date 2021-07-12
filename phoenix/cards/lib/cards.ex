defmodule Cards do
  @moduledoc """
    Provides methos for creating and handling a deck of cards.
  """

  @doc """
    Returns a list of strings representing a deck of playing cards.

  ## Examples

      iex> Cards.create_deck
      iex> ["Ace of Spades", "Ace of Clubs", "Ace of Hearts", "Ace of Diamonds"]
  """
  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

    for value <- values, suit <- suits do
      "#{value} of #{suit}"
    end
  end

  @doc """
    Returns a scrambled list of strings representing a deck of cards.
  """
  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  @doc """
    Determines whether a deck contains a given card

  ## Examples

      iex> Cards.create_deck
      iex> |> Cards.contains?("Ace")
      false
  """
  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  @doc """
    Divides a deck into a hand an the remainder of the deck.
    The `hand_size` argument indicates how many cards should
    be in the hand.

  ## Examples

      iex> deck = Cards.create_deck
      iex> {hand, deck} = Cards.deal(deck, 1)
      iex> hand
      ["Ace of Spades"]
  """
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  @doc """
    Save the deck to a specific file with the method argument.

  ## Examples

      iex> deck = Cards.create_deck
      iex> Cards.save(deck, "my_file")
      :ok
  """
  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write!(filename, binary)
  end

  @doc """
    Load the deck to a specific file with the method argument.
  """
  def load(filename) do
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term(binary)
      {:error, _reason} -> "That file does not exist"
    end
  end

  @doc """
    Create the shuffled deck and select the amount of cards for the player specified
    by the `hand_size` argument
  """
  def create_hand(hand_size) do
    create_deck()
    |> shuffle()
    |> deal(hand_size)
  end
end
