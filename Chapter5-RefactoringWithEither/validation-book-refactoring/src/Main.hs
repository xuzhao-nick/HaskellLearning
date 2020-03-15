module Main where
import Data.Char

cleanWhitespace :: String -> Either String String
cleanWhitespace "" = Left "Left Your password cannot be empty."
cleanWhitespace (x : xs) =
    case (isSpace x) of
        True -> cleanWhitespace xs
        False -> Right (x : xs)


requireAlphaNum :: String -> Either String String
requireAlphaNum xs =
    case (all isAlphaNum xs) of
        False -> Left "Your password cannot contain \
                      \white space or special characters."
        True -> Right xs

checkPasswordLength :: String -> Either String String
checkPasswordLength password =
    case (length password > 20)  of
        True -> Left "Your password cannot be longer \
                     \than 20 characters."
        False -> Right password

validatePassword :: String -> Either String String
validatePassword password =
    cleanWhitespace password
        >>= requireAlphaNum
        >>= checkPasswordLength


main :: IO ()
main =
  do
    putStrLn "Please enter a password\n>"
    password <- getLine
    print(validatePassword password)

printTestResult :: Either String () -> IO()
printTestResult r =
    case r of
        Left err -> putStrLn err
        Right () -> putStrLn "All tests passed."

eq :: (Eq a, Show a) => Int -> a -> a -> Either String ()
eq n actual expected =
    case (actual == expected) of
        True -> Right ()
        False -> Left (unlines
          [ "Test" ++ show n
          , " Expected: " ++ show expected
          , " But got:  " ++ show actual
          ])

test :: IO ()
test = printTestResult $
  do
    eq 1 (checkPasswordLength "") (Right "")
    eq 2 (checkPasswordLength "julielovesbooks")
         (Right "julielovesbooks")
    eq 3 (requireAlphaNum "julielovesbooks")
              (Right "julielovesbooks")
    eq 4 (cleanWhitespace "  julie")
         (Right "julie")
