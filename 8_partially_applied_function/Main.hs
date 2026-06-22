-- 部分適用関数: 複数引数の関数に一部の引数だけを与えて新しい関数を作る

-- (/) に第 2 引数として 2 を部分適用し、ある数の 2 分の 1 を返す関数
half :: Double -> Double
half = (/ 2)

-- (++) に " [END]" を部分適用し、文字列の末尾に印を追加する関数
appendMark :: String -> String
appendMark = (++ " [END]")

main :: IO ()
main = do
    -- 10 の 2 分の 1 → 5.0
    print (half 10)
    -- 7 の 2 分の 1 → 3.5
    print (half 7)
    -- 末尾に印が付くことを確認
    putStrLn (appendMark "Hello")
    putStrLn (appendMark "World")