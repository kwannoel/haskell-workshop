-- | Types

module Types where

-- Product types
data User = User Name Age
type Name = String
type Age = Int

-- Exercise 1.
-- Construct a product type for a
-- food order
-- data Food = Food ...

-- Record types
data User' = User' { userName :: Name
                   , userAge  :: Age
                   }

-- Sum types
data Result = Success | Failure -- Sum type with cardinality 2

-- Exercise 2.
-- Construct a Sum type with cardinality 5

-- Recursive types
-- data [a] = [] | a : [a]
data List a = Cons a (List a)

-- Exercise 3.
-- Define a NonEmpty List

main :: IO ()
main = putStrLn "Hello World!"
