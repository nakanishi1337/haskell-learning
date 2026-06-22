module Main where

-- 階乗を再帰関数で計算する
factorial :: Integer -> Integer
factorial 0 = 1
factorial n = n * factorial (n - 1)

-- フィボナッチ数列を再帰関数で計算する
fib :: Integer -> Integer
fib 0 = 0
fib 1 = 1
fib n = fib (n - 1) + fib (n - 2)

main :: IO ()
main = do
  putStrLn ("factorial 5 = " ++ show (factorial 5))
  putStrLn ("fib 10 = " ++ show (fib 10))
