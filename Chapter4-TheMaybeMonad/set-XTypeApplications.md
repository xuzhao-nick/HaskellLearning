<h4>Setup language extension</h4>

Prelude> :set -XTypeApplications

<h4>Check the type of ">>=="</h4>

Prelude> :type (>>=)

(>>=) :: Monad m => m a -> (a -> m b) -> m b

<h4>Add @Maybe with >>=</h4>

Prelude> :type (>>=) @Maybe

(>>=) @Maybe :: Maybe a -> (a -> Maybe b) -> Maybe b

<h4>Add @String with @Maybe</h4>

Prelude> :type (>>=) @Maybe @String

(>>=) @Maybe @String

  :: Maybe String -> (String -> Maybe b) -> Maybe b

<h4>Add @Int with @Maybe</h4>

Prelude> :type (>>=) @Maybe @Int

(>>=) @Maybe @Int :: Maybe Int -> (Int -> Maybe b) -> Maybe b

