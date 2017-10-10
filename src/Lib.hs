module Lib
    ( someFunc
    ) where
import Data.Card (standardDeck)
someFunc :: IO ()
someFunc = mapM_ print standardDeck
