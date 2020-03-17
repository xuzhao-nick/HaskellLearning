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
        False -> Left (Error "Your password cannot contain \
                      \white space or special characters.")
        True -> Right xs

checkUsernameLength :: String -> Either Error Username
checkUsernameLength name =
    case (length name > 15)  of
        True -> Left (Error "Username cannot be longer \
                     \than 15 characters.")
        False -> Right (Username name)

checkPasswordLength :: String -> Either Error Password
checkPasswordLength password =
    case (length password > 20)  of
        True -> Left (Error "Your password cannot be longer \
                     \than 20 characters.")
        False -> Right (Password password)

validatePassword :: Password -> Either Error Password
validatePassword (Password password) =
    cleanWhitespace password -- String -> Either Error String
        >>= requireAlphaNum  -- String -> Either Error Password
        >>= checkPasswordLength -- String -> Either Error String

validateUsername :: Username -> Either Error Username
validateUsername (Username username) =
    cleanWhitespace username -- String -> Either Error String
        >>= requireAlphaNum  -- String -> Either Error Password
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
