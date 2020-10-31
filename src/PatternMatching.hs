-- | Learn Haskell's pattern matching syntax
-- Declarative

module PatternMatching where

data Result = Success | Failure

showResult :: Result -> String
showResult Success = "Success"
showResult Failure = "Failure"

data User = User String String

showName :: User -> String
showName (User firstName lastName) = firstName ++ " " ++ lastName

-- Pattern matching on infix data constructors

data Product a b = a :*: b

productFst :: Product a b -> a
productFst (a :*: _) = a

productSnd :: Product a b-> b
productSnd (_ :*: b) = b

-- | Exercise 1)
-- Pattern matching on nonEmpty List
data NonEmpty a = a :| [a]

head :: NonEmpty a -> a
head (a :| _) = a

tail :: NonEmpty a -> [a]
tail (_ :| as) = as
