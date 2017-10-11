module Data.Card (standardDeck)
    where
import Graphics.Rendering.OpenGL
import Graphics.UI.GLUT

data Suit = Clubs | Diamonds | Hearts | Spades
    deriving (Show, Eq, Ord, Enum)

data Rank = Two | Three | Four | Five | Six | Seven | Eight | Nine |
    Ten | Jack | Queen | King | Ace
    deriving (Show, Eq, Ord, Enum)

type Card = (Rank, Suit)

type Deck = [Card]

standardDeck :: Deck
standardDeck = [(rank, suit) | rank <- [Two ..], suit <- [Clubs ..]]

