-- |

module Monad where

{-
| Law            | definition `(>>=)`                         | definition `(>=>)`  | definition `join / j`    |
|----------------|--------------------------------------------|---------------------|--------------------------|
| left identity  | `return a >>= f = f a`                     | `return >=> g == g` | `join . return == id`    |
| right identity | `m >>= return = m`                         | `f >=> return == f` | `join . fmap pure == id` |
| associativity  | `(m >>= f) >>= g = m >>= (\x -> fx >>= g)` | `f >=> (g >=> h)`   | `j . fmap j = j . j`     |
-}

-- function addOne (a) {
--     console.log(a)
--     return a + 1
-- }

-- Int addOne (Int a) {
--     System.out.println(a);
--     return a + 1;
-- }

-- addOne :: Int -> Int
-- addOne n = do
--     putStrLn n
--     return n + 1

addOneLogged :: Int -> (String, Int)
addOneLogged n = (show n, n + 1)

addTwoLogged :: Int -> (String, Int)
addTwoLogged n = (show n, n + 2)

addOneAddTwoLogged :: Int -> (String, Int)
addOneAddTwoLogged n = let (log1, n1) = addOneLogged n
                           (log2, n2) = addTwoLogged n1
                       in  (log1 <> log2, n2)

-- addOne . addOne
-- addOneLogged >=> addOneTwoLogged

addOneIfOdd :: Int -> Maybe Int
addOneIfOdd i | i `mod` 2 == 1 = Just (i + 1)
              | otherwise = Nothing

addOneIfOdd >=> addOneIfEven

addOneAddTwo :: Int -> Int
addOneAddTwo = addTwo . addOne'

-- f (g (x)) = (f . g) x

addOne' :: Int -> Int
addOne' n = n + 1

addTwo :: Int -> Int
addTwo n = n + 2

data Product a b = Product a b
data (,) a b = (a, b)

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
