-- |

module Applicative where

import           Prelude hiding (Applicative (..), (**))

{-
| Law           | Proof                                          |
|---------------|------------------------------------------------|
| Naturality    | fmap (f *** g) (u ** v) = fmap f u ** fmap g v |
| Left id       | unit ** v ≝ v                                  |
| Right id      | u ** unit ≝ u                                  |
| Associativity | u ** (v ** w) ≝                                |
-}

class Functor f => Monoidal f where
    unit :: f ()
    (**) :: f a -> f b -> f (a, b)
    (<*>) :: f (a -> b) -> f a -> f b

instance Monoidal [] where
    unit = [()]
    [] ** _      = []
    _ ** []      = []
    -- all permutations
    -- xs ** ys = [(x, y) | x <- xs, y <- ys]
    (x:xs) ** ys = fmap ((,) x) ys <> xs ** ys

--    fs <*> xs = fmap (uncurry ($)) $ fs ** xs
    fs <*> xs = fmap (\(f, x) -> f x) $ fs ** xs

instance Monoidal Maybe where
    unit = Just ()
    Nothing ** _     = Nothing
    _ ** Nothing     = Nothing
    Just x ** Just y = Just (x, y)

    Just f <*> Just x = Just $ f x

main :: IO ()
main = putStrLn "Hello World!"
