module Lib where
import Data.Card 

someFunc :: IO ()
someFunc = mapM_ print standardDeck
