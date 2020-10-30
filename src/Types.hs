-- | Types

module Types where

-- Dynamic vs Static typing
-- Runtime vs compile time typechecking

-- Strong vs Weak types
-- Using a value of one type as though it were another

one :: Int
one = 1

str :: String
str = "Hello!"

char :: Char
char = 'c'

-- Product types (Conjunction / Union)
data User = User Name Age
type Name = String
type Age = Int

userJason :: User
userJason = User "Jason" 22

-- | Exercise 1.
-- Construct a product type for a food order
-- should have cost (float), the order (can represent as a string)
-- data FoodOrder = FoodOrder ...

-- -- Record types
-- data User' = User' { userName :: Name
--                    , userAge  :: Age
--                    }

-- Sum types (Disjunction / xor)
data Result = Success | Failure -- Sum type with cardinality 2


-- | Exercise 2.
-- Construct an optional type
-- data Optional a = ...

-- Recursive types
-- data [a] = [] | a : [a]
data List a = Nil | Cons a (List a)

singletonList :: List Int
singletonList = Cons 1 Nil

-- | Exercise 3.
-- Define a NonEmpty List (a list with 1 item at least)
-- data NonEmpty a = ...

main :: IO ()
main = do
    putStrLn "Hello World!"
    -- putStrLn $ show $ FoodOrder 25.50 "McFlurry"
