numbers = [1 .. 10]

takeLast n aList = reverse (take n (reverse aList))

subseq start end aList = take (end - start) (drop start aList)