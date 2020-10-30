-- |

module Applicative where

{-
| Law           | Proof                                          |
|---------------|------------------------------------------------|
| Naturality    | fmap (f *** g) (u ** v) = fmap f u ** fmap g v |
| Left id       | unit ** v ≝ v                                  |
| Right id      | u ** unit ≝ u                                  |
| Associativity | u ** (v ** w) ≝                                |
-}

main :: IO ()
main = putStrLn "Hello World!"
