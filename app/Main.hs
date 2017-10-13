module Main where

import Lib
import Text.Printf

--Enumerated list of implemented games
--TODO implement these games
games = zip [0..] ["go fish", "war"]

showGame :: (Int, String) -> IO ()
showGame (num, game) = printf "%d  -  %s\n" num game

chooseGame :: IO Int
chooseGame = do
    putStrLn "Please choose a game by selecting its number"
    mapM_ showGame games
    pick <- getLine
    case reads pick :: [(Int,String)] of
      [(n, _)] -> 
          if (elem n (map fst games)) then return n else do
             putStrLn "Invalid Input"
             chooseGame
      _ -> do
          putStrLn "invalid input"
          chooseGame

main :: IO ()
main = do
    game <- chooseGame
    putStrLn $ "Playing " ++ snd (games !! game)
