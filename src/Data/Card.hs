module Data.Card (standardDeck, perfectShuffle, perfectCut)
    where
import Data.List (splitAt)

data Suit = Clubs | Diamonds | Hearts | Spades
    deriving (Show, Eq, Ord, Enum)

data Rank = Two | Three | Four | Five | Six | Seven | Eight | Nine |
    Ten | Jack | Queen | King | Ace
    deriving (Show, Eq, Ord, Enum)

type Card = (Rank, Suit)

type Deck = [Card]

standardDeck :: Deck
standardDeck = [(rank, suit) | rank <- [Two ..], suit <- [Clubs ..]]

perfectShuffle :: Deck -> Deck
perfectShuffle deck = combine $ splitAt midpoint deck
    where combine ([], ys) = ys
          combine (xs, []) = xs
          combine (x:xs, y:ys) = x : y : combine (xs, ys)
          midpoint = (length deck) `div` 2

perfectCut :: Deck -> Deck
perfectCut deck = combine $ splitAt midpoint deck
    where midpoint = (length deck) `div` 2
          combine (a, b) = b ++ a
