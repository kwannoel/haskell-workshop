-- | Learn Haskell's pattern matching syntax

module PatternMatching where

data Result = Success | Failure

showResult :: Result -> String
showResult Success = "Success"
showResult Failure = "Failure"

data User = User String String

showName :: User -> String
showName (User fn ln) = fn ++ " " ++ ln
