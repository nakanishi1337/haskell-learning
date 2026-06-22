import qualified Data.Map as Map
import Data.Map (Map)

-- 数レベルの深さを持つ入れ子のハッシュ。
-- ハッシュの値がさらにハッシュになっている (3 レベル)。
db :: Map String (Map String (Map String Int))
db = Map.fromList
    [ ("alice", Map.fromList
        [ ("profile", Map.fromList [("age", 30), ("score", 95)]) ])
    , ("bob", Map.fromList
        [ ("profile", Map.fromList [("age", 25)]) ])
    ]

-- Maybe モナドの do 記法で、数レベルの深さまで連続して検索する。
-- 途中で 1 つでも失敗すれば全体が Nothing になる。
lookupAge :: String -> Maybe Int
lookupAge name = do
    user    <- Map.lookup name db
    profile <- Map.lookup "profile" user
    Map.lookup "age" profile

main :: IO ()
main = do
    print (lookupAge "alice")  -- Just 30
    print (lookupAge "bob")    -- Just 25
    print (lookupAge "carol")  -- Nothing
