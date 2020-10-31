-- |

module Functor where

import           Prelude hiding (Functor (..))

{- |

Laws
identity morphisms
fmap id = id

composition of morphisms
fmap (f . g) = fmap f . fmap g

-}

class Functor f where
    fmap :: (a -> b) -> f a -> f b

data Identity a = Identity a

instance Functor Identity where
    fmap f (Identity a) = Identity $ f a

instance Functor [] where
    fmap _ []     = []
    fmap f (x:xs) = f x : fmap f xs
    -- fmap (+ 1) [1, 2, 3, 4] = [2, 3, 4, 5]

instance Functor ((->) a) where
    fmap f g = f . g

main :: IO ()
main = putStrLn "Hello World!"
