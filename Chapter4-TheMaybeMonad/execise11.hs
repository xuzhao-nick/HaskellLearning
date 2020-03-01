bindMaybe :: Maybe a -> (a -> Maybe b) -> Maybe b
bindMaybe maybeValue aFunction =
  case maybeValue of
      Nothing -> Nothing
      Just value -> aFunction value
