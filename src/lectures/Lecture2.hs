-- Pattern matching
myNot :: Bool -> Bool
myNot True = False
myNot False = True

isZero :: Int -> Bool
isZero 0 = True
isZero n = False

eval :: Char -> Int -> Int -> Int
eval op x y = case op of
  '+' -> x + y
  '-' -> x - y
  '*' -> x * y
  '/' -> div x y
  _ -> 0

-- Patterns on lists
isEmpty :: [Int] -> Bool
isEmpty [] = True
isEmpty _ = False

sumOfTwoInThree :: [Int] -> Int
sumOfTwoInThree [x, _, y] = x + y
sumOfTwoInThree _ = 0

oneOrTwoZeroes :: [Int] -> Bool
oneOrTwoZeroes l = case l of
  [0] -> True
  [0, 0] -> True
  _ -> False

exactlyLeastTwo :: [Int] -> Bool
exactlyLeastTwo [_, _] = True
exactlyLeastTwo _ = False

--
headOrDef :: Int -> [Int] -> Int
headOrDef def [] = def
headOrDef _ (x : _) = x

dropHead :: [Int] -> [Int]
dropHead [] = []
dropHead (_ : xs) = xs

secondIsZero :: [Int] -> Bool
secondIsZero (_ : 0 : _) = True
secondIsZero _ = False

-- List Recursion
mySum :: [Int] -> Int
mySum [] = 0
mySum (x : xs) = x + mySum xs

-- Non-exhaustive patterns in function example
example True [] = 0
example False [x, y] = x + y

-- Tuples
splitAtPos3 :: [Int] -> ([Int], [Int])
splitAtPos3 l = (take 3 l, drop 3 l)

showTriple :: (Bool, Int, String) -> String
showTriple (b, n, string) =
  if b
    then "The number is: " ++ show n
    else "The string is: " ++ string

showTriple1 :: (Bool, Int, String) -> String
showTriple1 (True, n, _) = "The number is: " ++ show n
showTriple1 (False, _, s) = "The string is: " ++ s

-- data: Products

data User = MkUser String Int Bool
  deriving (Show) -- to display type in GHCi

getUserName :: User -> String
getUserName (MkUser name _ _) = name

getUserAge :: User -> Int
getUserAge (MkUser _ age _) = age

setUserName :: String -> User -> User
setUserName name (MkUser _ age isTired) = MkUser name age isTired

user = MkUser "Dima" 30 True

-- data: Records

data MyUser = MkMyUser {userName :: String, userAge :: Int, userIsTired :: Bool}
  deriving (Show)

peter = MkMyUser {userAge = 30, userIsTired = False, userName = "Peter"}

ivan = peter {userName = "Ivan"}

-- Enums

data Color
  = Red
  | Green
  | Blue

showColor :: Color -> String
showColor c = case c of
  Red -> "red"
  Green -> "green"
  Blue -> "blue"

colorList = map showColor [Red, Blue, Green]

data Result
  = Error String
  | Ok Int
  deriving (Show)

divide :: Int -> Int -> Result
divide _ 0 = Error "Division by zero!"
divide x y = Ok (div x y)

showResult :: Result -> String
showResult (Error msg) = "Error: " ++ msg
showResult (Ok value) = "Ok: " ++ show value

-- Recursive data types

data IntList
  = Empty
  | Cons Int IntList
  deriving (Show)

myListLength :: IntList -> Int
myListLength Empty = 0
myListLength (Cons _ xs) = 1 + myListLength xs

nzeroes :: Int -> IntList
nzeroes 0 = Empty
nzeroes n = Cons 0 (nzeroes (n - 1))

-- Parametric Polymorphism

dup :: a -> (a, a)
dup x = (x, x)

-- Eta-reduction

showInt :: Int -> String
showInt n = show n

showInt1 :: Int -> String
showInt1 = show

onlyEven :: [Int] -> [Int]
-- onlyEven xs = filter even xs
onlyEven = filter even

prod :: [Int] -> [Int] -> [Int]
-- prod xs ys = zipWith (*) xs ys
prod = zipWith (*)

-- Function composition

-- (length . show) True

-- map (length . words) ["Hi all", "a", "bbb"]

-- map (even . length . words) ["Hi all", "a", "bbb"]

takeEven5 :: [[a]] -> [[a]]
-- takeEven5 list = take 5 (filter (\l -> even (length l)) list)
takeEven5 = take 5 . filter (even . length)
