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

data A = A deriving Show

-- Product types (Conjunction / Union)
data User = User Name Age deriving Show
type Name = String
type Age = Int

userJoe :: User
userJoe = User "Joe" 11

userJane :: User
userJane = User "Jane" 1

userJason :: User
userJason = User "Jason" 22

-- | Exercise 1.
-- Construct a product type for a food order
-- should have cost (float), the order (can represent as a string)

data FoodOrder = FoodOrder Cost Order
type Cost = Float
type Order = String

-- -- Record types
-- data User' = User' { userName :: Name
--                    , userAge  :: Age
--                    }

-- Sum types (Disjunction / xor)
data Result = Success | Failure deriving Show -- Sum type with cardinality 2


-- | Exercise 2.
-- Construct an optional type
data Optional a = None | Some a deriving Show

-- Optional Bool
-- Some True
-- Some False
-- None

-- Recursive types
-- data [a] = [] | a : [a]
data List a = Nil | Cons a (List a) deriving Show

singletonList :: List Int
singletonList = Cons 1 Nil

threeList :: List Int
threeList = Cons 1 (Cons 2 singletonList)

-- | Exercise 3.
-- Define a NonEmpty List (a list with 1 item at least)
data NonEmpty a = Single a | NECons a (NonEmpty a) deriving Show

main :: IO ()
main = do
    putStrLn "Hello World!"
    -- putStrLn $ show $ FoodOrder 25.50 "McFlurry"
