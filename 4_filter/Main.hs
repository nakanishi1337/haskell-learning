-- filter を使ってリストをソートする関数 (クイックソート)
quicksort :: Ord a => [a] -> [a]
quicksort [] = []
quicksort (pivot:rest) =
    quicksort smaller ++ [pivot] ++ quicksort larger
  where
    smaller = filter (<= pivot) rest
    larger  = filter (> pivot) rest

main :: IO ()
main = do
    print (quicksort [5, 3, 8, 1, 9, 2, 7])
    print (quicksort "haskell")
