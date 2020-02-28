##Setup language extension

Prelude> :set -XTypeApplications

##Check the type of ">>=="

Prelude> :type (>>=)

(>>=) :: Monad m => m a -> (a -> m b) -> m b

##Add @Maybe with >>=

Prelude> :type (>>=) @Maybe

(>>=) @Maybe :: Maybe a -> (a -> Maybe b) -> Maybe b

##Add @String with @Maybe

Prelude> :type (>>=) @Maybe @String

(>>=) @Maybe @String

  :: Maybe String -> (String -> Maybe b) -> Maybe b

##Add @Int with @Maybe

Prelude> :type (>>=) @Maybe @Int

(>>=) @Maybe @Int :: Maybe Int -> (Int -> Maybe b) -> Maybe b