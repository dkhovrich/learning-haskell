isEmpty [] = True
isEmpty _ = False

myHead (x : xs) = x
myHead [] = error "Empty list has no head"

myTail (_ : x) = x
myTail [] = error "Empty list has no tail"