module Main where

allEven :: [Integer] -> [Integer]
allEven [] = []
allEven (h:t) = if even h then h : allEven t else allEven t

-- 実装2: リスト内包表記を使う方法
allEven2 :: [Integer] -> [Integer]
allEven2 xs = [x | x <- xs, even x]

main :: IO ()
main = do
  let numbers = [1..10]
  putStrLn ("Even numbers in " ++ show numbers ++ " are: " ++ show (allEven numbers))
  putStrLn ("Even numbers in " ++ show numbers ++ " are: " ++ show (allEven2 numbers))