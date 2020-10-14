module Main where

import           Control.Monad  (forever)
import           Data.Foldable  (find)
import           Text.Read      (readMaybe)

import           Game.Go.Launch (initBoard, runGame)

main :: IO ()
main = do
    i <- tryExtract isValid getBoardSize
    let initialBoard = initBoard i
        game         = runGame initialBoard
    forever game
    where
        -- Tries to get board size
        getBoardSize = do
            putStrLn "Enter your board size <X>:"
            input <- getLine
            result <- return $ readMaybe input
            return result

        -- Runs IO action until the extracting function can extract a value
        tryExtract :: (a -> Maybe b) -> IO a -> IO b
        tryExtract extract action = do
            result <- fmap extract action
            case result of
                Just validResult -> return validResult
                _                -> do
                    putStrLn "Invalid value!\n"
                    tryExtract extract action

        isValid :: Maybe Int -> Maybe Int
        isValid = find (> 0)
