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

<h4>Add @IO with >>=</h4>

Prelude> :type (>>=) @IO
(>>=) @IO :: IO a -> (a -> IO b) -> IO b

<h4>Setup project</h4>
Setup a project "validation-book":

$ stack new validation-book simple

<h4>Start GHCI</h4>

$ stack repl
