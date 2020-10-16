module Game.Go.Board (Coordinates, GoBoard, GoBoardSize, createBoard) where

import           Data.Array (Array)


data GoBoard = GoBoard { unGoGame :: Array Coordinates GoBoard }

type Coordinates = (X, Y)
type X = Int
type Y = Int

type GoBoardSize = Int

createBoard = undefined
