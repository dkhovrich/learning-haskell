myGCD a b =
  if remainder == 0
    then b
    else myGCD b remainder
  where
    remainder = a `mod` b

sayAmount n = case n of
  1 -> "one"
  2 -> "two"
  n -> "many"