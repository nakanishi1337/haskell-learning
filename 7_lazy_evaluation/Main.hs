-- x で始まる「2 つ跳び」の数列を返す関数
twoStep :: Int -> [Int]
twoStep x = [x, x + 2 ..]

-- y で始まる「4 つ跳び」の数列を返す関数
fourStep :: Int -> [Int]
fourStep y = [y, y + 4 ..]

-- 上の 2 つの数列を組み合わせて、x + y で始まる「6 つ跳び」の数列
eightStep :: Int -> Int -> [Int]
eightStep x y = zipWith (+) (twoStep x) (fourStep y)

main :: IO ()
main = do
    -- 遅延評価なので無限数列でも take で必要な分だけ取り出せる
    putStrLn "twoStep 1  (2 つ跳び):"
    print (take 10 (twoStep 1))

    putStrLn "fourStep 2 (4 つ跳び):"
    print (take 10 (fourStep 2))

    putStrLn "eightStep 1 2 (x+y で始まる 6 つ跳び):"
    print (take 10 (eightStep 1 2))
