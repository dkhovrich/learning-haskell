import Data.List

names = [("Peter", "Parker"), ("Garry", "Osborn")]

author = ("Peter", "Parker")

compareLastNames name1 name2 =
  if lastName1 > lastName2
    then GT
    else
      if lastName1 < lastName2
        then LT
        else EQ
  where
    lastName1 = snd name1
    lastName2 = snd name2

compareLastNames1 name1 name2 = compare lastName1 lastName2
  where
    lastName1 = snd name1
    lastName2 = snd name2