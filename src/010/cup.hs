cup ml = \message -> message ml

getMl aCup = aCup (\ml -> ml)

isEmpty aCup = getMl aCup == 0

drink aCup mlDrink =
  if mlDiff > 0
    then cup mlDiff
    else cup 0
  where
    ml = getMl aCup
    mlDiff = ml - mlDrink

coffeeCup = cup 500

afterManySips = foldl drink coffeeCup [30, 30, 30, 30, 30]