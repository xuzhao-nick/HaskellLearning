reverseLine :: IO()
reverseLine = getLine >>= (print . reverse)

reverseLine1 :: IO()
reverseLine1 = do
    string <- getLine
    print(reverse string)
