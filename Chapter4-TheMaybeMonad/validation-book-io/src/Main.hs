module Main where
import Data.Char

cleanWhitespace :: String -> Maybe String
cleanWhitespace "" = Nothing
cleanWhitespace (x : xs) =
    case (isSpace x) of
        True -> cleanWhitespace xs
        False -> Just (x : xs)


requireAlphaNum :: String -> Maybe String
requireAlphaNum xs =
    case (all isAlphaNum xs) of
        False -> Nothing
        True -> Just xs

checkPasswordLength :: String -> Maybe String
checkPasswordLength password =
    case (length password > 20 || length password < 10) of
        True -> Nothing
        False -> Just password

validatePassword :: String -> Maybe String
validatePassword password =
    cleanWhitespace password
        >>= requireAlphaNum
        >>= checkPasswordLength


main :: IO ()
main = getLine >>= (print . cleanWhitespace)
