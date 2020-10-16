-- | Parse CLI inputs

module Game.Go.Parsers (Parser, boardSizeP, seedCoordinatesP) where

import           Game.Go.Board (Coordinates, GoBoardSize)
import           Text.Parsec   (Parsec)

type Parser = Parsec String ()

boardSizeP :: Parser GoBoardSize
boardSizeP = undefined

seedCoordinatesP :: Parser Coordinates
seedCoordinatesP = undefined
