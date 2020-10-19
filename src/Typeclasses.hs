-- | Defining type classes

module Typeclasses where

-- | Type family for different types

-- class <class name f> where
-- associated functions

class Identify a where
    identify :: a -> a

instance Identify Bool where
    identify b = b

-- | Exercise 1
-- For the following datatypes,

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

-- Ord typeclass -- ordering
instance Ord a => Ord (Identity a) where
    Identity a `compare` Identity b = a `compare` b

-- Show typeclass -- show the type as a string
instance Show a => Show (Identity a) where
    show (Identity a) = "Identity " ++ show a

main :: IO ()
main = putStrLn "Hello World!"
