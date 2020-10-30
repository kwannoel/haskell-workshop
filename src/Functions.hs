-- | Defining basic functions to work with

module Functions where

---------------------
-- Basic functions --
---------------------

-- Identity
id :: a -> a
id = undefined

-- Addition
add :: Num a => a -> a -> a
add = undefined

-- Safe head of list
safeHead :: [a] -> Maybe a
safeHead = undefined

-- Safe tail of list
safeTail :: [a] -> Maybe [a]
safeTail = undefined

----------------------------
-- Higher order functions --
----------------------------

-- | Either takes a function as an argument
map' :: (a -> b) -> [a] -> [b]
map' f []     = undefined
map' f (x:xs) = undefined

-- | Or returns a function
subtract :: Num a => a -> a -> a
subtract n1 n2 = undefined

-------------------------
-- Partial application --
-------------------------

-- | subOne
subOne :: Num a => a -> a
subOne = undefined

-- | Promote everything in a list to an adder
adder :: Num a => [a] -> [a]
adder l = undefined
