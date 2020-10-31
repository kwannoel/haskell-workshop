-- |

module Monad where

{-
| Law            | definition `(>>=)`                         | definition `(>=>)`  | definition `join / j`    |
|----------------|--------------------------------------------|---------------------|--------------------------|
| left identity  | `return a >>= f = f a`                     | `return >=> g == g` | `join . return == id`    |
| right identity | `m >>= return = m`                         | `f >=> return == f` | `join . fmap pure == id` |
| associativity  | `(m >>= f) >>= g = m >>= (\x -> fx >>= g)` | `f >=> (g >=> h)`   | `j . fmap j = j . j`     |
-}

data Product a b = Product a b

instance Functor (Product a) where
    fmap f (Product a b) = Product a $ f b

instance Monoid a => Applicative (Product a) where
    pure a = Product mempty a
    Product s1 f <*> Product s2 a = Product (s1 <> s2) (f a)

-- Composition of writer
instance Monoid a => Monad (Product a) where
    return a = Product mempty a
    Product s1 a1 >>= f = let Product s2 a2 = f a1
                          in  Product (s1 <> s2) a2

data Reader e a = Reader (e -> a)

instance Functor (Reader e) where
    fmap f (Reader g) = Reader (f . g)

instance Applicative (Reader e) where
    pure a = Reader $ \_ -> a
    Reader f <*> Reader a = Reader $ \e -> let f' = f e
                                               a' = a e
                                           in  f' a'

instance Monad (Reader e) where
    return = pure
    Reader a >>= g = Reader $ \e -> let a' = a e
                                        Reader b = g a'
                                    in b e


-- Composition of reader

main :: IO ()
main = putStrLn "Hello World!"
