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


bindMaybe :: Maybe a -> (a -> Maybe b) -> Maybe b
bindMaybe maybeValue aFunction =
  case maybeValue of
      Nothing -> Nothing
      Just value -> aFunction value

bindMaybe1 Nothing aFunction = Nothing
bindMaybe1 (Just x) aFunction = aFunction x


-- Usage Examples
-- bindMaybe (cleanWhitespace "  abc") requireAlphaNum
-- bindMaybe1 (cleanWhitespace "  abc") requireAlphaNum
-- (cleanWhitespace "  abc") `bindMaybe` requireAlphaNum
-- (cleanWhitespace "  abc") `bindMaybe1` requireAlphaNum
