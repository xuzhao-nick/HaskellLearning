import Data.Char
f :: String -> String -> String
f x y = x <> ": " <> y

f1 :: String -> String
f1 x = (drop 2 . map toUpper . reverse) x
