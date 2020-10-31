-- | Defining basic functions to work with

module Functions where

---------------------
-- Basic functions --
---------------------

-- Identity
id :: a -> a
id a = a

-- Addition
add :: Num a => a -> a -> a
add a b = a + b

-- data Maybe a = Nothing | Just a
-- data Optional a = None | Some a

-- data [a] = [] | a : [a]

-- Safe head of list
safeHead :: [a] -> Maybe a
safeHead []    = Nothing
safeHead (x:_) = Just x

-- Safe tail of list
safeTail :: [a] -> Maybe [a]
safeTail []     = Nothing
safeTail (_:xs) = Just xs

----------------------------
-- Higher order functions --
----------------------------

-- | Either takes a function as an argument
map' :: (a -> b) -> ([a] -> [b])
map' f []     = []
map' f (x:xs) = f x : map' f xs

-- | Or returns a function
subtract' :: Num a => a -> (a -> a)
-- subtract n1 n2 = n1 - n2
subtract' n1    = \n2 -> n1 - n2

-- subtract' 1 2

-- (subtract' 1) = \n2 -> 1 - n2
-- (subtract' 1) 2 = (\n2 -> 1 - n2) 2
--                 = 1 - 2

-------------------------
-- Partial application --
-------------------------

-- | subOne
subOne :: Num a => a -> a
subOne = subtract' 1

-- | Promote everything in a list to an adder
adder :: Num a => [a] -> [a]
adder = map' (+ 1)
