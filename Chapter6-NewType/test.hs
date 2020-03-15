--This definition merely a type alias
type StringType = [Char]
x1 :: StringType
x1 = "hello"

f :: [Char] -> [Char]
f xs = reverse xs

type Password = StringType
type Username = StringType

x :: Password
x = "julielovesbooks"

greet :: Username -> IO()
greet username = print("Hello" ++ username)

newtype Password = Password String deriving Show
newtype Password = Password String
