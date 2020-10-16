-- | Helpers to launch the game

module Game.Go.Launch where

import           Game.Go.Ui (getBoardSize, startGame)


runGame :: IO ()
runGame = do
    size <- getBoardSize
    startGame size
