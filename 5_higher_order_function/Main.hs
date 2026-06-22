-- リストと比較関数を受け取り、ソートされたリストを返す関数 (クイックソート)
-- 比較関数 cmp は 2 つの引数を比較し、a が b より前に来るべきなら True を返す
superSort :: (a -> a -> Bool) -> [a] -> [a]
superSort _   []           = []
superSort cmp (pivot:rest) =
    superSort cmp smaller ++ [pivot] ++ superSort cmp larger
  where
    smaller = filter (\x -> cmp x pivot) rest
    larger  = filter (\x -> not (cmp x pivot)) rest

main :: IO ()
main = do
    -- 昇順にソート
    print (superSort (<=) [5, 3, 8, 1, 9, 2, 7])
    -- 降順にソート
    print (superSort (>=) [5, 3, 8, 1, 9, 2, 7])
    -- 文字列も比較関数で並べ替え可能
    print (superSort (<=) "haskell")
