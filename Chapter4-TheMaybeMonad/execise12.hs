import Data.Type.Type
data StringOrValue a = Str String | Val a deriving Show
bindStringOrValue :: StringOrValue a
    -> (a -> StringOrValue b)
    -> StringOrValue b

bindStringOrValue (Str xs) func = Str xs
bindStringOrValue (Val x) func = func x
