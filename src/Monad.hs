-- |

module Monad where


{-
| Law            | definition `(>>=)`                         | definition `(>=>)`  | definition `join / j`    |
|----------------|--------------------------------------------|---------------------|--------------------------|
| left identity  | `return a >>= f = f a`                     | `return >=> g == g` | `join . return == id`    |
| right identity | `m >>= return = m`                         | `f >=> return == f` | `join . fmap pure == id` |
| associativity  | `(m >>= f) >>= g = m >>= (\x -> fx >>= g)` | `f >=> (g >=> h)`   | `j . fmap j = j . j`     |
-}

main :: IO ()
main = putStrLn "Hello World!"
