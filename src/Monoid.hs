-- | Monoid patterns

module Monoid where

import           Prelude hiding (Monoid (..), Semigroup (..))

class Semigroup a where
    (<>) :: a -> a -> a


class Semigroup a => Monoid a where
    mempty :: a
    mappend :: a -> a -> a

{- | Monoid laws

Associativity
a <> (b <> c) == (a <> b) <> c

left identity
a <> mempty = a

right identity
mempty <> a = a

-}

data Nat = Nil
         | Succ Nat

instance Semigroup Nat where
    (<>) = undefined

instance Monoid Nat where
    mempty = undefined
    mappend = (<>)

main :: IO ()
main = putStrLn "Hello World!"
