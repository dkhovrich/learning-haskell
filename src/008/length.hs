myLength [] = 0
myLength xs = 1 + myLength (tail xs)

myLength1 [] = 0
myLength1 (x:xs) = 1 + myLength xs