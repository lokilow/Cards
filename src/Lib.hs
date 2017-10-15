module Lib where
import Data.Card 
import Render
someFunc :: IO ()
someFunc = mapM_ print standardDeck
