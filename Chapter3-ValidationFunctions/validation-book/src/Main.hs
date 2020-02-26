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

checkPassword :: String -> Maybe String
checkPassword password =
    case (cleanWhitespace password) of
        Nothing -> Nothing
        Just cleanedPassword ->
            case (checkPasswordLength cleanedPassword) of
                Nothing -> Nothing
                Just cleanedPassword ->
                    case (requireAlphaNum cleanedPassword) of
                        Nothing -> Nothing
                        Just cleanedPassword -> Just cleanedPassword

validatePassword :: String -> Maybe String
validatePassword password =
    case (cleanWhitespace password) of
        Nothing -> Nothing
        Just password2 ->
            case (requireAlphaNum password2) of
                Nothing -> Nothing
                Just password3 ->
                    checkPasswordLength password3 d

main :: IO ()
main =
  do
    putStrLn "Please enter a password\n>"
    password <- getLine
    print(checkPassword password)
