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
    fmap = undefined

instance Functor [] where
    fmap = undefined

instance Functor ((->) a) where
    fmap = undefined

main :: IO ()
main = putStrLn "Hello World!"
