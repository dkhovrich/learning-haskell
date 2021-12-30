isEventInc n =
  if even n
    then n + 1
    else n

isEvenDouble n =
  if even n
    then n * 2
    else n

isEvenSquare n =
  if even n
    then n ^ 2
    else n

ifEven myFunction n =
  if even n
    then myFunction n
    else n

inc n = n + 1

double n = n * 2

square n = n ^ 2

-- ifEven (\x -> x^3) 4