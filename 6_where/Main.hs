import Data.Char (isDigit)

-- "$2,345,678.99" のような文字列を数値(Double)に変換する。
parseMoney :: String -> Double
parseMoney = read . normalize . dropDollar
  where
    -- 先頭の '$' を取り除く
    dropDollar ('$' : rest) = rest
    dropDollar s            = s

    -- カンマを取り除き、read が解釈できる形に整える
    normalize s =
      let cleaned = filter (\c -> isDigit c || c == '.') s
      in case cleaned of
           ('.' : _) -> '0' : cleaned   -- ".99" -> "0.99"
           ""        -> "0"
           _         -> cleaned

main :: IO ()
main = do
  print (parseMoney "$2,345,678.99")  -- 2345678.99
  print (parseMoney "$007.50")        -- 7.5
  print (parseMoney "$0.99")          -- 0.99
  print (parseMoney "$1,000")         -- 1000.0
  print (parseMoney "$.99")           -- 0.99
