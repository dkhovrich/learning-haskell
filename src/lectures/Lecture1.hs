module Lecture1 where

inc :: Int -> Int
inc x = x + 1

headOrDefault :: Int -> [Int] -> Int
headOrDefault def list =
  if null list
    then def
    else head list

sign :: Int -> String
sign n
  | n == 0 = "Zero"
  | n < 0 = "Negative"
  | otherwise = "Positive"

sameThreeAround :: [Int] -> Bool
sameThreeAround list =
  let firstThree = take 3 list
      lastThree = reverse (take 3 (reverse list))
   in firstThree == lastThree

appendLastTwo :: [Int] -> [Int] -> [Int]
appendLastTwo list1 list2 = lastTwo list1 ++ lastTwo list2
  where
    lastTwo :: [Int] -> [Int]
    lastTwo l = reverse (take 2 (reverse l))

count :: Int -> [Int] -> Int
count n list = go 0 list
  where
    go :: Int -> [Int] -> Int
    go result l =
      if null l
        then result
        else
          if head l == n
            then go (result + 1) (tail l)
            else go result (tail l)

applyToSame :: (Int -> Int -> Int) -> Int -> Int
applyToSame f x = f x x