doubleMeInt :: Int -> Int
doubleMeInt x = x + x

doubleSmallNumber :: Int -> Int
doubleSmallNumber x = if x > 100
                    then x
                    else x*2

doubleMe x = x + x