bindMaybe :: Maybe a -> (a -> Maybe b) -> Maybe b
bindMaybe = (>>=)
