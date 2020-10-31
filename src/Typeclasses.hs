-- | Defining type classes

module Typeclasses where

-- | Type family for different types

-- class <class name f> where
-- associated functions

class Identify a where
    identify :: a -> a

instance Identify Bool where
    identify True  = True
    identify False = False
--    identify b = b

-- | Exercise 1
-- For the following datatypes,

instance Identify Receipt where
    identify a = a

instance Identify Result where
    identify a = a

newtype Identity a = Identity a

data Result = Failure | Success

data Receipt = Receipt String Id Price


type Id = Int
type Price = Float

data List a = Cons a (List a)

-- | Implement the following typeclasses
-- Eq typeclass -- equality
instance Eq a => Eq (Identity a) where
    Identity a == Identity b = a == b

instance Eq Result where
    Failure == Failure = True
    Success == Success = True
    _ == _             = False

instance Eq Receipt where
    Receipt s i p == Receipt s1 i1 p1 = s == s1 && i == i1 && p == p1

-- Ord typeclass -- ordering
instance Ord a => Ord (Identity a) where
    Identity a `compare` Identity b = a `compare` b

instance Ord Result where
    compare = undefined

instance Ord Receipt where
    compare = undefined

-- Show typeclass -- show the type as a string
instance Show a => Show (Identity a) where
    show (Identity a) = "Identity " ++ show a

instance Show Result where
    show = undefined

instance Show Receipt where
    show = undefined

main :: IO ()
main = putStrLn "Hello World!"
