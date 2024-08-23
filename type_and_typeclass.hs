removeNonUppercase :: [Char] -> [Char]
removeNonUppercase st = [c | c <- st, c `elem` ['A'..'Z']]

addThreeNumners :: Int -> Int -> Int -> Int
addThreeNumners a b c = a + b + c

circumference :: Float -> Float
circumference r = 2 * pi * r