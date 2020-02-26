import Data.Char
isWord :: String -> Maybe String
isWord word =
  case (null word) of
    True -> Nothing
    False ->
      case (any isAlpha word) of
          False -> Nothing
          True -> Just word

substituteString :: Char -> Char
substituteString char =
    case (toLower char) of
        'a' -> '@'
        'b' -> '8'
        'c' -> '('
        'e' -> '3'
        'g' -> '9'
        'i' -> '1'
        'o' -> '0'
        's' -> '5'
        't' -> '+'
        'z' -> '2'
        _ -> char

translateSentence :: String -> String
translateSentence sentence =
    case (isWord sentence) of
        Nothing -> "The sentence is invalid."
        Just sentence -> map substituteString sentence

main :: IO()
main =
    do
        putStr "Please enter a sentence."
        sentence <- getLine
        print(translateSentence sentence)
