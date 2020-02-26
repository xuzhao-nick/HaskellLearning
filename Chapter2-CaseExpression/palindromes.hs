import Data.Char
import Data.List
isWord :: String -> Maybe String
isWord word =
  case (null word) of
    True -> Nothing
    False ->
      case (any isAlpha word) of
          False -> Nothing
          True -> Just word

filteredWord word =
    case (isWord word) of
        Nothing -> Nothing
        Just word -> Just (filter (\x -> x `elem` ['a'..'z']) (map toLower word))

isPalindrom word1 word2 = (reverse word1) == word2

checkPalindromes :: String -> String -> String
checkPalindromes word1 word2 =
    case (filteredWord word1) of
        Nothing -> "The first word is invalid."
        Just word1 ->
            case (filteredWord word2) of
                Nothing -> "The second word is invalid."
                Just word2 ->
                    case (isPalindrom word1 word2) of
                        False -> "These words are not palindromes."
                        True -> "These words are palindromes."
