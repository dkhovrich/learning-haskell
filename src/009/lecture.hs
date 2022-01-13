add3ToAll [] = []
add3ToAll (x : xs) = (3 + x) : add3ToAll xs

mult3ByAll [] = []
mult3ByAll (x : xs) = (3 * x) : mult3ByAll xs

addBang [] = []
addBang (x : xs) = (x ++ "!") : addBang xs

myMap f [] = []
myMap f (x : xs) = (f x) : myMap f xs

myMap1 f list =
  if null list
    then []
    else f (head list) : myMap f (tail list)

myFilter predicate [] = []
myFilter predicate (x : xs) =
  if predicate x
    then x : myFilter predicate xs
    else myFilter predicate xs

myRemove predicate [] = []
myRemove predicate (x : xs) =
  if predicate x
    then myRemove predicate xs
    else x : myRemove predicate xs

concatAll xs = foldl (++) "" xs

myProduct xs = foldl (*) 1 xs

sumOfSquares xs = foldl (+) 0 (map (^ 2) xs)

myElem x xs = length (filter (\v -> v == x) xs) > 0