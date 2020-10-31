-- | Monoid patterns

module Monoid where

import           Prelude hiding (Monoid (..), Semigroup (..))

-- (1 + (1 + 2)) = ((1 + 1) + 2)
-- (0 + 5) = 5
-- (5 + 0) = 5

-- ([] ++ [1, 2, 3]) = [1, 2, 3]
-- ([1, 2, 3] ++ []) = [1, 2, 3]
-- ([1, 2] ++ [1, 3]) ++ [1, 4]
-- [1, 2] ++ ([1, 3] ++ [1, 4])

class Semigroup a where
    (<>) :: a -> a -> a


class Semigroup a => Monoid a where
    mempty :: a
    mappend :: a -> a -> a

{- | Monoid laws

Associativity
a <> (b <> c) == (a <> b) <> c

left identity
mempty <> a = a

right identity
a <> mempty = a


-}

data Nat = Nil
         | Succ Nat

-- 2 = Succ (Succ Nil)

instance Semigroup Nat where
    Nil <> a           = a
    a <> Nil           = a
    Succ n1 <> Succ n2 = Succ (Succ n1 <> n2)

-- Succ Nil <> Succ Nil = Succ (Succ Nil <> Nil)
--                      = Succ (Succ Nil)

-- Succ (Succ Nil) <> Succ (Succ Nil) = Succ (Succ (Succ Nil) <> Succ Nil)
--                                    = Succ (Succ (Succ (Succ Nil)) <> Nil)
--                                    = Succ (Succ (Succ (Succ Nil)))

-- -- Succ n1 <> Succ n2 = Succ (Succ n1 <> n2)
-- 2 + 2 = 1 + (2 + (2 - 1))
--       = 1 + (2 + 1)
--       = 1 + (1 + (2 + (1 - 1)))
--       = 1 + (1 + (2 + 0))
--       = 1 + (1 + (2))

instance Monoid Nat where
    mempty = Nil
    mappend = (<>)

main :: IO ()
main = putStrLn "Hello World!"
