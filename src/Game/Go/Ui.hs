-- | Game Ui components

module Game.Go.Ui where


import           Control.Monad   (forever)
import           Game.Go.Board   (Coordinates, GoBoardSize, createBoard)
import           Game.Go.Parsers (Parser, boardSizeP, seedCoordinatesP)
import           Text.Parsec     (parse)


startGame :: GoBoardSize -> IO ()
startGame size = do
    let newBoard = createBoard size
    forever $ do
        position <- getSeedPlacement
        return ()

getSeedPlacement :: IO Coordinates
getSeedPlacement = tryUntil getSeedPlacementOnce seedCoordinatesP
    where
        getSeedPlacementOnce :: IO String
        getSeedPlacementOnce = do
            putStrLn "Enter your seed coordinates <X,Y>:"
            getLine

getBoardSize :: IO GoBoardSize
getBoardSize = tryUntil getBoardSizeOnce boardSizeP
    where
        getBoardSizeOnce :: IO String
        getBoardSizeOnce = do
            putStrLn "Enter your board size <X>:"
            getLine

------------
-- Helpers -
------------

-- | Runs IO String action
--   until the parser can extract a value from the result
tryUntil :: IO String -> Parser b -> IO b
tryUntil action p = do
    result <- action
    case parse p "" result of
        Right validResult -> return validResult
        _                 -> do
            putStrLn "Invalid value!\n"
            tryUntil action p
