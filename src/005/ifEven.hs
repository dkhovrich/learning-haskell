inc n = n + 1

ifEven myFunction n =
  if even n
    then myFunction n
    else n

ifEvenInc = ifEven inc