Prelude> :set -XTypeApplications
Prelude> :type (>>=)
(>>=) :: Monad m => m a -> (a -> m b) -> m b
Prelude> :type (>>=) @Maybe
(>>=) @Maybe :: Maybe a -> (a -> Maybe b) -> Maybe b
Prelude> :type (>>=) @Maybe @String
(>>=) @Maybe @String
  :: Maybe String -> (String -> Maybe b) -> Maybe b
Prelude> :type (>>=) @Maybe @Int
(>>=) @Maybe @Int :: Maybe Int -> (Int -> Maybe b) -> Maybe b
