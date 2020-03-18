module Main where
import Data.Char

newtype Password = Password String
    deriving Show

newtype Error = Error String
    deriving Show

newtype Username = Username String
    deriving Show

cleanWhitespace :: String -> Either Error String
cleanWhitespace "" = Left (Error "Left Your password cannot be empty.")
cleanWhitespace (x : xs) =
    case (isSpace x) of
        True -> cleanWhitespace xs
        False -> Right (x : xs)


requireAlphaNum :: String -> Either Error String
requireAlphaNum xs =
    case (all isAlphaNum xs) of
        False ->  Left (Error "Your password cannot contain \
                      \white space or special characters.")
        True -> Right xs

checkLength :: Int -> String -> String -> Either Error String
checkLength theLength string name =
    case (length string > theLength) of
        True -> Left (Error (name ++ " cannot be longer than " ++ (show theLength) ++ " characters."))
        False -> Right string


checkUsernameLength :: String -> Either Error String
checkUsernameLength name = (checkLength 15 name "Username")

checkPasswordLength :: String -> Either Error String
checkPasswordLength password = (checkLength 20 password "Password")

validatePassword :: Password -> Either Error String
validatePassword (Password password) =
    cleanWhitespace password -- String -> Either Error String
        >>= requireAlphaNum  -- String -> Either Error String
        >>= checkPasswordLength -- String -> Either Error String

validateUsername :: Username -> Either Error String
validateUsername (Username username) =
    cleanWhitespace username -- String -> Either Error String
        >>= requireAlphaNum  -- String -> Either Error String
        >>= checkUsernameLength -- String -> Either Error String

main :: IO ()
main =
  do
    putStrLn "Please enter a password\n>"
    password <- Password <$> getLine
    print(validatePassword password)
    putStrLn "Please enter a username\n>"
    username <- Username <$> getLine
    print(validateUsername username)
