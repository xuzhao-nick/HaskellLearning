function :: Integer -> Integer -> Integer
function x y = if (x > y) then (x + 10) else y

function2 :: Integer -> Integer -> Integer
function2 x y =
  case (x > y) of
    False -> y      -- when False, return y
    True -> x + 10  -- when True, return x + 10

absVal :: (Num a, Ord a) => a -> a
absVal x = if (x < 0) then (negate x) else x

absVal1 :: (Num a, Ord a) => a -> a
absVal1 x =
  case (x > 0) of
    False -> (negate x)
    True -> x

validateUsernamePassword :: String -> String -> String
validateUsernamePassword username password =
  if null username
    then (if null password
            then "Empty username and password"
            else "Empty username")
    else (if null password
              then "Empty password"
              else "Okey")


validateUsernamePassword1 :: String -> String -> String
validateUsernamePassword1 username password =
  case (null username) of
      True -> case (null password) of
                True -> "Empty username and password"
                False -> "Empty username"
      False -> case (null password) of
                True -> "Empty password"
                False -> "Okey"

safeTail :: [a] -> [a]
safeTail [] = []
safeTail (x:xs) = xs

safeHead :: [a] -> Maybe a
safeHead [] = Nothing
safeHead (x:xs) = Just x
